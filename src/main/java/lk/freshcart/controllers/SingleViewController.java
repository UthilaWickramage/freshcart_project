package lk.freshcart.controllers;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.QueryParam;
import lk.freshcart.annotations.IsUser;
import lk.freshcart.entity.Product;
import lk.freshcart.services.ProductService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.ArrayList;
import java.util.List;


@Path("/")
public class SingleViewController {
    @Inject
    ProductService productService;
    @GET
@Path("{id}")
    public Viewable get(@PathParam("id") Long id){
        System.out.println(id);
        List<Product> lists = productService.getAllproducts();
  List<Product> products = new ArrayList<>();
lists.forEach(product -> {
    if(product.getId()==id){
     products.add(product);

    }
});
        System.out.println(products.get(0).getImages().size());


        return new Viewable("/frontend/shop_single",products);
    }
}
