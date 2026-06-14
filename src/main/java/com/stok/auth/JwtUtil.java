package com.stok.auth;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import jakarta.enterprise.context.ApplicationScoped;
import org.eclipse.microprofile.config.inject.ConfigProperty;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.UUID;

@ApplicationScoped
public class JwtUtil {

    @ConfigProperty(name = "stok.jwt.secret")
    String secret;

    private static final long EXPIRATION_MS = 86_400_000L;

    private SecretKey getKey() {
        try {
            byte[] hash = MessageDigest.getInstance("SHA-256")
                    .digest(secret.getBytes(StandardCharsets.UTF_8));
            return new SecretKeySpec(hash, "AES");
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public String generate(UUID userId, String email, String role) {
        return Jwts.builder()
                .subject(userId.toString())
                .claim("email", email)
                .claim("role", role)
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + EXPIRATION_MS))
                .encryptWith(getKey(), Jwts.KEY.DIRECT, Jwts.ENC.A256GCM)
                .compact();
    }

    public Claims parse(String token) {
        return Jwts.parser()
                .decryptWith(getKey())
                .build()
                .parseEncryptedClaims(token)
                .getPayload();
    }
}
