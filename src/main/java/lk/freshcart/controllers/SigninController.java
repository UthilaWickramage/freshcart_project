package lk.freshcart.controllers;

import jakarta.inject.Inject;
import jakarta.inject.Singleton;
import jakarta.servlet.http.Cookie;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.dto.AuthDTO;
import lk.freshcart.entity.User;
import lk.freshcart.services.UserService;
import lk.freshcart.util.EncryptionUtil;
import lk.freshcart.util.JWTTokenUtil;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.Date;

@Singleton
@Path("/signin")
public class SigninController {
    @Inject
    JWTTokenUtil jwtTokenUtil;
    @Inject
    UserService userService;
@GET
    public Viewable get(){
    return new Viewable("/frontend/auth/signin");
}

@POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response signinAction(AuthDTO authDTO){
    UserService userService = new UserService();
    if(authDTO.getEmail()==null){
        return Response.status(Response.Status.BAD_REQUEST).entity("Please enter email").build();
    }else if(authDTO.getPassword()==null){
        return Response.status(Response.Status.BAD_REQUEST).entity("Please enter password").build();
    }else{
        User userByEmail = userService.getByEmail(authDTO.getEmail());
        if(userByEmail!=null){
            if(EncryptionUtil.encrypt(authDTO.getPassword()).equals(userByEmail.getPassword())){
                String accessToken = jwtTokenUtil.generateAccessToken(userByEmail);
                String refreshToken = jwtTokenUtil.generateRefreshToken(userByEmail);
                Date expiredDateFromToken = jwtTokenUtil.getExpiredDateFromToken(accessToken);

                return Response.ok().build();
            }else{
                return Response.status(Response.Status.BAD_REQUEST).entity("Incorrect Email or Password").build();
            }
        }else{
            return Response.status(Response.Status.BAD_REQUEST).entity("Incorrect Email or Password").build();
        }
    }

    }
}
