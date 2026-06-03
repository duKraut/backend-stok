package com.stok.supplier;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;

import java.util.List;
import java.util.UUID;

@ApplicationScoped
public class SupplierService {

    @Inject
    SupplierRepository repository;

    public List<Supplier> list() {
        return repository.listAll();
    }

    public Supplier findById(UUID id) {
        return repository.findByIdOptional(id)
                .orElseThrow(() ->
                        new RuntimeException("Fornecedor não encontrado"));
    }

    @Transactional
    public Supplier create(Supplier supplier) {

        validate(supplier);

        Long lastCode = repository.findLastCode();

        supplier.code = lastCode + 1;

        repository.persist(supplier);

        return supplier;
    }

    @Transactional
    public Supplier update(UUID id, Supplier data) {

        Supplier supplier = findById(id);

        validate(data);

        supplier.name = data.name;
        supplier.document = data.document;
        supplier.category = data.category;
        supplier.active = data.active;

        return supplier;
    }

    @Transactional
    public void deactivate(UUID id) {

        Supplier supplier = findById(id);

        supplier.active = false;
    }

    private void validate(Supplier supplier) {

        if (supplier.name == null || supplier.name.isBlank()) {
            throw new IllegalArgumentException("Nome obrigatório");
        }

        if (supplier.document == null || supplier.document.isBlank()) {
            throw new IllegalArgumentException("Documento obrigatório");
        }
    }
}