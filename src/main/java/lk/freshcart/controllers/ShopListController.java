package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import lk.freshcart.annotations.IsUser;
import lk.freshcart.entity.Category;
import lk.freshcart.entity.Product;
import lk.freshcart.util.HibernateUtil;
import org.glassfish.jersey.server.mvc.Viewable;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

@IsUser
@Path("/")
public class ShopListController {
    @GET
    @Path("categories/{id}")
    public Viewable get(@PathParam("id")Long id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Category category = session.get(Category.class, id);
        List<Product> products = session.createQuery("select p from Product p where categoryId=:c", Product.class).setParameter("c", category).getResultList();
        List<Object> list = new ArrayList<>();
        list.add(products);

        list.add(category);
        return new Viewable("/frontend/shop_listing",list);
    }
}
