package lk.freshcart.services;

import java.io.*;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import jakarta.servlet.ServletContext;
import jakarta.ws.rs.WebApplicationException;
import org.apache.commons.io.FilenameUtils;
import org.glassfish.jersey.media.multipart.ContentDisposition;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Comparator;

public class UploadService {
    private ServletContext context;
    private static final String UPLOAD_DIR_NAME = "/upload";

    public UploadService(ServletContext context) {
        this.context = context;
    }

    public FileItem upload(InputStream in, ContentDisposition fileMetaData) {
        Path UPLOAD_PATH = Paths.get(context.getRealPath(UPLOAD_DIR_NAME));
        String extension = FilenameUtils.getExtension(fileMetaData.getFileName());
        String fileName = System.currentTimeMillis() + "." + extension;
        if (!Files.exists(UPLOAD_PATH)) {
            try {
                Files.createDirectory(UPLOAD_PATH);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        try {
            int read = 0;
            byte[] bytes = new byte[1024];
            OutputStream outputStream = new FileOutputStream(new File(UPLOAD_PATH + "/" + fileName));
            while ((read = in.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            throw new WebApplicationException("Error while uplading file");
        }

        String app_url = String.format("http://%s:%s%s", "localhost", 8080, context.getContextPath());
        String url = context.getContextPath() + UPLOAD_DIR_NAME + "/" + fileName;
        String path = UPLOAD_DIR_NAME + "/" + fileName;
        String fullUrl = app_url + UPLOAD_DIR_NAME + "/" + fileName;

        return new FileItem(fileName, fileMetaData.getFileName(), path, url, fullUrl);

    }

    public FileItem upload(String directoryName, InputStream is, ContentDisposition metaData) {
        Path UPLOAD_PATH = Paths.get(context.getRealPath(UPLOAD_DIR_NAME + "/" + directoryName));
        String extension = FilenameUtils.getExtension(metaData.getFileName());
        String fileName = System.currentTimeMillis() + "." + extension;
        if (!Files.exists(UPLOAD_PATH)) {
            try {
                Files.createDirectories(UPLOAD_PATH);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        try {
            int read = 0;
            byte[] bytes = new byte[1024];
            OutputStream outputStream = new FileOutputStream(new File(UPLOAD_PATH + "/" + fileName));
            while ((read = is.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
            }
        } catch (IOException e) {
            throw new WebApplicationException("Error while uplading file");

        }
        String app_url = String.format("http://%s:%s%s", "localhost", 8080, context.getContextPath());
        String url = context.getContextPath() + UPLOAD_DIR_NAME + "/" + directoryName + "/" + fileName;
        String path = UPLOAD_DIR_NAME + "/" + directoryName + "/" + fileName;
        String fullUrl = app_url + UPLOAD_DIR_NAME + "/" + directoryName + "/" + fileName;
        return new FileItem(fileName, metaData.getFileName(), path, url, fullUrl);
    }

    public boolean detete(String file) {
        Path UPLOAD_PATH = Paths.get(context.getRealPath(UPLOAD_DIR_NAME));
        final boolean[] b = new boolean[1];
        try {
            Files.walk(UPLOAD_PATH).sorted(Comparator.reverseOrder())
                    .forEach(path -> {
                        File f = path.toFile();
                        if (f.getName().equals(file)) {
                            b[0] = f.delete();

                        }
                    });
        } catch (IOException e) {
            e.printStackTrace();
        }
        return b[0];
    }

    public void deleteDirectory(String directoryName){
        Path UPLOAD_PATH = Paths.get(context.getRealPath(UPLOAD_DIR_NAME));

        try {
            Files.walk(UPLOAD_PATH).sorted(Comparator.reverseOrder())
                    .forEach(path -> {
                        try{
                            System.out.println("Deketing"+path);
                            Files.delete(path);
                        }catch (IOException e){
                            e.printStackTrace();
                        }
                    });
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static class FileItem {
        private String fileName;
        private String fileNameOrginal;
        private String path;
        private String url;
        private String fullUrl;

        public FileItem(String fileName, String fileNameOrginal, String path, String url, String fullUrl) {
            this.fileName = fileName;
            this.fileNameOrginal = fileNameOrginal;
            this.path = path;
            this.url = url;
            this.fullUrl = fullUrl;
        }

        public FileItem() {
        }

        public String getFileName() {
            return fileName;
        }

        public void setFileName(String fileName) {
            this.fileName = fileName;
        }

        public String getFileNameOrginal() {
            return fileNameOrginal;
        }

        public void setFileNameOrginal(String fileNameOrginal) {
            this.fileNameOrginal = fileNameOrginal;
        }

        public String getPath() {
            return path;
        }

        public void setPath(String path) {
            this.path = path;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }

        public String getFullUrl() {
            return fullUrl;
        }

        public void setFullUrl(String fullUrl) {
            this.fullUrl = fullUrl;
        }
    }
}

