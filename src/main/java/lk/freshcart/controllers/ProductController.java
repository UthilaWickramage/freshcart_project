package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

import javax.swing.text.View;

@Path("/")
public class ProductController {
    @Path("vendor_products")
    @GET
    public Viewable get() {
        return new Viewable("/backend/vendor/products");
    }
    @Path("add-product")
    @GET
    public Viewable view(){
        return new Viewable("/backend/vendor/addProduct");
    }

    @Path("admin_products")
    @GET
    public Viewable viewAll(){
        return new Viewable("/backend/admin/products");
    }
}
