package lk.freshcart.controllers.vendor;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.QueryParam;
import lk.freshcart.annotations.IsVendor;
import lk.freshcart.entity.Order;
import lk.freshcart.services.OrderService;
import lk.freshcart.util.HibernateUtil;
import org.glassfish.jersey.server.mvc.Viewable;
import org.hibernate.Session;

import java.util.List;

@IsVendor
@Path("/vendor")
public class OrderController {
    @Path("orders")
    @GET

    public Viewable get(){
        OrderService orderService= new OrderService();
//        List<Order> allOrders = orderService.getAllOrders();
        return new Viewable("/backend/vendor/order_list");
    }


    @Path("order/{id}")
    @GET
    public Viewable Vendor_order(@PathParam("id") Long id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Order order = session.get(Order.class, id);
        return new Viewable("/backend/vendor/order_single",order);
    }

}
