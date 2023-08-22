package lk.freshcart.dto;

public class RegisterDTO extends AuthDTO{
    private String fname;
    private String lname;
    private String shop_name;
    private String mobile;

    public String getfname() {
        return fname;
    }

    public void setfname(String first_name) {
        this.fname = first_name;
    }

    public String getlname() {
        return lname;
    }

    public void setlname(String last_name) {
        this.lname = last_name;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
