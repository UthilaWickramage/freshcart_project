package lk.freshcart.controllers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Context;
import lk.freshcart.annotations.IsUser;
import lk.freshcart.entity.User;
import lk.freshcart.entity.WishListItem;
import lk.freshcart.services.WIshListService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.ArrayList;
import java.util.List;

@IsUser
@Path("wishlist")
public class WishlistController {
    @Context
    HttpServletRequest request;
    @GET

    public Viewable view() {
        User user = (User) request.getSession().getAttribute("user");
        WIshListService wIshListService = new WIshListService();
        List<WishListItem> byUser = wIshListService.getByUser(user);
        Long count = wIshListService.getWishlistCount(user);
        List<Object> list = new ArrayList<>();
        list.add(byUser);
        list.add(count);
        return new Viewable("/frontend/wishlist", list);
    }
}
