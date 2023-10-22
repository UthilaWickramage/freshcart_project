package lk.freshcart.controllers;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import lk.freshcart.entity.Product;
import lk.freshcart.util.HibernateUtil;
import org.glassfish.jersey.server.mvc.Viewable;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

@Path("/search")
public class SearchController {
    @POST
    public Viewable search(@FormParam("search") String search){
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
            CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
            CriteriaQuery<Product> query = criteriaBuilder.createQuery(Product.class);
            //create root
            Root<Product> root = query.from(Product.class);
            //or conditions
            query.select(root).where(criteriaBuilder.or(
                    criteriaBuilder.equal(root.get("title"), search),
                    criteriaBuilder.equal(root.get("description"), search),
                    criteriaBuilder.equal(root.get("brand"), search)
            ));
            //returns list
            List<Product> products = session.createQuery(query).getResultList();
            System.out.println(products.size());
            products.forEach(product -> {
                System.out.println(product.getTitle());

            });
            List<List<Product>> list=  new ArrayList<>();
            list.add(products);
            return new Viewable("/frontend/shop_listing",list);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
