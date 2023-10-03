package lk.freshcart.controllers.api;

import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.dto.RegisterDTO;
import lk.freshcart.entity.User;
import lk.freshcart.entity.UserType;
import lk.freshcart.services.UserService;
import lk.freshcart.util.EncryptionUtil;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.UUID;

@Path("/register")
public class RegisterController {

    @GET
    public Viewable get(){

        return new Viewable("/frontend/auth/signup");
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response register(RegisterDTO registerDTO){
        UserService userService = new UserService();
        User byEmail = userService.getByEmail(registerDTO.getEmail());
        if(byEmail!=null){
            return Response.status(Response.Status.BAD_REQUEST).entity("email already registered").build();
        }else{
            User user = new User();
            user.setFirst_name(registerDTO.getfname());
            user.setLast_name(registerDTO.getlname());
            user.setEmail(registerDTO.getEmail());
            user.setPassword(EncryptionUtil.encrypt(registerDTO.getPassword()));
            String verification_code  = UUID.randomUUID().toString();
            user.setVerification_code(verification_code);
            if(registerDTO.getType().equals("seller")){
                user.setUserType(UserType.VENDOR);
            }else{
                user.setUserType(UserType.CUSTOMER);
            }
            user.setActive(true);
            userService.saveUser(user);
            return Response.ok().entity("Registered Successfully").build();
        }
    }
}
