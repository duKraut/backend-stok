package com.stok.assetmovement;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;
import java.util.UUID;

@Path("/assets/movements")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AssetMovementResource {

    public record ErrorResponse(String message) {}

    @Inject
    AssetMovementService service;

    @GET
    public List<AssetMovement> list(@QueryParam("assetId") UUID assetId) {
        if (assetId != null) return service.listByAsset(assetId);
        return service.list();
    }

    @GET
    @Path("/{id}")
    public AssetMovement findById(@PathParam("id") UUID id) {
        return service.findById(id);
    }

    @POST
    public Response create(AssetMovement movement) {
        try {
            return Response.ok(service.create(movement)).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(new ErrorResponse(e.getMessage()))
                    .build();
        }
    }
}
