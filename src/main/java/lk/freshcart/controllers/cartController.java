package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;


@Path("/cart")
public class cartController {
@GET
    public Viewable get(){
    return new Viewable("/frontend/cart");
}
}
