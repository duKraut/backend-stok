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
    SupplierService service;

    @GET
    public List<Supplier> list() {
        return service.list();
    }

    @GET
    @Path("/{id}")
    public Supplier findById(@PathParam("id") UUID id) {
        return service.findById(id);
    }

    @POST
    public Supplier create(Supplier supplier) {
        return service.create(supplier);
    }

    @PUT
    @Path("/{id}")
    public Supplier update(@PathParam("id") UUID id, Supplier data) {
        return service.update(id, data);
    }

    @DELETE
    @Path("/{id}")
    public void delete(@PathParam("id") UUID id) {
        service.deactivate(id);
    }
}