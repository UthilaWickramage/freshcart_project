package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/admin_vendors")
public class VendorController {
    @GET
    public Viewable get(){
        return new Viewable("/backend/admin/vendors");
    }
}
