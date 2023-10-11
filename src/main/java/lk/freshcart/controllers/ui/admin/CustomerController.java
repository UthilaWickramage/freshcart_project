package lk.freshcart.controllers.ui.admin;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsAdmin;
import lk.freshcart.entity.User;
import lk.freshcart.services.UserService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.List;

@IsAdmin
@Path("/admin/customers")
public class CustomerController {
    @Inject
    UserService userService;

    @GET
    public Viewable get(){
       List<User> allCustomers= userService.getAllCustomers();
        System.out.println(allCustomers.size());
        return new Viewable("/backend/admin/customers",allCustomers);
    }
}
