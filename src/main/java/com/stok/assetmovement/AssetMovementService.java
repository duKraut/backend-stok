package com.stok.assetmovement;

import com.stok.asset.Asset;
import com.stok.asset.AssetRepository;
import com.stok.asset.ConservationStatus;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;

import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class AssetMovementService {

    @Inject
    AssetMovementRepository repository;

    @Inject
    AssetRepository assetRepository;

    public List<AssetMovement> list() {
        return repository.find("order by codigo desc").list();
    }

    public List<AssetMovement> listByAsset(UUID assetId) {
        return repository.findByAssetId(assetId);
    }

    public AssetMovement findById(UUID id) {
        return repository.findByIdOptional(id)
                .orElseThrow(() -> new RuntimeException("Movimentação não encontrada"));
    }

    @Transactional
    public AssetMovement create(AssetMovement movement) {
        validate(movement);

        Asset asset = assetRepository.findByIdOptional(movement.asset.id)
                .orElseThrow(() -> new IllegalArgumentException("Ativo não encontrado"));

        if (movement.fromDepartment == null || movement.fromDepartment.isBlank()) {
            movement.fromDepartment = asset.department;
        }

        switch (movement.type) {
            case TRANSFERENCIA -> {
                asset.department = movement.toDepartment;
                if (movement.responsible != null && !movement.responsible.isBlank()) {
                    asset.responsible = movement.responsible;
                }
            }
            case MANUTENCAO -> {
                if (movement.newConservationStatus != null) {
                    asset.conservationStatus = movement.newConservationStatus;
                } else {
                    asset.conservationStatus = ConservationStatus.MANUTENCAO;
                }
            }
            case ESTADO -> {
                if (Boolean.TRUE.equals(movement.decommission)) {
                    asset.active = false;
                } else if (movement.newConservationStatus != null) {
                    asset.conservationStatus = movement.newConservationStatus;
                }
            }
        }

        movement.asset = asset;
        repository.persist(movement);
        return movement;
    }

    private void validate(AssetMovement movement) {
        if (movement.type == null) {
            throw new IllegalArgumentException("Tipo de movimentação obrigatório");
        }
        if (movement.asset == null || movement.asset.id == null) {
            throw new IllegalArgumentException("Bem patrimonial obrigatório");
        }
        if (movement.responsible == null || movement.responsible.isBlank()) {
            throw new IllegalArgumentException("Responsável obrigatório");
        }
        if (movement.date == null) {
            throw new IllegalArgumentException("Data da movimentação obrigatória");
        }

        if (movement.type == MovementType.TRANSFERENCIA) {
            if (movement.toDepartment == null || movement.toDepartment.isBlank()) {
                throw new IllegalArgumentException("Departamento de destino obrigatório para Transferência");
            }
        }

        if (movement.type == MovementType.MANUTENCAO) {
            if (movement.maintenanceType == null) {
                throw new IllegalArgumentException("Tipo de manutenção obrigatório");
            }
        }

        if (movement.type == MovementType.ESTADO) {
            if (!Boolean.TRUE.equals(movement.decommission) && movement.newConservationStatus == null) {
                throw new IllegalArgumentException("Novo estado obrigatório");
            }
            if (Boolean.TRUE.equals(movement.decommission) &&
                    (movement.decommissionReason == null || movement.decommissionReason.isBlank())) {
                throw new IllegalArgumentException("Motivo da baixa obrigatório");
            }
        }
    }
}
