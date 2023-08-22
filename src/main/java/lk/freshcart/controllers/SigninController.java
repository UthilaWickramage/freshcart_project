package lk.freshcart.controllers;

import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.dto.AuthDTO;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/signin")
public class SigninController {
@GET
    public Viewable get(){
    return new Viewable("/frontend/auth/signin");
}

@POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response signinAction(AuthDTO authDTO){
    System.out.println(authDTO.getEmail());
    return Response.ok().build();
}
}
