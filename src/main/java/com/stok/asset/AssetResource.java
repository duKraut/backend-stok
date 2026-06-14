package com.stok.asset;

import com.stok.auth.SecurityCheck;
import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;
import java.util.UUID;

@Path("/assets")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AssetResource {

    public record ErrorResponse(String message) {}

    @Inject AssetService service;
    @Inject SecurityCheck security;
    @Context ContainerRequestContext ctx;

    @GET
    public List<Asset> list() {
        security.requireModule("PATRIMONIO", ctx);
        return service.list();
    }

    @GET
    @Path("/{id}")
    public Asset findById(@PathParam("id") UUID id) {
        security.requireModule("PATRIMONIO", ctx);
        return service.findById(id);
    }

    @POST
    public Response create(Asset asset) {
        security.requireModule("PATRIMONIO", ctx);
        security.requireEdit(ctx);
        try {
            return Response.ok(service.create(asset)).build();
        } catch (IllegalArgumentException e) {
            Response.Status status = isDuplicateError(e)
                    ? Response.Status.CONFLICT
                    : Response.Status.BAD_REQUEST;
            return Response.status(status).entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    @PUT
    @Path("/{id}")
    public Response update(@PathParam("id") UUID id, Asset data) {
        security.requireModule("PATRIMONIO", ctx);
        security.requireEdit(ctx);
        try {
            return Response.ok(service.update(id, data)).build();
        } catch (IllegalArgumentException e) {
            Response.Status status = isDuplicateError(e)
                    ? Response.Status.CONFLICT
                    : Response.Status.BAD_REQUEST;
            return Response.status(status).entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    @DELETE
    @Path("/{id}")
    public void delete(@PathParam("id") UUID id) {
        security.requireModule("PATRIMONIO", ctx);
        security.requireDelete(ctx);
        service.deactivate(id);
    }

    private boolean isDuplicateError(IllegalArgumentException e) {
        return e.getMessage() != null && e.getMessage().contains("número de série");
    }
}
