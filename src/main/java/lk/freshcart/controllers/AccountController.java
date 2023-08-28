package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/")
public class AccountController {
    @GET
    @Path("account-addresses")
    public Viewable get1(){
        return new Viewable("/frontend/account/address");
    }

    @GET
    @Path("account-payment-methods")
    public Viewable get2(){
        return new Viewable("/frontend/account/payment_methods");
    }

    @GET
    @Path("account-settings")
    public Viewable get3(){
        return new Viewable("/frontend/account/settings");
    }

    @GET
    @Path("account-orders")
    public Viewable get4(){
        return new Viewable("/frontend/account/orders");
    }
    @GET
    @Path("account-notifications")
    public Viewable get5(){
        return new Viewable("/frontend/account/notification");
    }
}
