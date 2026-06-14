package com.stok.auth;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("/auth")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AuthResource {

    public record ErrorResponse(String message) {}

    @Inject
    AuthService authService;

    @POST
    @Path("/login")
    public Response login(LoginRequest req) {
        try {
            return Response.ok(authService.login(req)).build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.UNAUTHORIZED)
                    .entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    @POST
    @Path("/forgot-password")
    public Response forgotPassword(ForgotPasswordRequest req) {
        try {
            authService.forgotPassword(req.email);
            return Response.ok().build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity(new ErrorResponse(e.getMessage())).build();
        }
    }

    @POST
    @Path("/reset-password")
    public Response resetPassword(ResetPasswordRequest req) {
        try {
            authService.resetPassword(req.token, req.newPassword);
            return Response.ok().build();
        } catch (IllegalArgumentException e) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity(new ErrorResponse(e.getMessage())).build();
        }
    }
}
