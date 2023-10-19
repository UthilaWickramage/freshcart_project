package lk.freshcart.controllers.api;

import jakarta.persistence.NoResultException;
import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;
import lk.freshcart.entity.User;
import lk.freshcart.mail.ResetPasswordEmail;
import lk.freshcart.providers.MailServiceProvider;
import lk.freshcart.util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.UUID;

@Path("/api/forgotPassword")
public class ForgotPasswordController {
    @POST
    public Response sendEmail(@FormParam("email") String email) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            System.out.println(email);
            try {
                System.out.println(email);
                User byEmail = session.createQuery("select u from User u where email=:email", User.class).setParameter("email", email).getSingleResult();
                String verification_code = UUID.randomUUID().toString();
                Transaction transaction = session.beginTransaction();
                byEmail.setVerification_code(verification_code);
                transaction.commit();
                ResetPasswordEmail forgotPasswordEmail = new ResetPasswordEmail(byEmail.getEmail(), byEmail.getFirst_name(), byEmail.getVerification_code());
                MailServiceProvider.getInstance().sendEmail(forgotPasswordEmail);
                return Response.ok().entity("Check your inbox").build();

            } catch (NoResultException e) {
                e.printStackTrace();
                return Response.status(Response.Status.BAD_REQUEST).entity("no such email").build();

            }

        } catch (Exception e) {
            e.printStackTrace();
            return Response.status(Response.Status.BAD_REQUEST).build();
        }
    }
}
