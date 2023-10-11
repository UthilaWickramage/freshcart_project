package lk.freshcart.util;


import jakarta.persistence.PostPersist;
import jakarta.persistence.PostUpdate;
import jakarta.servlet.ServletContext;
import org.hibernate.Session;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AppUtil {
    private static Map<String, Object> map = new HashMap<>();
    private static ServletContext context;

    public AppUtil(ServletContext context) {
        AppUtil.context = context;
    }

    static {
        load();
    }

    public static ServletContext getContext() {
        return context;
    }

    public static void setContext(ServletContext context) {
        AppUtil.context = context;
    }

    private static void load() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Object[]> list = session.createQuery("select app.name,app.value from AppSetting app", Object[].class).list();
        list.forEach(o -> {
            map.put(o[0].toString(), o[1]);
        });
        session.close();
    }

    public static void reload() {
        load();
    }

    public static String getString(String key) {
        return map.get(key).toString();

    }

    public static Object get(String key) {
        return map.get(key);
    }

    //if an update or insert happens run the below method
    @PostPersist
    @PostUpdate
    public void appUtil() {
        AppUtil.reload();
    }
}

