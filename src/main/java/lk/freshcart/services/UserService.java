package lk.freshcart.services;

import jakarta.persistence.NoResultException;
import lk.freshcart.entity.User;
import lk.freshcart.entity.UserType;
import lk.freshcart.util.EncryptionUtil;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

public class UserService {
    public User getById(Long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.get(User.class, id);
    }

    public void saveMobile(Long id, String mobile) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        User user = session.get(User.class, id);
        user.setMobile(mobile);
        transaction.commit();
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

    public void saveAddress(Long id, String address, String city, String post) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        User user = session.get(User.class, id);
        user.setAddress(address);
        user.setCity(city);
        user.setPost_code(post);
        transaction.commit();
    }

    public void updateStatus(String code) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Optional<User> op = session.createQuery("select u from User u where u.verification_code=:verification_code").setParameter("verification_code", code).uniqueResultOptional();

            if (op.isPresent()) {
                User user = op.get();
                user.setActive(true);
                user.setEmail_verified_at(new Timestamp(System.currentTimeMillis()).toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        transaction.commit();
    }

    public void changePassword(Long id, String password) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        User user = session.get(User.class, id);
        user.setPassword(password);
        transaction.commit();
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
