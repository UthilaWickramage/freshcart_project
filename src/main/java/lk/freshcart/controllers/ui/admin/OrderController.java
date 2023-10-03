package lk.freshcart.controllers.ui.admin;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsAdmin;
import org.glassfish.jersey.server.mvc.Viewable;

@IsAdmin
@Path("/")
public class OrderController {

    @Path("admin_orders")
    @GET
    public Viewable view(){
        return new Viewable("/backend/admin/order_list");
    }


    @Path("admin_order")
    @GET
    public Viewable admin_order(){
        return new Viewable("/backend/admin/order_single");
    }
}
