package lk.freshcart.controllers;

import jakarta.inject.Inject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Context;
import lk.freshcart.annotations.IsUser;
import lk.freshcart.entity.User;
import lk.freshcart.services.CartService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.Map;

@IsUser
@Path("/cart")
public class CartController {
    @Inject
    CartService cartService;
    @Context
    HttpServletRequest request;
    @GET
    public Viewable get() {
        User user = (User) request.getSession().getAttribute("user");
        Map map = cartService.getAllCartItems(user);

        return new Viewable("/frontend/cart", map);
    }
}
