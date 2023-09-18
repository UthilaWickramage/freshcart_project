package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/")
public class OrderController {
    @Path("vendor_orders")
    @GET
    public Viewable get(){
        return new Viewable("/backend/vendor/order_list");
    }

    @Path("admin_orders")
    @GET
    public Viewable view(){
        return new Viewable("/backend/admin/order_list");
    }

    @Path("vendor_order")
    @GET
    public Viewable Vendor_order(){
        return new Viewable("/backend/vendor/order_single");
    }

    @Path("admin_order")
    @GET
    public Viewable admin_order(){
        return new Viewable("/backend/admin/order_single");
    }
}
