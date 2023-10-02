package lk.freshcart.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "cart_item")
public class CartItem extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer qty;
private Double item_sale_total;
private Double item_shipping_total;

    public Double getItem_sale_total() {
        return item_sale_total;
    }

    public void setItem_sale_total(Double item_sale_total) {
        this.item_sale_total = item_sale_total;
    }

    public Double getItem_shipping_total() {
        return item_shipping_total;
    }

    public void setItem_shipping_total(Double item_shipping_total) {
        this.item_shipping_total = item_shipping_total;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    private Product productId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User userId;

    public CartItem() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    private Boolean active;
}
