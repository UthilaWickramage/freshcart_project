package lk.freshcart.controllers.admin;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsAdmin;
import lk.freshcart.entity.User;
import lk.freshcart.services.UserService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.List;

@IsAdmin
@Path("/admin/vendors")
public class VendorController {
    @Inject
    UserService userService;
    @GET
    public Viewable get(){
        List<User> allVendors = userService.getAllVendors();
        return new Viewable("/backend/admin/vendors",allVendors);
    }
}
