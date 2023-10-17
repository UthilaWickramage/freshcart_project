package lk.freshcart.controllers.admin.api;

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
import lk.freshcart.entity.Category;
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
@Path("/admin/api/add_category")
public class CategoryController {
    @Inject
    CategoryService categoryService;
    @Context
    ServletContext context;

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response save(CategoryDTO dto) {

        Category categoryByTitle = categoryService.getCategoryByTitle(dto.getTitle());
        if (categoryByTitle != null) {
            return Response.status(Response.Status.FORBIDDEN).entity("Category already exists").build();
        } else {
            Category category = new Category();
            category.setName(dto.getTitle());
            category.setSlug(dto.getSlug());
            category.setDescription(dto.getDesc());

            category.setStatus(false);

            categoryService.SaveCategory(category);
            ObjectNode jsonNodes = new ObjectMapper().createObjectNode();
            jsonNodes.put("cid", category.getId());
            return Response.ok().entity(jsonNodes).build();
        }
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
        Category category = categoryService.getCategoryById(id);

        body.getParent().getBodyParts().forEach(part -> {
            InputStream is = part.getEntityAs(InputStream.class);
            ContentDisposition contentDisposition = part.getContentDisposition();
            UploadService.FileItem fileItem = uploadService.upload("category/" + id, is, contentDisposition);
            items.add(fileItem);
            category.setImage_url(fileItem.getPath());
            category.setStatus(true);
        });
        categoryService.update(category);

        return Response.status(Response.Status.OK).entity(items).build();
    }
}


