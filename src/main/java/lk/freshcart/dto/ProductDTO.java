package lk.freshcart.dto;

import java.math.BigDecimal;

public class ProductDTO {
    private String title;
    private String desc;
    private String brand;

    private Long id;
private Double weight;
private String units;
private Integer qty;
private Double r_price;
private Double s_price;
private Double ship_price;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public String getUnits() {
        return units;
    }

    public void setUnits(String units) {
        this.units = units;
    }

    public Integer getQty() {
        return qty;
    }

    public void setQty(Integer qty) {
        this.qty = qty;
    }

    public Double getR_price() {
        return r_price;
    }

    public void setR_price(Double r_price) {
        this.r_price = r_price;
    }

    public Double getS_price() {
        return s_price;
    }

    public void setS_price(Double s_price) {
        this.s_price = s_price;
    }

    public Double getShip_price() {
        return ship_price;
    }

    public void setShip_price(Double ship_price) {
        this.ship_price = ship_price;
    }
}
