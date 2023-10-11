package lk.freshcart.middleware;


import io.fusionauth.jwt.JWTExpiredException;
import jakarta.annotation.Priority;
import jakarta.inject.Inject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerRequestFilter;
import jakarta.ws.rs.container.PreMatching;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.Cookie;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.Provider;
import lk.freshcart.annotations.IsAuthorized;
import lk.freshcart.entity.User;
import lk.freshcart.services.UserService;
import lk.freshcart.util.JWTTokenUtil;

import java.io.IOException;
import java.util.Map;

@Provider
@IsAuthorized
//@Priority(1)
//@PreMatching
public class JWTValidationFilter implements ContainerRequestFilter {
    //dependency injection
    @Context
    private HttpServletRequest servletRequest;
    @Inject
    private JWTTokenUtil tokenUtil;
    @Inject
    private UserService userService;

    @Override
    public void filter(ContainerRequestContext containerRequestContext) throws IOException {



        //check if the headers contain authentication
        if (containerRequestContext.getHeaders().getFirst("Authorization") == null) {
            //send unauthorized response
            containerRequestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
        } else {

            String tokenFromAuthorization = containerRequestContext.getHeaders().getFirst("Authorization").split(" ")[1];

            try {

                User user = userService.getUserByEmailAndPassword(tokenUtil.getEmailFromToken(tokenFromAuthorization),tokenUtil.getPasswordFromToken(tokenFromAuthorization));
                if(user==null){
                    System.out.println("user is null");
                }
                if (!tokenUtil.validateToken(tokenFromAuthorization, user)) {
                    //if token is not a valid one. unauthorized response
                    containerRequestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
                }else{
                    HttpSession session = servletRequest.getSession();
                    session.setAttribute("user",user);
                }
            } catch (JWTExpiredException ex) {
                containerRequestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).entity("OH NO! TOKEN EXPIRED!").build());
            }catch ( NullPointerException e){
                containerRequestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).entity("ITS NULL").build());

            }
            catch (Exception e) {
                e.printStackTrace();
                containerRequestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
            }
        }
    }
}
