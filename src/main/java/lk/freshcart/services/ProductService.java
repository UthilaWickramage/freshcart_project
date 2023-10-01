package lk.freshcart.services;

import lk.freshcart.entity.Category;
import lk.freshcart.entity.Product;
import lk.freshcart.entity.ProductImage;
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

    public void saveProduct(ProductImage productImage, Product product, String category_id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        Category category = session.get(Category.class, category_id);
        product.setCategoryId(category);
        productImage.setProductId(product);
        session.persist(productImage);
        session.persist(product);
        transaction.commit();
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
