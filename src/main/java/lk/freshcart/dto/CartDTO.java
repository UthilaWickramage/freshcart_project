package lk.freshcart.dto;

public class CartDTO {
    private String id;
    private String qty;

    public CartDTO() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQty() {
        return qty;
    }

    public void setQty(String qty) {
        this.qty = qty;
    }
}
