package lk.freshcart.controllers.api;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.Response;
import lk.freshcart.entity.User;
import lk.freshcart.services.UserService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.net.URI;
import java.util.Optional;

@Path("/verify")
public class VerifyController {
@GET
    public Response verify(@QueryParam("token")String verificationToken){
    UserService userService = new UserService();
    userService.updateStatus(verificationToken);
    return Response.status(Response.Status.FOUND).location(URI.create("login")).build();
}
    @GET
    @Path("/verify-email")
    public Viewable verify_email(@QueryParam("token")String verificationToken){
        UserService userService = new UserService();
        Optional<User> user = userService.checkCode(verificationToken);
        if(user.isPresent()){
            return new Viewable("/frontend/auth/reset_password",verificationToken);
        }else{
            return new Viewable("/frontend/auth/signin");

        }
    }
}
