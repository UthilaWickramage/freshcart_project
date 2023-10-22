package lk.freshcart.mail;

import io.rocketbase.mail.EmailTemplateBuilder;
import io.rocketbase.mail.Header;
import io.rocketbase.mail.config.TbConfiguration;
import io.rocketbase.mail.model.HtmlTextEmail;
import io.rocketbase.mail.preset.TableSimplePreset;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import lk.freshcart.entity.Product;
import lk.freshcart.util.Env;

import java.math.BigDecimal;
import java.util.List;

public class InvoiceEmail extends Mailable {
    private String name;
    private Long id;
    private String to;
    private Double total;
    private List<Product> products;

    public InvoiceEmail(String name, Long id, String to, Double total, List<Product> products) {
        this.name = name;
        this.id = id;
        this.to = to;
        this.total = total;
        this.products = products;
    }

    @Override
    public void build(Message message) throws MessagingException {
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject("FreshCart Invoice for your order");
        String appUrl = Env.get("app_url");


        EmailTemplateBuilder.EmailTemplateConfigBuilder emailTemplateConfigBuilder = getEmailTemplateConfigBuilder();


        Header header = emailTemplateConfigBuilder.header()
                .logo("https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgULGJQeoMXWufJbJHxXMdxAc5qJh5aJGPvclGnP22VIGb7kKdiocyblezvw5o5Q2qE_c2udqYjP9SDAN-WTJdG-spj03_VvtlIg0gh9xElqtsbRV1Og8YLwLO6gOyXChFzzOgFQgUfNzmaUGyZyvEezuXgNvLv9Q9SdiyaLjvG2NarnPpN5dfcuzNma5po/s1600/freshcart-white-logo.png").logoHeight(41);

        TableSimplePreset tableSimplePreset = header.and().text("Hi " + name + ",").and().text("Thanks for your purchase. This is an invoice for your recent purchase").and()
                .text("Your order id is " + id).and()
                .tableSimple("##.# '$'")
                .headerRow("Description", "Amount");
        products.forEach(product -> {
            tableSimplePreset.itemRow(product.getDescription(), BigDecimal.valueOf(product.getSale_price() + product.getShipping_price()));
        });

        tableSimplePreset.footerRow("Total", BigDecimal.valueOf(total))
                .and()
                .button("Download PDF", appUrl).gray().right().and()
                .text("If you have any questions about this receipt, simply reply to this email or reach out to our support team for help.").and()
                .copyright("FreshCart").url(appUrl).suffix(". All rights reserved.").and()
                .footerText("[Company Name, LLC]\n" +
                        "1234 Street Rd.\n" +
                        "Suite 1234").and()
                .footerImage("https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgULGJQeoMXWufJbJHxXMdxAc5qJh5aJGPvclGnP22VIGb7kKdiocyblezvw5o5Q2qE_c2udqYjP9SDAN-WTJdG-spj03_VvtlIg0gh9xElqtsbRV1Og8YLwLO6gOyXChFzzOgFQgUfNzmaUGyZyvEezuXgNvLv9Q9SdiyaLjvG2NarnPpN5dfcuzNma5po/s1600/freshcart-white-logo.png").width(100).linkUrl(appUrl).and();

        HtmlTextEmail htmlTextEmail = emailTemplateConfigBuilder.build();
        message.setContent(htmlTextEmail.getHtml(), "text/html");

    }
}

