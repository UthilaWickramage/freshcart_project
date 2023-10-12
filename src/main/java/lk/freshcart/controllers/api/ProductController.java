package lk.freshcart.controllers.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import jakarta.inject.Inject;
import jakarta.servlet.ServletContext;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.MultivaluedMap;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAuthorized;
import lk.freshcart.dto.CategoryDTO;
import lk.freshcart.dto.ProductDTO;
import lk.freshcart.entity.Category;
import lk.freshcart.entity.Product;
import lk.freshcart.services.CategoryService;
import lk.freshcart.services.ProductService;
import lk.freshcart.services.UploadService;
import org.glassfish.jersey.media.multipart.ContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataBodyPart;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.glassfish.jersey.server.mvc.Viewable;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@IsAuthorized
@Path("/vendor/api/add_product")
public class ProductController {
    @Inject
    ProductService productService;
    @Inject
    CategoryService categoryService;
    @Context
    ServletContext context;

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response save(ProductDTO dto) {

        Product product = new Product();
        product.setTitle(dto.getTitle());
        product.setDescription(dto.getDesc());
        product.setBrand(dto.getBrand());
        Category categoryById = categoryService.getCategoryById(dto.getId());
        product.setCategoryId(categoryById);
        product.setWeight(dto.getWeight());
        product.setUnit(dto.getUnits());
        product.setQty(dto.getQty());
        product.setRegular_price(dto.getR_price());
        product.setSale_price(dto.getS_price());
        product.setShipping_price(dto.getShip_price());
        if (dto.getQty() > 0) {
            product.setInStock(true);
        } else {
            product.setInStock(false);
        }
        product.setActive(false);

        productService.saveProduct(product);


        ObjectNode jsonNodes = new ObjectMapper().createObjectNode();
        jsonNodes.put("pid", product.getId());
        return Response.ok().entity(jsonNodes).build();

    }

    @POST
    @Path("/{id}/upload-image")
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    @Produces(MediaType.APPLICATION_JSON)
    public Response upload(
            @PathParam("id") Long id,
            @FormDataParam("files[]") FormDataBodyPart body) {
        System.out.println(id);
        List<UploadService.FileItem> items = new ArrayList<>();
        UploadService uploadService = new UploadService(context);
        Product product = productService.getProductById(id);

        body.getParent().getBodyParts().forEach(part -> {
            InputStream is = part.getEntityAs(InputStream.class);
            ContentDisposition contentDisposition = part.getContentDisposition();
            UploadService.FileItem fileItem = uploadService.upload("product/" + id, is, contentDisposition);
            items.add(fileItem);
            product.getImages().add(fileItem.getPath());
        });
        productService.update(product);

        return Response.status(Response.Status.OK).entity(items).build();
    }
}


