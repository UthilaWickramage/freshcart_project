package lk.freshcart.providers;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;
import lk.freshcart.mail.Mailable;
import lk.freshcart.util.Env;

import java.util.Properties;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class MailServiceProvider {
    private ThreadPoolExecutor threadPoolExecutor;
    private Authenticator authenticator;
    private Properties properties = new Properties();
    private static MailServiceProvider mailServiceProvider;
    BlockingQueue<Runnable> blockingQueue= new LinkedBlockingQueue<>();

    private MailServiceProvider(){
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.starttls.enable","true");
        properties.put("mail.smtp.host",Env.get("mail.host"));
        properties.put("mail.smtp.port", Env.get("mail.port"));
    }

    public static MailServiceProvider getInstance(){
        if(mailServiceProvider==null){
            mailServiceProvider=new MailServiceProvider();
        }
        return mailServiceProvider;
    }

    public void start(){
        authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(Env.get("mail.username"),Env.get("mail.password"));
            }

        };
        threadPoolExecutor = new ThreadPoolExecutor(
                2,5,5, TimeUnit.SECONDS,blockingQueue,new ThreadPoolExecutor.AbortPolicy()
        );
        threadPoolExecutor.prestartAllCoreThreads();
        System.out.println("Mail service provide running");
    }

    public void sendEmail(Mailable mailable){
        blockingQueue.offer(mailable);
    }
    public Properties getProperties(){
        return properties;
    }
    public Authenticator getAuthenticator(){
        return authenticator;
    }
    public void shutDown(){
        if(threadPoolExecutor!=null){
            threadPoolExecutor.shutdown();
        }
    }
}
