package lk.freshcart.controllers.api;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAuthorized;
import lk.freshcart.entity.Product;
import lk.freshcart.entity.User;
import lk.freshcart.entity.WishListItem;
import lk.freshcart.services.WIshListService;
import lk.freshcart.util.HibernateUtil;
import org.glassfish.jersey.server.mvc.Viewable;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;

@IsAuthorized
@Path("/api/wishlist")
public class WishListController {
    @Context
    HttpServletRequest request;

    @GET
    public Viewable view() {
        User user = (User) request.getSession().getAttribute("user");
        WIshListService wIshListService = new WIshListService();
        List<WishListItem> byUser = wIshListService.getByUser(user);
        Long count = wIshListService.getWishlistCount(user);
        List<Object> list = new ArrayList<>();
        list.add(byUser);
        list.add(count);
        return new Viewable("/frontend/wishlist", list);
    }

    @POST
    public Response add(@FormParam("id") Long id) {
        User user = (User) request.getSession().getAttribute("user");
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Product product = (Product) session.createQuery("select p from Product p where id=:id").setParameter("id", id).getSingleResult();
            WIshListService wishListService = new WIshListService();
            wishListService.addToWishList(product, user);
            return Response.ok().entity("Product added successfully").build();
        } catch (Exception e) {
            e.printStackTrace();
            return Response.status(Response.Status.BAD_REQUEST).build();
        }

    }

    @DELETE
    public Response delete(@FormParam("id") Long id) {
        WIshListService wishListService = new WIshListService();
        wishListService.removeWishlistItem(id);
        return Response.ok().entity("Product removed successfully").build();
    }
}
