//package lk.freshcart.middleware;
//
//
//import io.fusionauth.jwt.JWTExpiredException;
//import jakarta.annotation.Priority;
//import jakarta.inject.Inject;
//import jakarta.ws.rs.container.ContainerRequestContext;
//import jakarta.ws.rs.container.ContainerRequestFilter;
//import jakarta.ws.rs.container.PreMatching;
//import jakarta.ws.rs.core.Response;
//import jakarta.ws.rs.ext.Provider;
//import lk.freshcart.entity.User;
//import lk.freshcart.services.UserService;
//import lk.freshcart.util.JWTTokenUtil;
//
//import java.io.IOException;
//
//@Provider
//@Priority(1)
//@PreMatching
//public class JWTValidationFilter implements ContainerRequestFilter {
//    //dependency injection
//    @Inject
//    private JWTTokenUtil tokenUtil;
//    @Inject
//    private UserService userService;
//
//    @Override
//    public void filter(ContainerRequestContext containerRequestContext) throws IOException {
//        //get the request path
//        String path = containerRequestContext.getUriInfo().getPath();
//        if (path.equals("auth")|| path.equals("refresh-token") ||path.equals("")|| path.equals("cart") || path.equals("register")) {
//            //returns without going further for the above paths
//            return;
//        }
//        //check if the headers contain authentication
//        if (containerRequestContext.getHeaders().getFirst("Authorization") == null) {
//            //send unauthorized response
//            containerRequestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
//        } else {
//
//            String tokenFromAuthorization = containerRequestContext.getHeaders().getFirst("Authorization").split(" ")[1];
//            try {
//                User user = userService.getUserByEmailAndPassword(tokenUtil.getEmailFromToken(tokenFromAuthorization),tokenUtil.getPasswordFromToken(tokenFromAuthorization));
//                if (!tokenUtil.validateToken(tokenFromAuthorization, user)) {
//                    //if token is not a valid one. unauthorized response
//                    containerRequestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
//                }
//            } catch (JWTExpiredException | NullPointerException ex) {
//                containerRequestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).entity("OH NO! TOKEN EXPIRED!").build());
//            } catch (Exception e) {
//                e.printStackTrace();
//                containerRequestContext.abortWith(Response.status(Response.Status.UNAUTHORIZED).build());
//            }
//        }
//    }
//}
