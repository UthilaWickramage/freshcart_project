package lk.freshcart.services;

import lk.freshcart.entity.CartItem;
import lk.freshcart.entity.Product;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class CartService {
    public void AddProductToCart(CartItem cartItem, String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Product product = session.get(Product.class, id);
        cartItem.setProductId(product);
        session.persist(cartItem);
        transaction.commit();

    }

    public List<CartItem> getAllCartItems() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.createQuery("select c from CartItem c where c.active=:active", CartItem.class).setParameter("active", true).getResultList();
        } catch (Exception e) {
            return null;
        }
    }
}
