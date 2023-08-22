package lk.freshcart;

import lk.freshcart.util.HibernateUtil;

public class Test {
    public static void main(String[] args) {
        HibernateUtil.getSessionFactory().openSession();
    }
}
