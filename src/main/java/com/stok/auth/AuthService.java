package com.stok.auth;

import com.stok.user.*;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import org.mindrot.jbcrypt.BCrypt;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@ApplicationScoped
public class AuthService {

    @Inject
    UserRepository userRepository;

    @Inject
    UserModulePermissionRepository moduleRepository;

    @Inject
    PasswordResetTokenRepository tokenRepository;

    @Inject
    JwtUtil jwtUtil;

    @Inject
    EmailService emailService;

    @Transactional
    public LoginResponse login(LoginRequest req) {
        User user = userRepository.findByEmail(req.email)
                .orElseThrow(() -> new IllegalArgumentException("E-mail ou senha inválidos."));

        if (!user.active) {
            throw new IllegalArgumentException("Usuário inativo. Contate o administrador.");
        }

        if (!BCrypt.checkpw(req.password, user.passwordHash)) {
            throw new IllegalArgumentException("E-mail ou senha inválidos.");
        }

        user.lastLogin = LocalDateTime.now();

        List<String> modules = moduleRepository.findByUserId(user.id)
                .stream().map(m -> m.module).collect(Collectors.toList());

        String token = jwtUtil.generate(user.id, user.email, user.role.name());
        return new LoginResponse(token, user.id, user.email, user.fullName, user.role.name(), modules);
    }

    @Transactional
    public void forgotPassword(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("E-mail não encontrado."));

        PasswordResetToken resetToken = new PasswordResetToken();
        resetToken.user = user;
        resetToken.expiresAt = LocalDateTime.now().plusHours(1);
        tokenRepository.persist(resetToken);

        emailService.sendPasswordReset(user.email, user.fullName, resetToken.token.toString());
    }

    @Transactional
    public void resetPassword(String tokenStr, String newPassword) {
        UUID tokenUUID;
        try {
            tokenUUID = UUID.fromString(tokenStr);
        } catch (Exception e) {
            throw new IllegalArgumentException("Token inválido.");
        }

        PasswordResetToken resetToken = tokenRepository.findByToken(tokenUUID)
                .orElseThrow(() -> new IllegalArgumentException("Token inválido ou expirado."));

        if (resetToken.used) {
            throw new IllegalArgumentException("Token já utilizado.");
        }

        if (resetToken.expiresAt.isBefore(LocalDateTime.now())) {
            throw new IllegalArgumentException("Token expirado.");
        }

        resetToken.user.passwordHash = BCrypt.hashpw(newPassword, BCrypt.gensalt(10));
        resetToken.used = true;
    }
}
