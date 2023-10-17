package lk.freshcart.controllers.vendor;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsVendor;
import org.glassfish.jersey.server.mvc.Viewable;

import javax.swing.text.View;

@IsVendor
@Path("/vendor/dashboard")
public class DashBoardController {
    @GET
    public Viewable get(){
        return new Viewable("/backend/vendor/dashboard");
    }


}


