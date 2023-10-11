package lk.freshcart.controllers.ui.admin;


import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsAdmin;
import lk.freshcart.entity.Product;
import lk.freshcart.services.ProductService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.List;

@IsAdmin
@Path("/admin")
public class ProductController {
    @Inject
    ProductService productService;

    @Path("/products")
    @GET
    public Viewable viewAll() {
        List<Product> allproducts = productService.getAllproducts();
        return new Viewable("/backend/admin/products",allproducts);
    }
}

