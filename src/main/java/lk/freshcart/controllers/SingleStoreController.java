package lk.freshcart.controllers;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("store_view")
public class SingleStoreController {
@GET
    public Viewable get(){
    return new Viewable("/frontend/store_single");
}
}
