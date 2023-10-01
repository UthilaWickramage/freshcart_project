package lk.freshcart.controllers;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.MultivaluedMap;
import jakarta.ws.rs.core.Response;
import lk.freshcart.dto.CategoryDTO;
import lk.freshcart.entity.Category;
import lk.freshcart.services.CategoryService;
import lk.freshcart.services.UploadService;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.glassfish.jersey.server.mvc.Viewable;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Path("/")
public class CategoryController {
    @Inject
    CategoryService categoryService;
    @Path("vendor_categories")
    @GET
    public Viewable get() {

        List<Category> allCategories = categoryService.getAllActiveCategories();

        return new Viewable("/backend/vendor/category",allCategories);
    }

    @Path("admin_categories")
    @GET
    public Viewable getAll() {
        List<Category> allCategories = categoryService.getAllCategories();
        return new Viewable("/backend/admin/category",allCategories);
    }

    @Path("add_category")
    @GET
    public Viewable view() {
        return new Viewable("/backend/admin/addCategory");
    }

    @Path("add_category")
    @POST
    public Response save(
            @FormDataParam("file") InputStream in,
                         @FormDataParam("file") FormDataContentDisposition info,
                         @FormParam("title") String title,
                         @FormParam("category") String slug,
                         @FormParam("desc") String desc,
                         @FormParam("status") String status

    ) throws IOException {

        Category categoryByTitle = categoryService.getCategoryByTitle(title);
        if (categoryByTitle != null) {
            return Response.status(Response.Status.BAD_REQUEST).entity("Category already exists").build();
        } else {
            Category category = new Category();
            category.setName(title);
            category.setSlug(slug);
            category.setDescription(desc);
            if (status.equals("Active")) {
                category.setStatus(true);
            } else {
                category.setStatus(false);
            }
            String uploadedFileLocation = "src//main//webapp//uploaded//categories//"+info.getFileName();
            String[] uploadeds = uploadedFileLocation.split("webapp//");
            UploadService.writeToFile(in,uploadedFileLocation);
            String output = uploadeds[1];
category.setImage_url(output);
            categoryService.SaveCategory(category);
            return Response.status(Response.Status.OK).entity(output).build();
        }
    }

}
