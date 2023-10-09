package lk.freshcart.util;

import java.io.InputStream;
import java.util.Properties;

public class Env {
    private static Properties properties = new Properties();
    static{
        try{
            InputStream inputStream = Env.class.getClassLoader().getResourceAsStream("application.properties");
            properties.load(inputStream);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static String get(String key){
        return properties.getProperty(key);
    }
    public static Properties getProperties(){
        return properties;
    }
}
