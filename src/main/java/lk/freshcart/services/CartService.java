package lk.freshcart.services;

import jakarta.persistence.NoResultException;
import lk.freshcart.entity.CartItem;
import lk.freshcart.entity.Product;
import lk.freshcart.entity.User;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.*;

public class CartService {
    public void AddProductToCart(CartItem cartItem, String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Product product = session.get(Product.class, id);
        cartItem.setProductId(product);
        double total_sale_price = cartItem.getQty() * product.getSale_price();
        double total_shipping_price = cartItem.getQty() * product.getShipping_price();
        cartItem.setItem_sale_total(total_sale_price);
        cartItem.setItem_shipping_total(total_shipping_price);
        session.persist(cartItem);
        transaction.commit();

    }

    public Map getAllCartItems() throws NullPointerException{
        Session session = HibernateUtil.getSessionFactory().openSession();
        Map<String,Object> map = new HashMap();

        try {
            List<CartItem> list = session.createQuery("select c from CartItem c where c.active=:active", CartItem.class).setParameter("active", true).getResultList();
            Double total_sale_price = session.createQuery("select SUM(c.item_sale_total) from CartItem c where c.active=:active", Double.class).setParameter("active", true).getSingleResult();
            Double total_ship_price = session.createQuery("select SUM(c.item_shipping_total) from CartItem c where c.active=:active", Double.class).setParameter("active", true).getSingleResult();
            map.put("list", list);
            map.put("sale_price", total_sale_price);
            map.put("shipping_price", total_ship_price);
            map.put("total", total_sale_price + total_ship_price);
            return map;
        }catch (NoResultException e){
            return null;
        }


    }

    public Map getAllCartItems(User user) throws NullPointerException{
        Session session = HibernateUtil.getSessionFactory().openSession();
        Map<String,Object> map = new HashMap();
        List<CartItem> list;
        Double total_sale_price;
        Double total_ship_price;
                list = session.createQuery("select c from CartItem c where c.active=:active and c.userId=:id", CartItem.class).setParameter("active", true).setParameter("id",user).getResultList();
                total_sale_price = session.createQuery("select SUM(c.item_sale_total) from CartItem c where c.active=:active and c.userId=:id", Double.class).setParameter("active", true).setParameter("id",user).getSingleResult();
            total_ship_price = session.createQuery("select SUM(c.item_shipping_total) from CartItem c where c.active=:active and c.userId=:id", Double.class).setParameter("active", true).setParameter("id",user).getSingleResult();

        map.put("list", list);
        map.put("sale_price", total_sale_price);
        map.put("shipping_price", total_ship_price);
        if(total_sale_price != null || total_ship_price!=null){
            map.put("total", total_sale_price + total_ship_price);
        }

        return map;
    }

    public void removeCartItem(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        CartItem cartItem = session.get(CartItem.class, id);
        cartItem.setActive(false);
        transaction.commit();
    }
}
