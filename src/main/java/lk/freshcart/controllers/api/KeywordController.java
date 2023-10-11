package lk.freshcart.controllers.api;

import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAdmin;
import lk.freshcart.entity.AppSetting;
import lk.freshcart.services.AppService;
import org.glassfish.jersey.server.mvc.Viewable;

@IsAdmin
@Path("/admin")
public class KeywordController {

    @POST
    @Path("/keywords")
    public Response get(@FormParam("name") String name, @FormParam("value") String value) {
        if (name.isEmpty()) {
            return Response.status(Response.Status.NOT_FOUND).entity("Enter name").build();
        } else if (value.isEmpty()) {
            return Response.status(Response.Status.NOT_FOUND).entity("Enter value").build();
        } else {
            AppService appService = new AppService();
            AppSetting appSetting = new AppSetting();
            appSetting.setName(name);
            appSetting.setValue(value);
            appService.save(appSetting);
            return Response.ok().build();
        }

    }
}
