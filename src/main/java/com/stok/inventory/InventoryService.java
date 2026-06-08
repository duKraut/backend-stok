package com.stok.inventory;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;

import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class InventoryService {

    @Inject
    InventoryRepository repository;

    public List<Inventory> list() {
        return repository.find("order by codigo asc").list();
    }

    public Inventory findById(UUID id) {
        return repository.findByIdOptional(id)
                .orElseThrow(() -> new RuntimeException("Item não encontrado"));
    }

    @Transactional
    public Inventory create(Inventory item) {
        validate(item);
        item.codigo = repository.findLastCodigo() + 1;
        item.currentStock = 0;
        repository.persist(item);
        return item;
    }

    @Transactional
    public Inventory update(UUID id, Inventory data) {
        Inventory item = findById(id);
        validate(data);

        item.name = data.name;
        item.brand = data.brand;
        item.category = data.category;
        item.location = data.location;
        item.description = data.description;
        item.unit = data.unit;
        item.minStock = data.minStock;
        item.active = data.active;

        return item;
    }

    @Transactional
    public void deactivate(UUID id) {
        Inventory item = findById(id);
        item.active = false;
    }

    private void validate(Inventory item) {
        if (item.name == null || item.name.isBlank()) {
            throw new IllegalArgumentException("Nome obrigatório");
        }
        if (item.category == null || item.category.isBlank()) {
            throw new IllegalArgumentException("Categoria obrigatória");
        }
        if (item.unit == null) {
            throw new IllegalArgumentException("Unidade de medida obrigatória");
        }
        if (item.minStock < 0) {
            throw new IllegalArgumentException("Estoque mínimo não pode ser negativo");
        }
    }
}
