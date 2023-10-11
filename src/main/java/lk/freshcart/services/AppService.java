package lk.freshcart.services;

import lk.freshcart.entity.AppSetting;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class AppService {
    public void save(AppSetting appSetting){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.persist(appSetting);
        transaction.commit();
    }

    public List<AppSetting> loadKeywords(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("select a from AppSetting a",AppSetting.class).getResultList();
    }
}
