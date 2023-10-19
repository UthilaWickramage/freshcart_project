package lk.freshcart.services;

import lk.freshcart.entity.*;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
import java.util.Map;

public class OrderService {
    public Order saveOrder(Map<String, Object> map, User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        List<CartItem> cartItems = (List) map.get("list");
        Order order = new Order();
        order.setTotal((Double) map.get("total"));
        order.setOrderStatus(OrderStatus.PENDING);
        order.setUserId(user);
        session.persist(order);
        cartItems.forEach((cartItem -> {
            OrderItem orderItem = new OrderItem();
            orderItem.setProductId(cartItem.getProductId());
            orderItem.setQty(cartItem.getQty());
            orderItem.setOrderId(order);
            session.persist(orderItem);
        }));

        transaction.commit();
        updateCart(cartItems);
        return order;
    }

    public Order saveOrder(Product product, User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Order order = new Order();
        order.setTotal(product.getShipping_price()+product.getSale_price());
        order.setOrderStatus(OrderStatus.PENDING);
        order.setUserId(user);
        session.persist(order);

            OrderItem orderItem = new OrderItem();
            orderItem.setProductId(product);
            orderItem.setQty(1);
            orderItem.setOrderId(order);
            session.persist(orderItem);


        transaction.commit();

        return order;
    }

    public void updateOrderStatus(Long id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Order order = session.get(Order.class, id);
        Transaction transaction = session.beginTransaction();
        OrderStatus orderStatus = order.getOrderStatus();
        if(orderStatus.equals(OrderStatus.PENDING)){
            order.setOrderStatus(OrderStatus.VERIFIED);
        }else if(orderStatus.equals(OrderStatus.VERIFIED)){
            order.setOrderStatus(OrderStatus.SHIPPED);
        }else if(orderStatus.equals(OrderStatus.SHIPPED)){
            order.setOrderStatus(OrderStatus.DELIVERED);
        }

        transaction.commit();
    }
    public Order getOrder(Order order){
        Session session = HibernateUtil.getSessionFactory().openSession();
        order.getOrderItems().forEach(orderItem -> {
            System.out.println(orderItem.getProductId().getUserId().getFirst_name());

        });


        return session.get(Order.class, order.getId());

    }

    public List<Order> getAllOrders(int max,int pageNo){
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("select o from Order o", Order.class)
                .setFirstResult(max*(pageNo>0?pageNo-1:0))
                .setMaxResults(max)
                .getResultList();
    }

    public List<Order> getAllOrders(User user,int max,int pageNo){

        Session session = HibernateUtil.getSessionFactory().openSession();

        return session.createQuery("select o from Order o where userId=:user", Order.class)
                .setParameter("user",user)
                .setFirstResult(max*(pageNo>0?pageNo-1:0))
                .setMaxResults(max)
                .getResultList();

    }

    public void updateCart(List<CartItem> cartItems) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        cartItems.forEach((cartItem -> {
            CartItem cartItem1 = session.get(CartItem.class, cartItem.getId());
            cartItem1.setActive(false);
        }));
        transaction.commit();
    }
}
