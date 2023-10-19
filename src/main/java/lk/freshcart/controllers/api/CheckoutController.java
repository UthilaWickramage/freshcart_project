package lk.freshcart.controllers.api;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAuthorized;
import lk.freshcart.entity.CartItem;
import lk.freshcart.entity.Order;
import lk.freshcart.entity.Product;
import lk.freshcart.entity.User;
import lk.freshcart.providers.PaymentServiceProvider;
import lk.freshcart.services.CartService;
import lk.freshcart.services.OrderService;
import lk.freshcart.util.HibernateUtil;
import org.glassfish.jersey.server.mvc.Viewable;
import org.hibernate.Session;

import java.util.List;
import java.util.Map;

@IsAuthorized
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
            url = paymentServiceProvider.getUrl(cartItems,order);
            return Response.ok().entity(url).build();
        }catch (Exception e){
            e.printStackTrace();
            return Response.status(Response.Status.BAD_GATEWAY).build();
        }


    }

    @POST
    @Path("/buy-now")
    @Produces(MediaType.APPLICATION_JSON)
    public Response saveSingleOrder(@FormParam("id") Long id) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return Response.status(Response.Status.FORBIDDEN).entity("no user").build();
        }
        Map<String,Object> map = null;
        try (Session session1 = HibernateUtil.getSessionFactory().openSession()) {
            Product product = session1.createQuery("select p from Product p where id=:id", Product.class).setParameter("id", id).getSingleResult();


            OrderService orderService = new OrderService();
            Order order = orderService.saveOrder(product, user);

            PaymentServiceProvider paymentServiceProvider = new PaymentServiceProvider();
            String url = paymentServiceProvider.getUrl(product,order);
            System.out.println(url);
            return Response.ok().entity(url).build();

        }catch(Exception e) {
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
