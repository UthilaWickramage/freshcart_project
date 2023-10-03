package lk.freshcart.controllers.ui.admin;


import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.MultivaluedMap;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAdmin;
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

@IsAdmin
@Path("/")
public class CategoryController {
    @Inject
    CategoryService categoryService;


    @Path("admin_categories")
    @GET
    public Viewable getAll() {
        List<Category> allCategories = categoryService.getAllCategories();
        return new Viewable("/backend/admin/category", allCategories);
    }

    @Path("add_category")
    @GET
    public Viewable view() {
        return new Viewable("/backend/admin/addCategory");
    }



}
