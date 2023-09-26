package lk.freshcart.controllers;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.dto.CategoryDTO;
import lk.freshcart.entity.Category;
import lk.freshcart.services.CategoryService;
import org.glassfish.jersey.server.mvc.Viewable;

@Path("/")
public class CategoryController {
    @Path("vendor_categories")
    @GET
    public Viewable get() {
        return new Viewable("/backend/vendor/category");
    }

    @Path("admin_categories")
    @GET
    public Viewable getAll() {
        return new Viewable("/backend/admin/category");
    }

    @Path("add_category")
    @GET
    public Viewable view() {
        return new Viewable("/backend/admin/addCategory");
    }

    @Path("add_category")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response save(CategoryDTO categoryDTO) {
        CategoryService categoryService = new CategoryService();
        Category categoryByTitle = categoryService.getCategoryByTitle(categoryDTO.getTitle());
        if(categoryByTitle!=null){
            return Response.status(Response.Status.BAD_REQUEST).entity("Category already exists").build();
        }else{
            Category category = new Category();
            category.setName(categoryDTO.getTitle());
            category.setSlug(categoryDTO.getSlug());
            category.setDescription(categoryDTO.getDesc());
            if(categoryDTO.getStatus()=="Active"){
                category.setStatus(true);
            }else{
                category.setStatus(false);
            }

        }
    }

}
