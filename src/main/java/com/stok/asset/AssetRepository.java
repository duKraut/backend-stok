package com.stok.asset;

import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;
import java.util.UUID;

@ApplicationScoped
public class AssetRepository implements PanacheRepositoryBase<Asset, UUID>{

    public Long findLastTombamento() {
        Asset asset = find(
                "order by tombamento desc"
        ).firstResult();

        return asset != null ? asset.tombamento : 0L;
    }
}
