package lk.freshcart.controllers.api;

import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.core.Response;
import lk.freshcart.entity.User;
import lk.freshcart.services.UserService;
import lk.freshcart.util.EncryptionUtil;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;

@Path("/resetPassword")
public class ResetPasswordController {
    @PUT
    public Response reset(@FormParam("password") String password,@FormParam("token") String token){
        System.out.println(token);
        UserService userService = new UserService();
        try(Session session = HibernateUtil.getSessionFactory().openSession()){
User user = session.createQuery("select u from User u where verification_code=:token", User.class).setParameter("token",token).getSingleResult();
        user.setPassword(EncryptionUtil.encrypt(password));
            System.out.println(password);
        userService.changePassword(user);
        return Response.ok().build();
        }catch (Exception e){
            e.printStackTrace();
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
    }
}
