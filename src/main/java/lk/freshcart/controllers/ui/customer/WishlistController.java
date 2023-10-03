package lk.freshcart.controllers.ui.customer;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsUser;
import org.glassfish.jersey.server.mvc.Viewable;

@IsUser
@Path("wishlist")
public class WishlistController {
    @GET
    public Viewable get(){
        return new Viewable("/frontend/wishlist");
    }
}
