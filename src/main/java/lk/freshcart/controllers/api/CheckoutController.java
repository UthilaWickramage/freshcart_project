package lk.freshcart.controllers.api;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.entity.CartItem;
import lk.freshcart.entity.Order;
import lk.freshcart.entity.Product;
import lk.freshcart.entity.User;
import lk.freshcart.providers.PaymentServiceProvider;
import lk.freshcart.services.CartService;
import lk.freshcart.services.OrderService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.List;
import java.util.Map;

@Path("/api/checkout")
public class CheckoutController {
    @Context
    HttpServletRequest request;

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response save() {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return Response.status(Response.Status.FORBIDDEN).entity("no user").build();
        }
        CartService cartService = new CartService();
        Map<String, Object> map = cartService.getAllCartItems(user);

        OrderService orderService = new OrderService();
        Order order = orderService.saveOrder(map, user);


        PaymentServiceProvider paymentServiceProvider = new PaymentServiceProvider();
        List<CartItem> cartItems = (List<CartItem>) map.get("list");
        String url;
        try{
            url = paymentServiceProvider.getUrl(cartItems, user,order);
            return Response.ok().entity(url).build();
        }catch (Exception e){
            e.printStackTrace();
            return Response.status(Response.Status.BAD_GATEWAY).build();
        }


    }
@GET
    public Viewable updateOrderStatus(@QueryParam("id") Long id){
        OrderService orderService= new OrderService();
        orderService.updateOrderStatus(id);
        return new Viewable("/frontend/account/orders");
    }
}
