package lk.freshcart.controllers.ui.vendor;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import lk.freshcart.annotations.IsVendor;
import org.glassfish.jersey.server.mvc.Viewable;
@IsVendor
@Path("/vendor")
public class OrderController {
    @Path("orders")
    @GET
    public Viewable get(){
        return new Viewable("/backend/vendor/order_list");
    }


    @Path("order")
    @GET
    public Viewable Vendor_order(){
        return new Viewable("/backend/vendor/order_single");
    }

}
