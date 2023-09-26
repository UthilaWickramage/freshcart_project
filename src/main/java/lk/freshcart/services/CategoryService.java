package lk.freshcart.services;

import jakarta.persistence.NoResultException;
import lk.freshcart.entity.Category;
import lk.freshcart.entity.User;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CategoryService {
    public Category getCategoryByTitle(String title) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            return session.createQuery("select c from Category c where c.name=:name", Category.class).setParameter("name", title).uniqueResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    public void SaveCategory(Category category){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction= session.beginTransaction();
        session.persist(category);
        transaction.commit();
        session.close();
    }
}
