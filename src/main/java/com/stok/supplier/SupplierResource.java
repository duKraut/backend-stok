package com.stok.supplier;

import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import java.util.List;
import java.util.UUID;
import io.quarkus.panache.common.Sort;
import jakarta.ws.rs.core.Response;

@Path("/suppliers")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class SupplierResource {

    public record ErrorResponse(String message) {}

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
    public Response create(Supplier supplier) {
        try {
            return Response.ok(service.create(supplier)).build();
        } catch (IllegalArgumentException e) {
            Response.Status status = isDuplicateError(e)
                    ? Response.Status.CONFLICT
                    : Response.Status.BAD_REQUEST;
            return Response.status(status).entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    @PUT
    @Path("/{id}")
    public Response update(@PathParam("id") UUID id, Supplier data) {
        try {
            return Response.ok(service.update(id, data)).build();
        } catch (IllegalArgumentException e) {
            Response.Status status = isDuplicateError(e)
                    ? Response.Status.CONFLICT
                    : Response.Status.BAD_REQUEST;
            return Response.status(status).entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    private boolean isDuplicateError(IllegalArgumentException e) {
        return e.getMessage() != null && e.getMessage().contains("CPF/CNPJ");
    }

    @DELETE
    @Path("/{id}")
    public void delete(@PathParam("id") UUID id) {
        service.deactivate(id);
    }
}