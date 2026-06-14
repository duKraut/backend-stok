package com.stok.user;

import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;
import java.util.Optional;
import java.util.UUID;

@ApplicationScoped
public class PasswordResetTokenRepository implements PanacheRepositoryBase<PasswordResetToken, UUID> {

    public Optional<PasswordResetToken> findByToken(UUID token) {
        return find("token", token).firstResultOptional();
    }
}
