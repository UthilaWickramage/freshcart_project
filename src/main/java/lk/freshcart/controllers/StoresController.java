package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsUser;
import org.glassfish.jersey.server.mvc.Viewable;

@IsUser
@Path("stores")
public class StoresController {
    @GET
    public Viewable get(){
        return new Viewable("/frontend/stores");
    }
}
