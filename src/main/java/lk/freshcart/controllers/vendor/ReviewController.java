package lk.freshcart.controllers.vendor;

import jakarta.inject.Inject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsVendor;
import lk.freshcart.dto.ReviewDTO;
import lk.freshcart.entity.Product;
import lk.freshcart.entity.Reviews;
import lk.freshcart.entity.User;
import lk.freshcart.services.ProductService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@IsVendor
@Path("/vendor")
public class ReviewController {
    @Context
    HttpServletRequest request;
    @Inject
    ProductService productService;
    @Path("reviews")
    @GET
    public Viewable get(){
        User vendor = (User)request.getSession().getAttribute("vendor");
        List<Product> productsByVendor = productService.getReviewsByVendor(vendor);
        List<Reviews> reviewsByVendor = new ArrayList<>();
        productsByVendor.forEach(product -> {
            Set<Reviews> reviews = product.getReviews();
            reviews.forEach(review -> {
                reviewsByVendor.add(review);
            });

        });
        return new Viewable("/backend/vendor/reviews",reviewsByVendor);
    }


}
