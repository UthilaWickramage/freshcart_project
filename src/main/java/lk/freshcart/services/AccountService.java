package lk.freshcart.services;

import jakarta.persistence.NoResultException;
import lk.freshcart.entity.Cards;
import lk.freshcart.entity.User;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
import java.util.Set;

public class AccountService {
public void saveCard(Cards card){
    Session session = HibernateUtil.getSessionFactory().openSession();
    Transaction transaction = session.beginTransaction();
    session.persist(card);
    transaction.commit();

}

public Set<Cards> getCardsListByUser(User user){
    Session session = HibernateUtil.getSessionFactory().openSession();
    try{
        return user.getCards();
    }catch (NoResultException e){
        return null;
    }
}
}
