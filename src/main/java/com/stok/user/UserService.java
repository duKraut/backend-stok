package com.stok.user;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@ApplicationScoped
public class UserService {

    @Inject
    UserRepository repository;

    @Inject
    UserModulePermissionRepository moduleRepository;

    @Transactional
    public List<UserResponse> list() {
        return repository.listAll().stream()
                .map(u -> UserResponse.from(u, getModules(u.id)))
                .collect(Collectors.toList());
    }

    @Transactional
    public UserResponse findById(UUID id) {
        User user = repository.findByIdOptional(id)
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));
        return UserResponse.from(user, getModules(id));
    }

    @Transactional
    public UserResponse create(UserRequest req) {
        if (repository.findByEmail(req.email).isPresent()) {
            throw new IllegalArgumentException("E-mail já cadastrado.");
        }

        User user = new User();
        user.email = req.email;
        user.fullName = req.fullName;
        user.passwordHash = BCrypt.hashpw(req.password, BCrypt.gensalt(10));
        user.role = UserRole.valueOf(req.role.toUpperCase());
        user.department = req.department;
        user.active = req.active != null ? req.active : true;

        repository.persist(user);
        persistModules(user, req.modules);

        return UserResponse.from(user, req.modules != null ? req.modules : List.of());
    }

    @Transactional
    public UserResponse update(UUID id, UserRequest req) {
        User user = repository.findByIdOptional(id)
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));

        repository.findByEmail(req.email).ifPresent(existing -> {
            if (!existing.id.equals(id)) {
                throw new IllegalArgumentException("E-mail já cadastrado.");
            }
        });

        user.email = req.email;
        user.fullName = req.fullName;
        user.role = UserRole.valueOf(req.role.toUpperCase());
        user.department = req.department;
        user.active = req.active != null ? req.active : user.active;

        if (req.password != null && !req.password.isBlank()) {
            user.passwordHash = BCrypt.hashpw(req.password, BCrypt.gensalt(10));
        }

        moduleRepository.deleteByUserId(id);
        persistModules(user, req.modules);

        return UserResponse.from(user, req.modules != null ? req.modules : List.of());
    }

    @Transactional
    public void deactivate(UUID id) {
        User user = repository.findByIdOptional(id)
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));
        user.active = false;
    }

    private List<String> getModules(UUID userId) {
        return moduleRepository.findByUserId(userId)
                .stream()
                .map(m -> m.module)
                .collect(Collectors.toList());
    }

    @Transactional
    public UserResponse updateSelf(UUID userId, UpdateSelfRequest req) {
        User user = repository.findByIdOptional(userId)
                .orElseThrow(() -> new RuntimeException("Usuário não encontrado"));

        if (req.email != null && !req.email.isBlank() && !req.email.equals(user.email)) {
            repository.findByEmail(req.email).ifPresent(existing -> {
                if (!existing.id.equals(userId))
                    throw new IllegalArgumentException("E-mail já cadastrado.");
            });
            user.email = req.email;
        }

        if (req.newPassword != null && !req.newPassword.isBlank()) {
            if (req.currentPassword == null || !BCrypt.checkpw(req.currentPassword, user.passwordHash))
                throw new IllegalArgumentException("Senha atual incorreta.");
            user.passwordHash = BCrypt.hashpw(req.newPassword, BCrypt.gensalt(10));
        }

        return UserResponse.from(user, getModules(userId));
    }

    private void persistModules(User user, List<String> modules) {
        if (modules == null) return;
        for (String module : modules) {
            UserModulePermission perm = new UserModulePermission();
            perm.user = user;
            perm.module = module;
            moduleRepository.persist(perm);
        }
    }
}
