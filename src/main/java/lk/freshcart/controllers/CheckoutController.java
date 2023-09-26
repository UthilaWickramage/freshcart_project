package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/checkout")
public class CheckoutController {
    @GET
    public Viewable get(){
        return new Viewable("/frontend/checkout");
    }
}