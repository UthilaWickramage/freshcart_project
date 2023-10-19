package lk.freshcart;

import lk.freshcart.entity.AppSetting;
import lk.freshcart.entity.Category;
import lk.freshcart.entity.Product;
import lk.freshcart.entity.User;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.Set;

public class Test {
    public static void main(String[] args) {
//        double v = 2000.9;
//        long l= Math.round(v+v);
//        System.out.println(l);
        Session session = HibernateUtil.getSessionFactory().openSession();
        Product product = session.get(Product.class, 2);
        System.out.println(product.getImages().size());
    }
}
