package lk.freshcart.listeners;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import lk.freshcart.providers.MailServiceProvider;
import lk.freshcart.util.Env;

@WebListener
public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("BASE_URL", servletContext.getContextPath() + "/");
        Env.getProperties().put("app_url", "http://localhost:8080" + servletContext.getContextPath());
        System.out.println("ContextInitialized");
        MailServiceProvider.getInstance().start();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        MailServiceProvider.getInstance().shutDown();
    }
}

