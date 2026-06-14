package com.stok.user;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public class UserResponse {
    public UUID id;
    public String email;
    public String fullName;
    public String role;
    public String department;
    public Boolean active;
    public LocalDateTime lastLogin;
    public LocalDateTime createdAt;
    public List<String> modules;

    public static UserResponse from(User user, List<String> modules) {
        UserResponse r = new UserResponse();
        r.id = user.id;
        r.email = user.email;
        r.fullName = user.fullName;
        r.role = user.role.name();
        r.department = user.department;
        r.active = user.active;
        r.lastLogin = user.lastLogin;
        r.createdAt = user.createdAt;
        r.modules = modules;
        return r;
    }
}
