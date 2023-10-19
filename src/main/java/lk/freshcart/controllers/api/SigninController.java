package lk.freshcart.controllers.api;

import jakarta.inject.Inject;
import jakarta.inject.Singleton;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAuthorized;
import lk.freshcart.dto.AuthDTO;
import lk.freshcart.dto.AuthResponseDTO;
import lk.freshcart.entity.User;
import lk.freshcart.entity.UserType;
import lk.freshcart.services.UserService;
import lk.freshcart.util.EncryptionUtil;
import lk.freshcart.util.JWTTokenUtil;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.Date;



@Path("/signin")
public class SigninController {
    @Context
    HttpServletRequest request;
    @Inject
    JWTTokenUtil jwtTokenUtil;
    @Inject
    UserService userService;

    @GET
    public Viewable get() {
        return new Viewable("/frontend/auth/signin");
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response signinAction(AuthDTO authDTO) {

        if (authDTO.getEmail() == null) {
            return Response.status(Response.Status.BAD_REQUEST).entity("email cannot be empty").build();
        } else if (authDTO.getPassword() == null) {
            return Response.status(Response.Status.BAD_REQUEST).entity("password cannot be empty").build();
        } else {
            User userByEmail = userService.getByEmail(authDTO.getEmail());
            if (userByEmail != null) {
                if (EncryptionUtil.encrypt(authDTO.getPassword()).equals(userByEmail.getPassword())) {
                    if (userByEmail.getActive() && !userByEmail.getEmail_verified_at().isEmpty()) {
                        String accessToken = jwtTokenUtil.generateAccessToken(userByEmail);
                        String refreshToken = jwtTokenUtil.generateRefreshToken(userByEmail);
                        Date expiredDateFromToken = jwtTokenUtil.getExpiredDateFromToken(accessToken);
                        AuthResponseDTO authResponseDTO = new AuthResponseDTO(accessToken, refreshToken, String.valueOf(expiredDateFromToken.getTime()));
                        HttpSession session = request.getSession();
                        if (userByEmail.getUserType() == UserType.CUSTOMER) {
                            session.setAttribute("user", userByEmail);
                        } else if (userByEmail.getUserType() == UserType.VENDOR) {
                            session.setAttribute("vendor", userByEmail);
                        } else if (userByEmail.getUserType() == UserType.ADMIN) {
                            session.setAttribute("admin", userByEmail);
                        }
                        return Response.status(Response.Status.OK).entity(authResponseDTO).build();
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("user", userByEmail.getId());
                        return Response.status(Response.Status.FORBIDDEN).build();
                    }
                } else {
                    return Response.status(Response.Status.UNAUTHORIZED).entity("Username or password incorrect").build();
                }
            } else {
                return Response.status(Response.Status.UNAUTHORIZED).entity("username or password incorrect").build();
            }
        }

    }

    @POST
    @Path("/refresh-token")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public Response refreshResponse(@FormParam("token") String refreshToken) {
        User userbyEmail = userService.getByEmail(jwtTokenUtil.getEmailFromToken(refreshToken));
        //if user is null
        if (userbyEmail == null || !jwtTokenUtil.validateToken(refreshToken, userbyEmail)) {
            return Response.status(Response.Status.UNAUTHORIZED).entity("Invalid refresh Token").build();

        } else {
            String accessToken = jwtTokenUtil.generateAccessToken(userbyEmail);
            Date expiredDateFromToken = jwtTokenUtil.getExpiredDateFromToken(accessToken);
            //send dto with old refresh token
            AuthResponseDTO authResponseDTO = new AuthResponseDTO(accessToken, refreshToken, String.valueOf(expiredDateFromToken.getTime()));
            return Response.ok().entity(authResponseDTO).build();
        }
    }
}
