package com.stok.auth;

import java.util.List;
import java.util.UUID;

public class LoginResponse {
    public String token;
    public UUID userId;
    public String email;
    public String fullName;
    public String role;
    public List<String> modules;

    public LoginResponse(String token, UUID userId, String email, String fullName, String role, List<String> modules) {
        this.token = token;
        this.userId = userId;
        this.email = email;
        this.fullName = fullName;
        this.role = role;
        this.modules = modules;
    }
}
