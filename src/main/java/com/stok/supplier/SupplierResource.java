package com.stok.supplier;

import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import java.util.List;
import java.util.UUID;
import io.quarkus.panache.common.Sort;

@Path("/suppliers")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class SupplierResource {

    @Inject
    SupplierRepository repository;

    @GET
    public List<Supplier> list() {
        return repository.listAll(Sort.by("createdAt").descending());
    }

    @GET
    @Path("/{id}")
    public Supplier findById(@PathParam("id") UUID id) {
        return repository.findByIdOptional(id)
                .orElseThrow(() -> new NotFoundException("Fornecedor não encontrado"));
    }

    @POST
    @Transactional
    public Supplier create(Supplier supplier) {
        repository.persist(supplier);
        return supplier;
    }

    @PUT
    @Path("/{id}")
    @Transactional
    public Supplier update(@PathParam("id") UUID id, Supplier data) {
        Supplier supplier = findById(id);

        supplier.name = data.name;
        supplier.document = data.document;
        supplier.category = data.category;
        supplier.active = data.active;

        return supplier;
    }

    @DELETE
    @Path("/{id}")
    @Transactional
    public void delete(@PathParam("id") UUID id) {
        Supplier supplier = findById(id);
        supplier.active = false;
    }
}