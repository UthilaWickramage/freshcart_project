package lk.freshcart.controllers.api;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAuthorized;
import lk.freshcart.entity.CartItem;
import lk.freshcart.entity.User;
import lk.freshcart.services.UserService;
import lk.freshcart.util.EncryptionUtil;
import lk.freshcart.util.JWTTokenUtil;

@IsAuthorized
@Path("/")
public class AccountController {
@Inject
    UserService userService;
@Inject
    JWTTokenUtil tokenUtil;
    @PUT
    @Path("account-settings")
    public Response updateProfile(@FormParam ("mobile") String mobile,@HeaderParam("Authorization") String token){
        String split = token.split(" ")[1];
        User user = userService.getUserByEmailAndPassword(tokenUtil.getEmailFromToken(split), tokenUtil.getPasswordFromToken(split));
        if (user == null) {
            return Response.status(Response.Status.BAD_REQUEST).entity("No User").build();

        } else {
            if(mobile.isEmpty()){
                return Response.status(Response.Status.BAD_REQUEST).entity("Update mobile").build();

            }else{
                userService.saveMobile(user.getId(),mobile);
                return Response.status(Response.Status.OK).entity("Success").build();
            }

        }
    }
    @POST
    @Path("account-settings")
    public Response changepassword(@FormParam ("new") String newpassword,@FormParam("current")String current,@HeaderParam("Authorization") String token){
        String split = token.split(" ")[1];
        User user = userService.getUserByEmailAndPassword(tokenUtil.getEmailFromToken(split), tokenUtil.getPasswordFromToken(split));
        if (user == null) {
            return Response.status(Response.Status.BAD_REQUEST).entity("No User").build();

        } else {
            if(newpassword.isEmpty()){
                return Response.status(Response.Status.BAD_REQUEST).entity("enter new password").build();

            }else if(current.isEmpty()){
                return Response.status(Response.Status.BAD_REQUEST).entity("enter old password").build();

            }else{
                if(!EncryptionUtil.encrypt(current).equals(user.getPassword())){
                    return Response.status(Response.Status.BAD_REQUEST).entity(" old password Incorrect").build();

                }else if(EncryptionUtil.encrypt(newpassword).equals(user.getPassword())){
                    return Response.status(Response.Status.BAD_REQUEST).entity(" new and old password cannot be the same").build();

                }else{
                    String encrypt = EncryptionUtil.encrypt(newpassword);

                    userService.changePassword(user.getId(),encrypt);
                    return Response.status(Response.Status.OK).entity("Success").build();

                }
            }

        }
    }

    @PUT
    @Path("account-addresses")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response saveAddress(@FormParam ("address") String address,@FormParam("city")String city,@FormParam("post_code")String post_code,@HeaderParam("Authorization") String token){
        String split = token.split(" ")[1];
        User user = userService.getUserByEmailAndPassword(tokenUtil.getEmailFromToken(split), tokenUtil.getPasswordFromToken(split));
        if (user == null) {
            return Response.status(Response.Status.FORBIDDEN).entity("No User").build();

        }else{
            if(address.isEmpty()){
                return Response.status(Response.Status.FORBIDDEN).entity("enter address").build();

            }else if(city.isEmpty()){
                return Response.status(Response.Status.FORBIDDEN).entity("enter city").build();

            }else if(post_code.isEmpty()){
                return Response.status(Response.Status.FORBIDDEN).entity("enter post code").build();

            }else{
                userService.saveAddress(user.getId(),address,city,post_code);
                return Response.status(Response.Status.OK).entity("Address update successflly").build();

            }
        }
    }

}
