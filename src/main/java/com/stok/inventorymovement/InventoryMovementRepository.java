package com.stok.inventorymovement;

import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;

import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class InventoryMovementRepository implements PanacheRepositoryBase<InventoryMovement, UUID> {

    public List<InventoryMovement> findByItemId(UUID itemId) {
        return find("item.id = ?1 order by codigo desc", itemId).list();
    }
}
