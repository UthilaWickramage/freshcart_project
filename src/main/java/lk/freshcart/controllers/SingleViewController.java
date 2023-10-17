package lk.freshcart.controllers;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
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
        Product productById = productService.getProductById(id);

        List<Product> list = new ArrayList<>();
        list.add(productById);

        return new Viewable("/frontend/shop_single",list);
    }
}
