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
        validateDocumentDuplicatedOnCreate(supplier.document);

        Long lastCode = repository.findLastCode();

        supplier.code = lastCode + 1;

        repository.persist(supplier);

        return supplier;
    }

    @Transactional
    public Supplier update(UUID id, Supplier data) {

        Supplier supplier = findById(id);

        validate(data);
        validateDocumentDuplicatedOnUpdate(id, data.document);

        supplier.name = data.name;
        supplier.document = data.document;
        supplier.category = data.category;
        supplier.personType = data.personType;
        supplier.contactName = data.contactName;
        supplier.email = data.email;
        supplier.phone = data.phone;
        supplier.address = data.address;
        supplier.zipCode = data.zipCode;
        supplier.city = data.city;
        supplier.neighborhood = data.neighborhood;
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

        if (supplier.category == null || supplier.category.isBlank()) {
            throw new IllegalArgumentException("Categoria obrigatória");
        }

        if (supplier.email == null || supplier.email.isBlank()) {
            throw new IllegalArgumentException("Email obrigatório");
        }

        if (supplier.phone == null || supplier.phone.isBlank()) {
            throw new IllegalArgumentException("Telefone obrigatório");
        }
    }

    private void validateDocumentDuplicatedOnCreate(String document) {
        Supplier existing = repository.find("document", document).firstResult();

        if (existing != null) {
            throw new IllegalArgumentException(
                    "Já existe um fornecedor cadastrado com este CPF/CNPJ.");
        }
    }

    private void validateDocumentDuplicatedOnUpdate(UUID id, String document) {
        Supplier existing = repository.find("document", document).firstResult();

        if (existing != null && !existing.id.equals(id)) {
            throw new IllegalArgumentException(
                    "Já existe um fornecedor cadastrado com este CPF/CNPJ.");
        }
    }
}