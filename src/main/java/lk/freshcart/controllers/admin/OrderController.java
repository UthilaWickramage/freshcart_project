package lk.freshcart.controllers.admin;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsAdmin;
import lk.freshcart.entity.Order;
import lk.freshcart.services.OrderService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.List;

@IsAdmin
@Path("/admin")
public class OrderController {

    @Path("/orders")
    @GET
    public Viewable view(){
        OrderService orderService= new OrderService();
        List<Order> allOrders = orderService.getAllOrders();
        return new Viewable("/backend/admin/order_list",allOrders);
    }


    @Path("/order")
    @GET
    public Viewable admin_order(){
        return new Viewable("/backend/admin/order_single");
    }
}
