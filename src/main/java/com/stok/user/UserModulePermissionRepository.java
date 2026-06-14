package com.stok.user;

import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class UserModulePermissionRepository implements PanacheRepositoryBase<UserModulePermission, UUID> {

    public List<UserModulePermission> findByUserId(UUID userId) {
        return find("user.id = ?1", userId).list();
    }

    public void deleteByUserId(UUID userId) {
        delete("user.id = ?1", userId);
    }
}
