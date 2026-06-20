package com.stok.assetmovement;

import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;

import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class AssetMovementRepository implements PanacheRepositoryBase<AssetMovement, UUID> {

    public List<AssetMovement> findByAssetId(UUID assetId) {
        return find("asset.id = ?1 order by codigo desc", assetId).list();
    }
}
