package lk.freshcart.controllers.admin.api;

import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;
import lk.freshcart.services.OrderService;

@Path("/admin/api/order")
public class OrderController {
    @PUT
    public Response update(@FormParam("id") Long id){
        OrderService orderService = new OrderService();
        orderService.updateOrderStatus(id);
        return Response.ok().build();
    }
}
