package com.stok.supplier;

import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;
import java.util.UUID;

@ApplicationScoped
public class SupplierRepository implements PanacheRepositoryBase<Supplier, UUID> {

    public Long findLastCode() {
        Supplier supplier = find(
                "order by code desc"
        ).firstResult();

        return supplier != null ? supplier.code : 0L;
    }
}
