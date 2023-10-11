package lk.freshcart.controllers.ui.admin;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsAdmin;
import org.glassfish.jersey.server.mvc.Viewable;

@IsAdmin
@Path("/admin")
public class DashBoardController {
    @Path("/dashboard")
    @GET
    public Viewable get(){
        return new Viewable("/backend/admin/dashboard");
    }


}
