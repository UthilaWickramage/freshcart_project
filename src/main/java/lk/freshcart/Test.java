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
        Session session = HibernateUtil.getSessionFactory().openSession();

    }
}
