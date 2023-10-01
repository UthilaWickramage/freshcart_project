package lk.freshcart.controllers;

import jakarta.inject.Inject;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.dto.CartDTO;
import lk.freshcart.entity.CartItem;
import lk.freshcart.services.CartService;
import org.glassfish.jersey.server.mvc.Viewable;

import java.util.List;


@Path("/cart")
public class cartController {
    @Inject
    CartService cartService;
@GET
    public Viewable get(){
    List<CartItem> allCartItems = cartService.getAllCartItems();

    return new Viewable("/frontend/cart",allCartItems);
}

@POST
@Consumes(MediaType.APPLICATION_JSON)
    public Response add(CartDTO cartDTO) {
    System.out.println(cartDTO.getQty());
    CartItem cartItem = new CartItem();
    Integer qty;
    try {
        qty = Integer.valueOf(cartDTO.getQty());
    } catch (Exception e) {
        return Response.status(Response.Status.BAD_REQUEST).entity("Please enter quantity").build();
    }
    cartItem.setQty(qty);
    cartItem.setActive(true);
    try{
        cartService.AddProductToCart(cartItem,cartDTO.getId());
    }catch(Exception e){
        return Response.status(Response.Status.BAD_REQUEST).entity("Failed to Add to Cart").build();

    }
    return Response.status(Response.Status.OK).entity("Success").build();

}
}
