package com.stok.inventorymovement;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;
import java.util.UUID;

@Path("/inventory/movements")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class InventoryMovementResource {

    public record ErrorResponse(String message) {}

    @Inject
    InventoryMovementService service;

    @GET
    public List<InventoryMovement> list(@QueryParam("itemId") UUID itemId) {
        if (itemId != null) return service.listByItem(itemId);
        return service.list();
    }

    @GET
    @Path("/{id}")
    public InventoryMovement findById(@PathParam("id") UUID id) {
        return service.findById(id);
    }

    @POST
    public Response create(InventoryMovement movement) {
        try {
            return Response.ok(service.create(movement)).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(new ErrorResponse(e.getMessage()))
                    .build();
        }
    }
}
