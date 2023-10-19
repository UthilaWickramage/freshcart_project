package lk.freshcart.services;

import lk.freshcart.entity.CartItem;
import lk.freshcart.entity.Product;
import lk.freshcart.entity.User;
import lk.freshcart.entity.WishListItem;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class WIshListService {

    public List<WishListItem> getByUser(User user){
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("select w from WishListItem w where userId=:user and active=:active", WishListItem.class).setParameter("user", user).setParameter("active",true).getResultList();
        }catch (Exception e){
           return null;
        }
    }

    public Long getWishlistCount(User user){
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            return session.createQuery("select count(w) from WishListItem w where userId=:user and active=:active", Long.class).setParameter("user", user).setParameter("active",true).getSingleResult();
        }catch (Exception e){
            return null;
        }
    }

    public void addToWishList(Product product, User user){
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            WishListItem wishListItem = new WishListItem();
            wishListItem.setActive(true);
            wishListItem.setProductId(product);
            wishListItem.setUserId(user);
          Transaction transaction= session.beginTransaction();
            session.persist(wishListItem);
            transaction.commit();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public void removeWishlistItem(Long id) {
        try(Session session = HibernateUtil.getSessionFactory().openSession();){
            Transaction transaction = session.beginTransaction();
            WishListItem wishListItem = session.get(WishListItem.class, id);
            session.remove(wishListItem);
            transaction.commit();
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
