package lk.freshcart.services;

import jakarta.persistence.NoResultException;
import lk.freshcart.entity.Category;
import lk.freshcart.entity.User;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class CategoryService {
    //give category by the title
    public Category getCategoryById(Long id) {

            Session session = HibernateUtil.getSessionFactory().openSession();
            return session.get(Category.class,id);

    }
    public Category getCategoryByTitle(String title) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            return session.createQuery("select c from Category c where c.name=:name", Category.class).setParameter("name", title).uniqueResult();
        } catch (NoResultException e) {
            return null;
        }
    }
    //get all categories
    public List<Category> getAllCategories() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.createQuery("select c from Category c", Category.class).getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    //get all categories with published
    public List<Category> getAllActiveCategories() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.createQuery("select c from Category c where c.status=:status", Category.class).setParameter("status", true).getResultList();
        } catch (Exception e) {
            return null;
        }
    }
//save category object to the database
    public void SaveCategory(Category category) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(category);
        transaction.commit();
        session.close();
    }
    public void update(Category category) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.merge(category);
        transaction.commit();
        session.close();
    }
}
