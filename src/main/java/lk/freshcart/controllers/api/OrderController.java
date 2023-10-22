package lk.freshcart.controllers.api;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsUser;
import lk.freshcart.entity.Order;
import lk.freshcart.entity.Product;
import lk.freshcart.mail.InvoiceEmail;
import lk.freshcart.providers.MailServiceProvider;
import lk.freshcart.services.OrderService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.net.URI;
import java.util.ArrayList;
import java.util.List;

@IsUser
@Path("/api/checkout")
public class OrderController {
    @GET
    public Response updateOrderStatus(@QueryParam("id") Long id){
        OrderService orderService= new OrderService();
        Order order = orderService.updateOrderStatus(id);
        List<Product> products = new ArrayList<>();
        order.getOrderItems().forEach(orderItem -> {
            products.add(orderItem.getProductId());
        });
        InvoiceEmail invoiceEmail = new InvoiceEmail(order.getUserId().getFirst_name(),order.getId(),order.getUserId().getEmail(),order.getTotal(),products);
        MailServiceProvider.getInstance().sendEmail(invoiceEmail);
        return Response.status(Response.Status.FOUND).location(URI.create("account-orders?page=1")).build();
    }
}
