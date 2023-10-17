package lk.freshcart.controllers.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import jakarta.servlet.ServletContext;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lk.freshcart.annotations.IsAdmin;
import lk.freshcart.entity.AppSetting;
import lk.freshcart.entity.Category;
import lk.freshcart.services.AppService;
import lk.freshcart.services.UploadService;
import org.glassfish.jersey.media.multipart.ContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataBodyPart;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.glassfish.jersey.server.mvc.Viewable;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@IsAdmin
@Path("/admin/api/keywords")
public class KeywordController {
    @Context
    ServletContext servletContext;
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response get(@FormParam("name") String name, @FormParam("value") String value) {

        if (name.isEmpty()) {
            return Response.status(Response.Status.NOT_FOUND).entity("Enter name").build();
        } else {
            AppService appService = new AppService();
            AppSetting appSetting = new AppSetting();
            appSetting.setName(name);
            appSetting.setValue(value);
            appService.save(appSetting);
            ObjectNode jsonNodes = new ObjectMapper().createObjectNode();
            jsonNodes.put("kid",appSetting.getId());
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
        AppService appService = new AppService();
        System.out.println(id);
        List<UploadService.FileItem> items = new ArrayList<>();
        UploadService uploadService = new UploadService(servletContext);
        AppSetting keyword = appService.getKeywordById(id);

        body.getParent().getBodyParts().forEach(part -> {
            InputStream is = part.getEntityAs(InputStream.class);
            ContentDisposition contentDisposition = part.getContentDisposition();
            UploadService.FileItem fileItem = uploadService.upload("app/" + id, is, contentDisposition);
            items.add(fileItem);
            keyword.setValue(fileItem.getPath());
            keyword.setStatus(1);
        });
        appService.update(keyword);

        return Response.status(Response.Status.OK).entity(items).build();
    }
}
