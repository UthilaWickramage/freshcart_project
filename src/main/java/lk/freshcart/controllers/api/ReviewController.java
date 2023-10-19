package lk.freshcart.controllers.api;

import jakarta.inject.Inject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAuthorized;
import lk.freshcart.dto.ReviewDTO;
import lk.freshcart.entity.Reviews;
import lk.freshcart.entity.User;
import lk.freshcart.services.ProductService;
import org.glassfish.jersey.server.mvc.Viewable;
@IsAuthorized
@Path("/api/reviews")
public class ReviewController {
    @Inject
    ProductService productService;
@Context
    HttpServletRequest request;

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response save(ReviewDTO reviewDTO){
        User user = (User) request.getSession().getAttribute("user");
        if(user==null){
            return Response.status(Response.Status.UNAUTHORIZED).entity("No user login detected").build();
        }
        Reviews reviews = new Reviews();
        reviews.setRating(Integer.valueOf(reviewDTO.getRating()));
        reviews.setTitle(reviewDTO.getTitle());
        reviews.setDescription(reviewDTO.getDesc());
        reviews.setUserId(user);
        try {
            productService.saveReview(reviews, reviewDTO.getProduct_id());
        }catch(Exception e){
            return Response.status(Response.Status.BAD_REQUEST).entity("Failed to submit to review").build();
        }
        return Response.status(Response.Status.OK).entity("Review saved successfully").build();
    }
}
