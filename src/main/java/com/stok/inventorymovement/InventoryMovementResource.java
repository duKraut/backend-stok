package com.stok.inventorymovement;

import com.stok.auth.SecurityCheck;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;
import java.util.UUID;

@Path("/inventory/movements")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class InventoryMovementResource {

    public record ErrorResponse(String message) {}

    @Inject InventoryMovementService service;
    @Inject SecurityCheck security;
    @Context ContainerRequestContext ctx;

    @GET
    public List<InventoryMovement> list(@QueryParam("itemId") UUID itemId) {
        security.requireModule("ALMOXARIFADO", ctx);
        if (itemId != null) return service.listByItem(itemId);
        return service.list();
    }

    @GET
    @Path("/{id}")
    public InventoryMovement findById(@PathParam("id") UUID id) {
        security.requireModule("ALMOXARIFADO", ctx);
        return service.findById(id);
    }

    @POST
    public Response create(InventoryMovement movement) {
        security.requireModule("ALMOXARIFADO", ctx);
        security.requireEdit(ctx);
        try {
            return Response.ok(service.create(movement)).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(new ErrorResponse(e.getMessage()))
                    .build();
        }
    }
}
