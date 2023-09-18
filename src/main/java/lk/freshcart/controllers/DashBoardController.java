package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

import javax.swing.text.View;

@Path("/")
public class DashBoardController {
    @Path("vendor_dashboard")
    @GET
    public Viewable get(){
        return new Viewable("/backend/vendor/dashboard");
    }

    @Path("admin_dashboard")
    @GET
    public Viewable view(){
        return new Viewable("/backend/admin/dashboard");
    }
}


