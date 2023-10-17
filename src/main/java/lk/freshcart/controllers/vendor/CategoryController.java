package lk.freshcart.controllers.vendor;

import jakarta.inject.Inject;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.MultivaluedMap;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsVendor;
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

@IsVendor
@Path("/vendor/categories")
public class CategoryController {
    @Inject
    CategoryService categoryService;

    @GET
    public Viewable get() {

        List<Category> allCategories = categoryService.getAllActiveCategories();

        return new Viewable("/backend/vendor/category", allCategories);
    }
}

