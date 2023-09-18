package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("wishlist")
public class WishlistController {
    @GET
    public Viewable get(){
        return new Viewable("/frontend/wishlist");
    }
}
