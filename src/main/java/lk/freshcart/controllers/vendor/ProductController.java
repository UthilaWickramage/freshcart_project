package lk.freshcart.controllers.vendor;


import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsVendor;
import lk.freshcart.entity.Category;
import lk.freshcart.entity.Product;
import lk.freshcart.services.CategoryService;
import lk.freshcart.services.ProductService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.List;
import java.util.Set;
@IsVendor
@Path("/vendor")
public class ProductController {
    @Inject
    ProductService productService;
    @Path("/add-product")
    @GET
    public Viewable view() {
        CategoryService categoryService = new CategoryService();
        List<Category> allCategories = categoryService.getAllActiveCategories();
        return new Viewable("/backend/vendor/addProduct", allCategories);
    }

    @Path("/products")
    @GET
    public Viewable get() {
        List<Product> allproducts = productService.getAllproducts();
        for(Product product:allproducts){
            System.out.println(product.getTitle());
//            Set<ProductImage> productImage = product.getProductImage();
//            for(ProductImage i :productImage){
//                System.out.println(i.getUrl());
//            }
        }
        return new Viewable("/backend/vendor/products",allproducts);
    }


}
