package lk.freshcart.controllers.ui.customer;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsUser;
import lk.freshcart.entity.Category;
import lk.freshcart.entity.Product;
import lk.freshcart.services.CategoryService;
import lk.freshcart.services.ProductService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Path("/home")

public class HomeController {
    @Inject
    CategoryService categoryService;
    @Inject
    ProductService productService;
    @GET

    public Viewable home(){
        List<Category> allActiveCategories = categoryService.getAllActiveCategories();
        List<Product> allproducts = productService.getAllproducts();
        List<List> list = new ArrayList<>();
        list.add(allproducts);
        list.add(allActiveCategories);
        return new Viewable("/frontend/home",list);
    }
}
