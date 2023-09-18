package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/")
public class CategoryController {
    @Path("vendor_categories")
    @GET
    public Viewable get(){
        return new Viewable("/backend/vendor/category");
    }

    @Path("admin_categories")
    @GET
    public Viewable getAll(){
        return new Viewable("/backend/admin/category");
    }

    @Path("add_category")
    @GET
    public Viewable view(){
        return new Viewable("/backend/admin/addCategory");
    }
}
