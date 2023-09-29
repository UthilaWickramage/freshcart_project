package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.entity.Category;
import lk.freshcart.services.CategoryService;
import org.glassfish.jersey.server.mvc.Viewable;

import javax.swing.text.View;
import java.util.List;

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
        CategoryService categoryService = new CategoryService();
        List<Category> allCategories = categoryService.getAllActiveCategories();
        return new Viewable("/backend/vendor/addProduct",allCategories);
    }

    @Path("admin_products")
    @GET
    public Viewable viewAll(){
        return new Viewable("/backend/admin/products");
    }
}
