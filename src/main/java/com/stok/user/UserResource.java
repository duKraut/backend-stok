package com.stok.user;

import com.stok.auth.SecurityCheck;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import jakarta.ws.rs.*;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

import java.util.List;
import java.util.UUID;

@Path("/users")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class UserResource {

    public record ErrorResponse(String message) {}
    public record UserSummary(String id, String fullName) {}

    @Inject UserService service;
    @Inject UserRepository repository;
    @Inject SecurityCheck security;
    @Context ContainerRequestContext ctx;

    @GET
    public List<UserResponse> list() {
        security.requireAdmin(ctx);
        return service.list();
    }

    @GET
    @Path("/active")
    @Transactional(Transactional.TxType.SUPPORTS)
    public List<UserSummary> listActive() {
        return repository.find("active = true order by fullName asc").stream()
                .map(u -> new UserSummary(u.id.toString(), u.fullName))
                .toList();
    }

    @GET
    @Path("/{id}")
    public Response findById(@PathParam("id") UUID id) {
        security.requireAdmin(ctx);
        try {
            return Response.ok(service.findById(id)).build();
        } catch (RuntimeException e) {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    @POST
    public Response create(UserRequest req) {
        security.requireAdmin(ctx);
        try {
            return Response.ok(service.create(req)).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.CONFLICT)
                    .entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    @PUT
    @Path("/{id}")
    public Response update(@PathParam("id") UUID id, UserRequest req) {
        security.requireAdmin(ctx);
        try {
            return Response.ok(service.update(id, req)).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.CONFLICT)
                    .entity(new ErrorResponse(e.getMessage())).build();
        } catch (RuntimeException e) {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    @PUT
    @Path("/me")
    public Response updateSelf(UpdateSelfRequest req) {
        try {
            UUID userId = UUID.fromString((String) ctx.getProperty("jwt_userId"));
            return Response.ok(service.updateSelf(userId, req)).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.CONFLICT)
                    .entity(new ErrorResponse(e.getMessage())).build();
        } catch (RuntimeException e) {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    @DELETE
    @Path("/{id}")
    public Response deactivate(@PathParam("id") UUID id) {
        security.requireAdmin(ctx);
        try {
            service.deactivate(id);
            return Response.noContent().build();
        } catch (RuntimeException e) {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity(new ErrorResponse(e.getMessage())).build();
        }
    }
}
