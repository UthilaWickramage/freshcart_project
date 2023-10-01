package lk.freshcart.services;

import jakarta.persistence.NoResultException;
import lk.freshcart.entity.User;
import lk.freshcart.entity.UserType;
import lk.freshcart.util.EncryptionUtil;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class UserService {
    public User getById(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.get(User.class, id);
    }

    public User getByEmail(String email) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            return session.createQuery("select u from User u where u.email=:email", User.class).setParameter("email", email).uniqueResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    public User getUserByEmailAndPassword(String email, String password) {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();

            System.out.println(password);
            return session.createQuery("select u from User u where u.email=:email and u.password=:password", User.class).setParameter("email", email).setParameter("password", password).uniqueResult();
        } catch (NoResultException e) {
            return null;
        }
    }

//    public User getUserByEmailAndPassword(String email,String password){
//        try{
//            Session session = HibernateUtil.getSessionFactory().openSession();
//            return session.createQuery("select u from User u where u.email=:email and u.password=:password",User.class).setParameter("email",email).setParameter("password",password).uniqueResult();
//        }catch(NoResultException e){
//            return null;
//        }
//    }

    public void saveUser(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(user);
        transaction.commit();
        session.close();
    }

    public List<User> getAllCustomers() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.createQuery("select u from User u where u.userType=:type", User.class).setParameter("type", UserType.CUSTOMER).getResultList();

        } catch (Exception e) {
            return null;
        }
    }

    public List<User> getAllVendors() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.createQuery("select u from User u where u.userType=:type", User.class).setParameter("type", UserType.VENDOR).getResultList();

        } catch (Exception e) {
            return null;
        }
    }
}
