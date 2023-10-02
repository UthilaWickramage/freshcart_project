package lk.freshcart.controllers;

import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.Random;

@Path("/random")
public class NumberController {
    @GET
    public Viewable view() {
        return new Viewable("/frontend/random");
    }

    @POST
    public Response get(@FormParam("value") String value) {
        int num = Integer.valueOf(value);
        Random random = new Random();

        int number = 0;
        while (true) {
            number = random.nextInt(6);
            if (number != 0) {
                break;
            }
        }
        System.out.println(number);
        if(num==number){
            return Response.status(Response.Status.OK).entity("You in").build();
        }else{
            return Response.status(Response.Status.BAD_REQUEST).entity("Try Again").build();
        }
    }

}
