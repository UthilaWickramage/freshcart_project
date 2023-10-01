package lk.freshcart.config;

import jakarta.inject.Singleton;
import lk.freshcart.services.CartService;
import lk.freshcart.services.CategoryService;
import lk.freshcart.services.ProductService;
import lk.freshcart.services.UserService;
import lk.freshcart.util.JWTTokenUtil;
import org.glassfish.hk2.utilities.binding.AbstractBinder;

public class DependencyBinder extends AbstractBinder {
    @Override
    protected void configure() {
        //to use jwtTokenUtil as singleton
        bind(JWTTokenUtil.class).to(JWTTokenUtil.class).in(Singleton.class);
        bind(UserService.class).to(UserService.class).in(Singleton.class);
        bind(ProductService.class).to(ProductService.class).in(Singleton.class);
        bind(CategoryService.class).to(CategoryService.class).in(Singleton.class);
        bind(CartService.class).to(CartService.class).in(Singleton.class);
    }
}
