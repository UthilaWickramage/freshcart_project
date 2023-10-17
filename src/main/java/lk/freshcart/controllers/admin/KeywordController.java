package lk.freshcart.controllers.admin;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsAdmin;
import lk.freshcart.entity.AppSetting;
import lk.freshcart.services.AppService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@IsAdmin
@Path("/admin")
public class KeywordController {

    @GET
    @Path("/keywords")
    public Viewable get() {
        AppService appService = new AppService();
        List<AppSetting> appSettings = appService.loadKeywords();
        Map<String,Object> map = new HashMap<>();
        map.put("appSettings",appSettings);
        return new Viewable("/backend/admin/addKeywords",map);
    }
}