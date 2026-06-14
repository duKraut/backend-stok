package com.stok.auth;

import jakarta.annotation.Priority;
import jakarta.inject.Inject;
import jakarta.inject.Singleton;
import jakarta.ws.rs.Priorities;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerRequestFilter;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.Provider;

@Provider
@Singleton
@Priority(Priorities.AUTHENTICATION)
public class JwtFilter implements ContainerRequestFilter {

    @Inject
    JwtUtil jwtUtil;

    private static final String AUTH_HEADER = "Authorization";
    private static final String BEARER_PREFIX = "Bearer ";

    @Override
    public void filter(ContainerRequestContext ctx) {
        String path = ctx.getUriInfo().getPath();
        String normalizedPath = path.startsWith("/") ? path.substring(1) : path;

        if (normalizedPath.startsWith("auth/")) {
            return;
        }

        String header = ctx.getHeaderString(AUTH_HEADER);
        if (header == null || !header.startsWith(BEARER_PREFIX)) {
            ctx.abortWith(Response.status(Response.Status.UNAUTHORIZED)
                    .entity("{\"message\":\"Token não fornecido.\"}")
                    .build());
            return;
        }

        String token = header.substring(BEARER_PREFIX.length());
        try {
            var claims = jwtUtil.parse(token);
            ctx.setProperty("jwt_userId", claims.getSubject());
            ctx.setProperty("jwt_role", claims.get("role", String.class));
        } catch (Exception e) {
            ctx.abortWith(Response.status(Response.Status.UNAUTHORIZED)
                    .entity("{\"message\":\"Token inválido ou expirado.\"}")
                    .build());
        }
    }
}
