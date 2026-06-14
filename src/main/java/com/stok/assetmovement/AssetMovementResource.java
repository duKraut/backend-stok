package com.stok.assetmovement;

import com.stok.auth.SecurityCheck;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;
import java.util.UUID;

@Path("/assets/movements")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AssetMovementResource {

    public record ErrorResponse(String message) {}

    @Inject AssetMovementService service;
    @Inject SecurityCheck security;
    @Context ContainerRequestContext ctx;

    @GET
    public List<AssetMovement> list(@QueryParam("assetId") UUID assetId) {
        security.requireModule("PATRIMONIO", ctx);
        if (assetId != null) return service.listByAsset(assetId);
        return service.list();
    }

    @GET
    @Path("/{id}")
    public AssetMovement findById(@PathParam("id") UUID id) {
        security.requireModule("PATRIMONIO", ctx);
        return service.findById(id);
    }

    @POST
    public Response create(AssetMovement movement) {
        security.requireModule("PATRIMONIO", ctx);
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
