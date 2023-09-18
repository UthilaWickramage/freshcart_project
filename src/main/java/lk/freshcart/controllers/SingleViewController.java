package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("product_view")
public class SingleViewController {
    @GET
    public Viewable get(){
        return new Viewable("/frontend/shop_single");
    }
}
