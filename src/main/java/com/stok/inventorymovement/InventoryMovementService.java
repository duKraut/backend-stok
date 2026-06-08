package com.stok.inventorymovement;

import com.stok.inventory.Inventory;
import com.stok.inventory.InventoryRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;

import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class InventoryMovementService {

    @Inject
    InventoryMovementRepository repository;

    @Inject
    InventoryRepository itemRepository;

    public List<InventoryMovement> list() {
        return repository.find("order by date desc, createdAt desc").list();
    }

    public List<InventoryMovement> listByItem(UUID itemId) {
        return repository.findByItemId(itemId);
    }

    public InventoryMovement findById(UUID id) {
        return repository.findByIdOptional(id)
                .orElseThrow(() -> new RuntimeException("Movimentação não encontrada"));
    }

    @Transactional
    public InventoryMovement create(InventoryMovement movement) {
        validate(movement);

        Inventory item = itemRepository.findByIdOptional(movement.item.id)
                .orElseThrow(() -> new IllegalArgumentException("Item não encontrado"));

        if (movement.type == MovementType.SAIDA && movement.quantity > item.currentStock) {
            throw new IllegalArgumentException(
                    "Estoque insuficiente. Saldo atual: " + item.currentStock + " " + item.unit.name() + ".");
        }

        if (movement.type == MovementType.ENTRADA) {
            item.currentStock += movement.quantity;
        } else {
            item.currentStock -= movement.quantity;
        }

        movement.item = item;
        repository.persist(movement);
        return movement;
    }

    private void validate(InventoryMovement movement) {
        if (movement.item == null || movement.item.id == null) {
            throw new IllegalArgumentException("Item obrigatório");
        }
        if (movement.type == null) {
            throw new IllegalArgumentException("Tipo de movimentação obrigatório");
        }
        if (movement.quantity <= 0) {
            throw new IllegalArgumentException("Quantidade deve ser maior que zero");
        }
        if (movement.responsible == null || movement.responsible.isBlank()) {
            throw new IllegalArgumentException("Responsável obrigatório");
        }
        if (movement.date == null) {
            throw new IllegalArgumentException("Data obrigatória");
        }
        if (movement.type == MovementType.SAIDA &&
                (movement.sector == null || movement.sector.isBlank())) {
            throw new IllegalArgumentException("Setor de destino obrigatório para Saída");
        }
    }
}
