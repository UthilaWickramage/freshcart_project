package lk.freshcart.controllers.admin;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsAdmin;
import org.glassfish.jersey.server.mvc.Viewable;

@IsAdmin
@Path("/admin")
public class OrderController {

    @Path("/orders")
    @GET
    public Viewable view(){
        return new Viewable("/backend/admin/order_list");
    }


    @Path("/order")
    @GET
    public Viewable admin_order(){
        return new Viewable("/backend/admin/order_single");
    }
}
