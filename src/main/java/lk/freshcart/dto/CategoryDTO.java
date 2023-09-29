package lk.freshcart.dto;

public class CategoryDTO {
    private String title;
    private String slug;
    private String desc;
    private Object file;

    public Object getFile() {
        return file;
    }

    public void setFile(Object file) {
        this.file = file;
    }

    private String status;

    public CategoryDTO() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
