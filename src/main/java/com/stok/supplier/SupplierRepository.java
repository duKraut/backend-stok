package com.stok.supplier;

import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;
import java.util.UUID;

@ApplicationScoped
public class SupplierRepository implements PanacheRepositoryBase<Supplier, UUID> {
}
