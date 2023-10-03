package lk.freshcart.controllers.api;

import jakarta.inject.Inject;
import jakarta.ws.rs.FormParam;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAuthorized;
import lk.freshcart.entity.Category;
import lk.freshcart.entity.Product;
import lk.freshcart.entity.ProductImage;
import lk.freshcart.entity.User;
import lk.freshcart.services.CategoryService;
import lk.freshcart.services.ProductService;
import lk.freshcart.services.UploadService;
import org.glassfish.jersey.media.multipart.*;
import org.glassfish.jersey.server.mvc.Viewable;

import javax.swing.text.View;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

@IsAuthorized
@Path("/")
public class ProductController {
    @Inject
    ProductService productService;

    @Path("add-product")
    @POST
    public Response save(@FormDataParam("file") InputStream in,
                         @FormDataParam("file") FormDataContentDisposition info,
                         @FormParam("title") String title,
                         @FormParam("brand") String brand,
                         @FormParam("category") String category,
                         @FormParam("desc") String desc,
                         @FormParam("status") String status,
                         @FormParam("weight") String weight,
                         @FormParam("units") String units,
                         @FormParam("r_price") String r_price,
                         @FormParam("s_price") String s_price,
                         @FormParam("ship_price") String ship_price,
                         @FormParam("qty") String qty
    ) throws IOException {


        Product product = new Product();

        product.setTitle(title);
        product.setBrand(brand);
        product.setDescription(desc);
        if (status.equals("Active")) {
            product.setActive(true);
        } else {
            product.setActive(false);
        }
        product.setWeight(Double.valueOf(weight));
        product.setUnit(units);
        product.setRegular_price(Double.valueOf(r_price));
        product.setSale_price(Double.valueOf(s_price));
        product.setShipping_price(Double.valueOf(ship_price));
        Integer q = Integer.valueOf(qty);
        if(q>0){
            product.setInStock(true);
        }else{
            product.setInStock(false);
        }
        product.setQty(q);

        ProductImage image = new ProductImage();


        String uploadedFileLocation = "src//main//webapp//uploaded//products//" + info.getFileName();
        String[] uploadeds = uploadedFileLocation.split("webapp//");
        UploadService.writeToFile(in, uploadedFileLocation);
        String output = uploadeds[1];
        Set<ProductImage> set = new HashSet<>();
        image.setUrl(output);
        set.add(image);
        product.setProductImage(set);


        productService.saveProduct(image, product, category);


        return Response.status(Response.Status.OK).build();

    }

}
