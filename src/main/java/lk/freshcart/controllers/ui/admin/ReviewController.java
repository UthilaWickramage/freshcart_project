package lk.freshcart.controllers.ui.admin;


import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAdmin;
import lk.freshcart.dto.ReviewDTO;
import lk.freshcart.entity.Reviews;
import lk.freshcart.services.ProductService;
import org.glassfish.jersey.server.mvc.Viewable;

@IsAdmin
@Path("/")
public class ReviewController {
    @Inject
    ProductService productService;

    @Path("admin_reviews")
    @GET
    public Viewable view(){
        return new Viewable("/backend/admin/reviews");
    }


}
