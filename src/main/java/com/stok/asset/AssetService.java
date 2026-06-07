package com.stok.asset;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class AssetService {

    @Inject
    AssetRepository repository;

    public List<Asset> list() {
        return repository.listAll();
    }

    public Asset findById(UUID id) {
        return repository.findByIdOptional(id)
                .orElseThrow(() -> new RuntimeException("Ativo não encontrado"));
    }

    @Transactional
    public Asset create(Asset asset) {
        validate(asset);
        validateSerialNumberDuplicatedOnCreate(asset.serialNumber);

        asset.tombamento = repository.findLastTombamento() + 1;

        repository.persist(asset);

        return asset;
    }

    @Transactional
    public Asset update(UUID id, Asset data) {
        Asset asset = findById(id);

        validate(data);
        validateSerialNumberDuplicatedOnUpdate(id, data.serialNumber);

        asset.name = data.name;
        asset.specs = data.specs;
        asset.brand = data.brand;
        asset.model = data.model;
        asset.serialNumber = data.serialNumber;
        asset.category = data.category;
        asset.conservationStatus = data.conservationStatus;
        asset.department = data.department;
        asset.location = data.location;
        asset.responsible = data.responsible;
        asset.acquisitionDate = data.acquisitionDate;
        asset.acquisitionValue = data.acquisitionValue;
        asset.supplier = data.supplier;
        asset.nfNumber = data.nfNumber;
        asset.nfEmissionDate = data.nfEmissionDate;
        asset.nfAccessKey = data.nfAccessKey;
        asset.warrantyUntil = data.warrantyUntil;
        asset.usefulLifeYears = data.usefulLifeYears;
        asset.depreciationRate = data.depreciationRate;
        asset.residualValue = data.residualValue;
        asset.depreciationMethod = data.depreciationMethod;
        asset.active = data.active;

        return asset;
    }

    @Transactional
    public void deactivate(UUID id) {
        Asset asset = findById(id);
        asset.active = false;
    }

    private void validate(Asset asset) {
        if (asset.name == null || asset.name.isBlank()) {
            throw new IllegalArgumentException("Nome obrigatório");
        }

        if (asset.brand == null || asset.brand.isBlank()) {
            throw new IllegalArgumentException("Marca obrigatória");
        }

        if (asset.model == null || asset.model.isBlank()) {
            throw new IllegalArgumentException("Modelo obrigatório");
        }

        if (asset.category == null || asset.category.isBlank()) {
            throw new IllegalArgumentException("Categoria obrigatória");
        }

        if (asset.conservationStatus == null) {
            throw new IllegalArgumentException("Estado de conservação obrigatório");
        }

        if (asset.department == null || asset.department.isBlank()) {
            throw new IllegalArgumentException("Departamento obrigatório");
        }

        if (asset.acquisitionDate == null) {
            throw new IllegalArgumentException("Data de aquisição obrigatória");
        }

        if (asset.acquisitionDate.isAfter(LocalDate.now())) {
            throw new IllegalArgumentException("Data de aquisição não pode ser futura");
        }

        if (asset.acquisitionValue == null) {
            throw new IllegalArgumentException("Valor de aquisição obrigatório");
        }

        if (asset.acquisitionValue.compareTo(BigDecimal.ZERO) <= 0) {
            throw new IllegalArgumentException("Valor de aquisição deve ser maior que zero");
        }

        if (asset.warrantyUntil != null && asset.warrantyUntil.isBefore(asset.acquisitionDate)) {
            throw new IllegalArgumentException("Garantia não pode ser anterior à data de aquisição");
        }

        if (asset.usefulLifeYears != null && asset.usefulLifeYears <= 0) {
            throw new IllegalArgumentException("Vida útil deve ser maior que zero");
        }

        if (asset.depreciationRate != null &&
                (asset.depreciationRate.compareTo(BigDecimal.ZERO) < 0 ||
                 asset.depreciationRate.compareTo(new BigDecimal("100")) > 0)) {
            throw new IllegalArgumentException("Taxa de depreciação deve estar entre 0 e 100");
        }

        if (asset.nfEmissionDate != null && asset.nfEmissionDate.isAfter(LocalDate.now())) {
            throw new IllegalArgumentException("Data de emissão da NF não pode ser futura");
        }
    }

    private void validateSerialNumberDuplicatedOnCreate(String serialNumber) {
        if (serialNumber == null || serialNumber.isBlank()) return;

        Asset existing = repository.find("serialNumber", serialNumber).firstResult();
        if (existing != null) {
            throw new IllegalArgumentException("Já existe um ativo cadastrado com este número de série.");
        }
    }

    private void validateSerialNumberDuplicatedOnUpdate(UUID id, String serialNumber) {
        if (serialNumber == null || serialNumber.isBlank()) return;

        Asset existing = repository.find("serialNumber", serialNumber).firstResult();
        if (existing != null && !existing.id.equals(id)) {
            throw new IllegalArgumentException("Já existe um ativo cadastrado com este número de série.");
        }
    }
}
