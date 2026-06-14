package com.stok.startup;

import com.stok.user.*;
import io.quarkus.runtime.StartupEvent;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.event.Observes;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

@ApplicationScoped
public class StartupBean {

    @Inject
    UserRepository userRepository;

    @Inject
    UserModulePermissionRepository moduleRepository;

    private static final List<String> ALL_MODULES = List.of(
        "ALMOXARIFADO", "PATRIMONIO", "FORNECEDORES", "RELATORIOS", "CONFIGURACOES"
    );

    @Transactional
    public void onStart(@Observes StartupEvent event) {
        if (userRepository.count() == 0) {
            User admin = new User();
            admin.email = "admin@stok.com";
            admin.fullName = "Administrador";
            admin.passwordHash = BCrypt.hashpw("Admin@123", BCrypt.gensalt(10));
            admin.role = UserRole.ADMINISTRADOR;
            admin.department = "TI";
            admin.active = true;
            userRepository.persist(admin);

            for (String module : ALL_MODULES) {
                UserModulePermission perm = new UserModulePermission();
                perm.user = admin;
                perm.module = module;
                moduleRepository.persist(perm);
            }
        }
    }
}
