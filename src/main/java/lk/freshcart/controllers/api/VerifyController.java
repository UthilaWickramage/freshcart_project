package lk.freshcart.controllers.api;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.Response;
import lk.freshcart.services.UserService;

import java.net.URI;

@Path("/verify")
public class VerifyController {
@GET
    public Response verify(@QueryParam("token")String verificationToken){
    UserService userService = new UserService();
    userService.updateStatus(verificationToken);
    return Response.status(Response.Status.FOUND).location(URI.create("login")).build();
}
}
