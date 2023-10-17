package lk.freshcart.controllers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsUser;
import lk.freshcart.entity.User;
import lk.freshcart.services.CartService;
import lk.freshcart.services.UserService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.*;

@IsUser
@Path("/checkout")
public class CheckoutController {
    @Context
    HttpServletRequest request;
    @GET
    public Viewable get(){
        User user = (User) request.getSession().getAttribute("user");

        UserService userService = new UserService();
        CartService cartService = new CartService();

        User byId = userService.getById(user.getId());
        Map<String, Object> cartItems = null;

            cartItems= cartService.getAllCartItems(user);



        List list = new ArrayList();
        list.add(byId);
        list.add(cartItems);
        System.out.println(list.size());


        return new Viewable("/frontend/checkout",list);
    }
}
