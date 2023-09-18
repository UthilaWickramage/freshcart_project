package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("shop_list")
public class ShopListController {
    @GET
    public Viewable get(){
        return new Viewable("/frontend/shop_listing");
    }
}
