package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/")
public class ReviewController {
    @Path("vendor_reviews")
    @GET
    public Viewable get(){
        return new Viewable("/backend/vendor/reviews");
    }
@Path("admin_reviews")
    @GET
    public Viewable view(){
        return new Viewable("/backend/admin/reviews");
    }
}
