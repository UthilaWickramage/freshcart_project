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

    public void updateOrderStatus(Long id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Order order = session.get(Order.class, id);
        Transaction transaction = session.beginTransaction();
        order.setOrderStatus(OrderStatus.VERIFIED);
        transaction.commit();
    }
    public Order getOrder(Order order){
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.get(Order.class, order.getId());
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
