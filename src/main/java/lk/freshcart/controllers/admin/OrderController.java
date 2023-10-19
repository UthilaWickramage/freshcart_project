package lk.freshcart.controllers.admin;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.Context;
import lk.freshcart.annotations.IsAdmin;
import lk.freshcart.entity.Order;
import lk.freshcart.entity.User;
import lk.freshcart.services.OrderService;
import lk.freshcart.util.HibernateUtil;
import org.glassfish.jersey.server.mvc.Viewable;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

@IsAdmin
@Path("/admin")
public class OrderController {
@Context
    HttpServletRequest request;
    @Path("/orders")
    @GET
    public Viewable view(@QueryParam("page")Long page){

        int max = 5;
        int pageNo = page.intValue();
        Session session = HibernateUtil.getSessionFactory().openSession();

        Long count = session.createQuery("select count(o) from Order o", Long.class).getSingleResult();

        Long pageCount = count/max;
        if(count%max>0){
            pageCount++;
        }

        OrderService orderService = new OrderService();

        List<Order> allOrders = orderService.getAllOrders(max,pageNo);
        List<Object> list = new ArrayList<>();
        list.add(allOrders);
        list.add(pageCount);
        list.add(pageNo);
        return new Viewable("/backend/admin/order_list",list);
    }


    @Path("/order/{id}")
    @GET
    public Viewable admin_order(@PathParam("id") Long id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Order order = session.get(Order.class, id);
        return new Viewable("/backend/admin/order_single",order);
    }
}
