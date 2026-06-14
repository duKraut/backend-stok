package com.stok.inventory;

import com.stok.auth.SecurityCheck;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;
import java.util.UUID;

@Path("/inventory/items")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class InventoryResource {

    public record ErrorResponse(String message) {}

    @Inject InventoryService service;
    @Inject SecurityCheck security;
    @Context ContainerRequestContext ctx;

    @GET
    public List<Inventory> list() {
        security.requireModule("ALMOXARIFADO", ctx);
        return service.list();
    }

    @GET
    @Path("/{id}")
    public Inventory findById(@PathParam("id") UUID id) {
        security.requireModule("ALMOXARIFADO", ctx);
        return service.findById(id);
    }

    @POST
    public Response create(Inventory item) {
        security.requireModule("ALMOXARIFADO", ctx);
        security.requireEdit(ctx);
        try {
            return Response.ok(service.create(item)).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    @PUT
    @Path("/{id}")
    public Response update(@PathParam("id") UUID id, Inventory data) {
        security.requireModule("ALMOXARIFADO", ctx);
        security.requireEdit(ctx);
        try {
            return Response.ok(service.update(id, data)).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    @DELETE
    @Path("/{id}")
    public void delete(@PathParam("id") UUID id) {
        security.requireModule("ALMOXARIFADO", ctx);
        security.requireDelete(ctx);
        service.deactivate(id);
    }
}
