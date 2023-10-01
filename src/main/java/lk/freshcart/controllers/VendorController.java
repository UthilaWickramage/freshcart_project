package lk.freshcart.controllers;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.entity.User;
import lk.freshcart.services.UserService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.List;

@Path("/admin_vendors")
public class VendorController {
    @Inject
    UserService userService;
    @GET
    public Viewable get(){
        List<User> allVendors = userService.getAllVendors();
        return new Viewable("/backend/admin/vendors",allVendors);
    }
}
