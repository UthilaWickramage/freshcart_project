package lk.freshcart.providers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.stripe.Stripe;
import com.stripe.StripeClient;
import com.stripe.exception.StripeException;
import com.stripe.model.Customer;
import com.stripe.model.LineItem;
import com.stripe.model.LineItemCollection;
import com.stripe.model.Price;
import com.stripe.model.checkout.Session;
import com.stripe.param.InvoiceItemCreateParams;
import com.stripe.param.checkout.SessionCreateParams;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.ws.rs.core.Context;
import lk.freshcart.entity.CartItem;
import lk.freshcart.entity.Order;
import lk.freshcart.entity.Product;
import lk.freshcart.entity.User;
import lk.freshcart.util.Env;


import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import static spark.Spark.post;

public class PaymentServiceProvider {
    @Context
    HttpServletResponse response;

    public String getUrl(List<CartItem> cartItems, User user, Order order) throws StripeException, IOException, JsonProcessingException {

        Stripe.apiKey = Env.get("app.secret_key");
        List<SessionCreateParams.LineItem> list = new ArrayList<>();
        cartItems.forEach(cartItem -> {
            Customer customer = new Customer();
            SessionCreateParams.LineItem lineItem = SessionCreateParams.LineItem.builder()
                    .setQuantity(Long.valueOf(cartItem.getQty()))

                    .setPriceData(
                            SessionCreateParams.LineItem.PriceData.builder()
                                    .setCurrency("usd")
                                    .setUnitAmount(Math.round(cartItem.getProductId().getSale_price() + cartItem.getProductId().getShipping_price()))
                                    .setProductData(
                                            SessionCreateParams.LineItem.PriceData.ProductData.builder()

                                                    .setName(cartItem.getProductId().getTitle())
                                                    .addImage("http://localhost:8080/FreshCart/" + cartItem.getProductId().getImages().get(0))
                                                    .build())
                                    .build()).build();
            list.add(lineItem);
        });

        SessionCreateParams params =
                SessionCreateParams.builder()
                        .setMode(SessionCreateParams.Mode.PAYMENT)
                        .setSuccessUrl(Env.get("success_url")+order.getId())
                        .setCancelUrl(Env.get("cancel_url"))
                        .setClientReferenceId(order.getId().toString())
                        .addAllLineItem(list).build();


        Session session = Session.create(params);
        System.out.println(session.getUrl());
        return session.getUrl();
    }

    public void getUrl(Product product, User user) {

    }


}
