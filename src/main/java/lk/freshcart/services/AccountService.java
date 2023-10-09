package lk.freshcart.services;

import lk.freshcart.entity.Cards;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AccountService {
public void saveCard(Cards card){
    Session session = HibernateUtil.getSessionFactory().openSession();
    Transaction transaction = session.beginTransaction();
    session.persist(card);
    transaction.commit();

}
}
