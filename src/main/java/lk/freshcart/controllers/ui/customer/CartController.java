package lk.freshcart.controllers.ui.customer;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsUser;
import lk.freshcart.services.CartService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.Map;

@IsUser
@Path("/cart")
public class CartController {
    @Inject
    CartService cartService;
    @GET
    public Viewable get() {
        Map map = cartService.getAllCartItems();

        return new Viewable("/frontend/cart", map);
    }
}
