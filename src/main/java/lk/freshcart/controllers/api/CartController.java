package lk.freshcart.controllers.api;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAuthorized;
import lk.freshcart.dto.CartDTO;
import lk.freshcart.entity.CartItem;
import lk.freshcart.entity.User;
import lk.freshcart.services.CartService;
import lk.freshcart.services.UserService;
import lk.freshcart.util.JWTTokenUtil;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.Map;

@IsAuthorized
@Path("/cart")
public class CartController {
    @Inject
    CartService cartService;
    @Inject
    UserService userService;
    @Inject
    private JWTTokenUtil tokenUtil;



    @PUT
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public Response remove(@FormParam("id") Long id) {
        try {
            System.out.println(id);
            cartService.removeCartItem(id);
            return Response.status(Response.Status.OK).entity("Product Removed successfully").build();
        } catch (Exception e) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Cannot remove the product").build();
        }

    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response add(CartDTO cartDTO, @HeaderParam("Authorization") String token) {
        String split = token.split(" ")[1];
        User user = userService.getUserByEmailAndPassword(tokenUtil.getEmailFromToken(split), tokenUtil.getPasswordFromToken(split));
        if (user == null) {
            return Response.status(Response.Status.BAD_REQUEST).entity("No User").build();

        } else {
            System.out.println(user.getId() + user.getEmail());
            System.out.println(cartDTO.getQty());
            CartItem cartItem = new CartItem();
            Integer qty;
            try {
                qty = Integer.valueOf(cartDTO.getQty());
            } catch (Exception e) {
                return Response.status(Response.Status.BAD_REQUEST).entity("Please enter quantity").build();
            }
            cartItem.setQty(qty);
            cartItem.setUserId(user);
            cartItem.setActive(true);
            try {
                cartService.AddProductToCart(cartItem, cartDTO.getId());
            } catch (Exception e) {
                return Response.status(Response.Status.BAD_REQUEST).entity("Failed to Add to Cart").build();

            }
            return Response.status(Response.Status.OK).entity("Success").build();
        }


    }
}
