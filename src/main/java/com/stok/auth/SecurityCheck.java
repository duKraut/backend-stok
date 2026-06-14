package com.stok.auth;

import com.stok.user.UserModulePermissionRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.ForbiddenException;
import jakarta.ws.rs.container.ContainerRequestContext;

import java.util.UUID;

@ApplicationScoped
public class SecurityCheck {

    @Inject
    UserModulePermissionRepository moduleRepository;

    public void requireAdmin(ContainerRequestContext ctx) {
        if (!"ADMINISTRADOR".equals(role(ctx))) {
            throw new ForbiddenException("Acesso restrito ao administrador.");
        }
    }

    @Transactional(Transactional.TxType.SUPPORTS)
    public void requireModule(String module, ContainerRequestContext ctx) {
        String role = role(ctx);
        if ("ADMINISTRADOR".equals(role)) return;
        UUID userId = userId(ctx);
        boolean hasModule = moduleRepository.findByUserId(userId)
                .stream().anyMatch(p -> module.equals(p.module));
        if (!hasModule) {
            throw new ForbiddenException("Acesso ao módulo não autorizado.");
        }
    }

    public void requireEdit(ContainerRequestContext ctx) {
        if ("VISUALIZADOR".equals(role(ctx))) {
            throw new ForbiddenException("Perfil Visualizador não possui permissão para esta ação.");
        }
    }

    public void requireDelete(ContainerRequestContext ctx) {
        String role = role(ctx);
        if ("VISUALIZADOR".equals(role) || "OPERADOR".equals(role)) {
            throw new ForbiddenException("Apenas Gerentes e Administradores podem desativar registros.");
        }
    }

    private String role(ContainerRequestContext ctx) {
        return (String) ctx.getProperty("jwt_role");
    }

    private UUID userId(ContainerRequestContext ctx) {
        return UUID.fromString((String) ctx.getProperty("jwt_userId"));
    }
}
