package lk.freshcart.services;

import lk.freshcart.entity.Category;
import lk.freshcart.entity.Product;
import lk.freshcart.entity.Reviews;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ProductService {
    public List<Product> getAllproducts() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.createQuery("select p from Product p", Product.class).getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    public Product getProductById(Long id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            return session.get(Product.class,id);
        }catch (Exception e){
return null;
        }
    }

    public void saveProduct(Product product) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(product);
        transaction.commit();
        session.close();
    }

    public void update(Product product) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.merge(product);
        transaction.commit();
        session.close();
    }

    public void saveReview(Reviews reviews,String id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Long pid = Long.valueOf(id);
        Product product = session.get(Product.class,pid);
        reviews.setProductId(product);

        session.persist(reviews);
        transaction.commit();
    }
}
