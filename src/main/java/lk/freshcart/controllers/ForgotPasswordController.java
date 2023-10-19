package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsUser;
import org.glassfish.jersey.server.mvc.Viewable;


@Path("/")
public class ForgotPasswordController {

    @GET
    @Path("forgotPassword")
    public Viewable get(){
        return new Viewable("/frontend/auth/forgot_password");
    }

}
