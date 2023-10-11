package lk.freshcart.controllers.ui.vendor;

import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsVendor;
import lk.freshcart.dto.ReviewDTO;
import lk.freshcart.entity.Reviews;
import lk.freshcart.services.ProductService;
import org.glassfish.jersey.server.mvc.Viewable;
@IsVendor
@Path("/vendor")
public class ReviewController {
    @Inject
    ProductService productService;
    @Path("reviews")
    @GET
    public Viewable get(){
        return new Viewable("/backend/vendor/reviews");
    }


}
