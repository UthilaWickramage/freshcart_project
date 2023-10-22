package lk.freshcart.mail;


import io.rocketbase.mail.model.HtmlTextEmail;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import lk.freshcart.util.Env;

public class VerificationEmail extends Mailable{
    private String to;
    private String verification_code;
    private String name;

    public VerificationEmail(String to,String name,String verification_code){
        this.to = to;
        this.verification_code = verification_code;
        this.name = name;
    }
    @Override
    public void build(Message message) throws MessagingException {
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        System.out.println(to);
        message.setSubject("Please click the button to reset your password");
        String appUrl = Env.get("app_url");
        String verifyUrl = appUrl+"/verify?token="+verification_code;
        // generate html/text content
        HtmlTextEmail htmlTextEmail = getEmailTemplateConfigBuilder()
                .header()
                .logo("https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgULGJQeoMXWufJbJHxXMdxAc5qJh5aJGPvclGnP22VIGb7kKdiocyblezvw5o5Q2qE_c2udqYjP9SDAN-WTJdG-spj03_VvtlIg0gh9xElqtsbRV1Og8YLwLO6gOyXChFzzOgFQgUfNzmaUGyZyvEezuXgNvLv9Q9SdiyaLjvG2NarnPpN5dfcuzNma5po/s1600/freshcart-white-logo.png").logoHeight(41)
                .and()
                .text("Welcome, "+name+"!").h1().center().and()
                .text("To verify your email address click on the button below").center().and()
                .text("If you did not make this request, ignore this email").center().and()
                .button("Verify Email Address",verifyUrl).blue().and()
                .text("or click this link below").and()
                .html("<a href=\""+verifyUrl+"\">"+verifyUrl+"</a>").and()
                .copyright(appUrl).url(appUrl).suffix(". All rights reserved.").and()
                .footerText("[Company Name, LLC]\n" +
                        "1234 Street Rd.\n" +
                        "Suite 1234").and()
                .footerImage("https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgULGJQeoMXWufJbJHxXMdxAc5qJh5aJGPvclGnP22VIGb7kKdiocyblezvw5o5Q2qE_c2udqYjP9SDAN-WTJdG-spj03_VvtlIg0gh9xElqtsbRV1Og8YLwLO6gOyXChFzzOgFQgUfNzmaUGyZyvEezuXgNvLv9Q9SdiyaLjvG2NarnPpN5dfcuzNma5po/s1600/freshcart-white-logo.png").width(100).linkUrl("https://www.rocketbase.io").and()
                .build();
        message.setContent(htmlTextEmail.getHtml(),"text/html");

    }
}
