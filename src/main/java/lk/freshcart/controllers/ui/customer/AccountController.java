package lk.freshcart.controllers.ui.customer;

import jakarta.inject.Inject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Context;
import lk.freshcart.annotations.IsUser;
import lk.freshcart.entity.Cards;
import lk.freshcart.entity.User;
import lk.freshcart.services.AccountService;
import lk.freshcart.services.UserService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@IsUser
@Path("/")
public class AccountController {
    @Context
    HttpServletRequest request;
    @Context
    HttpServletResponse response;
    @Inject
    UserService userService;
    @GET
    @Path("account-addresses")
    public Viewable get1(){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user!=null){
            return new Viewable("/frontend/account/address",user);
        }else{
            return new Viewable("/frontend/account/address");
        }

    }

    @GET
    @Path("account-payment-methods")
    public Viewable get2(){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        AccountService accountService = new AccountService();
        Set<Cards> cardsListByUser = accountService.getCardsListByUser(user);
        return new Viewable("/frontend/account/payment_methods",cardsListByUser);
    }

    @GET
    @Path("account-settings")
    public Viewable get3(){
        User user = (User) request.getSession().getAttribute("user");
        User byEmail = userService.getByEmail(user.getEmail());

        return new Viewable("/frontend/account/settings",byEmail);
    }

    @GET
    @Path("account-orders")
    public Viewable get4(){
        return new Viewable("/frontend/account/orders");
    }
    @GET
    @Path("account-notifications")
    public Viewable get5(){
        return new Viewable("/frontend/account/notification");
    }
}
