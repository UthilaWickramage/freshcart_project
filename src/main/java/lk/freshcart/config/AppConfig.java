package lk.freshcart.config;

import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.mvc.jsp.JspMvcFeature;

public class AppConfig extends ResourceConfig {
    public AppConfig(){
        packages("lk.freshcart.controllers");
        packages("package lk.freshcart.middleware");

        register(JspMvcFeature.class);
        register(DependencyBinder.class);
        property(JspMvcFeature.TEMPLATE_BASE_PATH,"/WEB-INF/views");
    }
}
