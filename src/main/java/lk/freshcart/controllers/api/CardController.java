package lk.freshcart.controllers.api;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAuthorized;
import lk.freshcart.entity.CardType;
import lk.freshcart.entity.Cards;
import lk.freshcart.entity.User;
import lk.freshcart.services.AccountService;
import lk.freshcart.services.UserService;
import lk.freshcart.util.JWTTokenUtil;

@IsAuthorized
@Path("/api")
public class CardController {
    @Inject
    UserService userService;
    @Inject
    JWTTokenUtil tokenUtil;
    AccountService accountService = new AccountService();
    @POST
    @Path("account-payment-methods")
    @Produces(MediaType.APPLICATION_FORM_URLENCODED)
    public Response save(@FormParam("name") String name,
                         @FormParam("number")String number,
                         @FormParam("cvv") String cvv,
                         @FormParam("month") String month,
                         @FormParam("year") String year,
                         @FormParam("type") String type,
                         @HeaderParam("Authorization")String token){
        System.out.println(cvv);
        System.out.println(month);
        System.out.println(number);
        System.out.println(name);
        System.out.println(year);
        System.out.println(type);
        System.out.println(token);
        User user;
        if(token!=null){
            String split = token.split(" ")[1];
             user= userService.getUserByEmailAndPassword(tokenUtil.getEmailFromToken(split), tokenUtil.getPasswordFromToken(split));

        }else{
            System.out.println("its null");
            user = null;
        }
        if (user == null) {
            return Response.status(Response.Status.BAD_REQUEST).entity("No User").build();

        } else {
            if(name.isEmpty()){
                return Response.status(Response.Status.BAD_REQUEST).entity("enter name").build();

            }else if(number.isEmpty()){
                return Response.status(Response.Status.BAD_REQUEST).entity("enter number").build();

            }else if(cvv.isEmpty()){
                return Response.status(Response.Status.BAD_REQUEST).entity("enter cvv").build();

            }else if(month.isEmpty()){
                return Response.status(Response.Status.BAD_REQUEST).entity("select month").build();

            }else if(year.isEmpty()){
                return Response.status(Response.Status.BAD_REQUEST).entity("select year").build();

            }else if(type.isEmpty()){
                return Response.status(Response.Status.BAD_REQUEST).entity("enter type").build();

            }else{
                Cards card = new Cards();
                card.setCard_number(number);
                card.setCvv(cvv);
                card.setMonth(month);
                card.setYear(year);
                card.setUserId(user);
                card.setActive(true);
                if(type.equals("american")){
                    card.setCardType(CardType.AMERICAN_EXPRESS);
                }else if(type.equals("visa")){
                    card.setCardType(CardType.VISA);
                }else if(type.equals("mastercard")){
                    card.setCardType(CardType.MASTERCARD);
                }else{
                    return Response.status(Response.Status.BAD_REQUEST).entity("Invalid card type").build();
                }
                accountService.saveCard(card);
                return Response.status(Response.Status.OK).entity("Success").build();
            }

        }
    }
}
