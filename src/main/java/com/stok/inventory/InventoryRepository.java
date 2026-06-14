package com.stok.inventory;

import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;

import java.util.UUID;

@ApplicationScoped
public class InventoryRepository implements PanacheRepositoryBase<Inventory, UUID> {

    public long findLastCodigo() {
        Inventory item = find("order by codigo desc").firstResult();
        return item != null ? item.codigo : 0L;
    }
}
