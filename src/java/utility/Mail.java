/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

/**
 *
 * @author tddaij
 */
public class Mail {
    final String from = "FBT-Elearning";
    final String url = "http://localhost:8080/";
    public Session login(){
        // Sender's email ID needs to be mentioned
        
        final String username = "fbtelearning@gmail.com";
        final String password = "elearning123";
        String host = "smtp.gmail.com";
     
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        // Get the Session object.
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
        return session;
    }
      

    public void sendRegistrationMail(String toEmail, String token, HttpSession httpSession, String nickname){
        
        try {

            Session session = login();
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));

            // Set Subject: header field
            message.setSubject("Activate your account!");
            String template = template("verify", token, nickname);
            // Set template email
            message.setContent(template,"text/html; charset=utf-8");

            // Send message
            httpSession.removeAttribute("token");
            Transport.send(message);
            
            System.out.println("Sent message successfully....");
            
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    
    public void sendMailForgotPassword(String toEmail, HttpSession httpSession){
        try {

            String nickname = toEmail.substring(0, toEmail.indexOf("@"));
            String token = httpSession.getAttribute("token").toString();
            Session session = login();
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(toEmail));

            // Set Subject: header field
            message.setSubject("Reset Password");
            String template = template("forgot", token, nickname);
            // Send the actual HTML message, as big as you like
            message.setContent(template ,"text/html; charset=utf-8");

            // Send message
            httpSession.removeAttribute("token");
            Transport.send(message);
            
            System.out.println("Sent message successfully....");
            
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    
        private String template(String action, String token, String nickname){
            String template = "";
            if (action.equalsIgnoreCase("verify")){
         template = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
"<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n" +
"<head>\n" +
"<!--[if gte mso 9]>\n" +
"<xml>\n" +
"  <o:OfficeDocumentSettings>\n" +
"    <o:AllowPNG/>\n" +
"    <o:PixelsPerInch>96</o:PixelsPerInch>\n" +
"  </o:OfficeDocumentSettings>\n" +
"</xml>\n" +
"<![endif]-->\n" +
"  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
"  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
"  <meta name=\"x-apple-disable-message-reformatting\">\n" +
"  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->\n" +
"  <title></title>\n" +
"  \n" +
"    <style type=\"text/css\">\n" +
"      table, td { color: #000000; } a { color: #0000ee; text-decoration: underline; } @media (max-width: 480px) { #u_content_image_1 .v-container-padding-padding { padding: 10px 10px 15px !important; } #u_content_image_1 .v-src-width { width: 1910px !important; } #u_content_image_1 .v-src-max-width { max-width: 36% !important; } #u_content_heading_1 .v-container-padding-padding { padding: 15px 10px 10px !important; } #u_content_heading_1 .v-font-size { font-size: 35px !important; } }\n" +
"@media only screen and (min-width: 570px) {\n" +
"  .u-row {\n" +
"    width: 550px !important;\n" +
"  }\n" +
"  .u-row .u-col {\n" +
"    vertical-align: top;\n" +
"  }\n" +
"\n" +
"  .u-row .u-col-100 {\n" +
"    width: 550px !important;\n" +
"  }\n" +
"\n" +
"}\n" +
"\n" +
"@media (max-width: 570px) {\n" +
"  .u-row-container {\n" +
"    max-width: 100% !important;\n" +
"    padding-left: 0px !important;\n" +
"    padding-right: 0px !important;\n" +
"  }\n" +
"  .u-row .u-col {\n" +
"    min-width: 320px !important;\n" +
"    max-width: 100% !important;\n" +
"    display: block !important;\n" +
"  }\n" +
"  .u-row {\n" +
"    width: calc(100% - 40px) !important;\n" +
"  }\n" +
"  .u-col {\n" +
"    width: 100% !important;\n" +
"  }\n" +
"  .u-col > div {\n" +
"    margin: 0 auto;\n" +
"  }\n" +
"}\n" +
"body {\n" +
"  margin: 0;\n" +
"  padding: 0;\n" +
"}\n" +
"\n" +
"table,\n" +
"tr,\n" +
"td {\n" +
"  vertical-align: top;\n" +
"  border-collapse: collapse;\n" +
"}\n" +
"\n" +
"p {\n" +
"  margin: 0;\n" +
"}\n" +
"\n" +
".ie-container table,\n" +
".mso-container table {\n" +
"  table-layout: fixed;\n" +
"}\n" +
"\n" +
"* {\n" +
"  line-height: inherit;\n" +
"}\n" +
"\n" +
"a[x-apple-data-detectors='true'] {\n" +
"  color: inherit !important;\n" +
"  text-decoration: none !important;\n" +
"}\n" +
"\n" +
"</style>\n" +
"  \n" +
"  \n" +
"\n" +
"<!--[if !mso]><!--><link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap\" rel=\"stylesheet\" type=\"text/css\"><!--<![endif]-->\n" +
"\n" +
"</head>\n" +
"\n" +
"<body class=\"clean-body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">\n" +
"  <!--[if IE]><div class=\"ie-container\"><![endif]-->\n" +
"  <!--[if mso]><div class=\"mso-container\"><![endif]-->\n" +
"  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">\n" +
"  <tbody>\n" +
"  <tr style=\"vertical-align: top\">\n" +
"    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
"    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->\n" +
"    \n" +
"\n" +
"<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
"  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n" +
"    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n" +
"      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n" +
"      \n" +
"<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
"<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
"  <div style=\"width: 100% !important;\">\n" +
"  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
"  \n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 0px solid #BBBBBB;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
"    <tbody>\n" +
"      <tr style=\"vertical-align: top\">\n" +
"        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
"          <span>&#160;</span>\n" +
"        </td>\n" +
"      </tr>\n" +
"    </tbody>\n" +
"  </table>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
"  </div>\n" +
"</div>\n" +
"<!--[if (mso)|(IE)]></td><![endif]-->\n" +
"      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
"    </div>\n" +
"  </div>\n" +
"</div>\n" +
"\n" +
"\n" +
"\n" +
"<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
"  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n" +
"    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n" +
"      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n" +
"      \n" +
"<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
"<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
"  <div style=\"width: 100% !important;\">\n" +
"  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
"  \n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:0px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
"  <tr>\n" +
"    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n" +
"      \n" +
"      <img align=\"center\" border=\"0\" src=\"https://i.imgur.com/ksvMD9q.png\" alt=\"Image\" title=\"Image\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 550px;\" width=\"550\" class=\"v-src-width v-src-max-width\"/>\n" +
"      \n" +
"    </td>\n" +
"  </tr>\n" +
"</table>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
"  </div>\n" +
"</div>\n" +
"<!--[if (mso)|(IE)]></td><![endif]-->\n" +
"      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
"    </div>\n" +
"  </div>\n" +
"</div>\n" +
"\n" +
"\n" +
"\n" +
"<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
"  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n" +
"    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n" +
"      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n" +
"      \n" +
"<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
"<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
"  <div style=\"width: 100% !important;\">\n" +
"  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
"  \n" +
"<table id=\"u_content_image_1\" style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:0px 10px 15px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
"  <tr>\n" +
"    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n" +
"      \n" +
"      <img align=\"center\" border=\"0\" src=\"https://i.imgur.com/DZilQPU.png\" alt=\"Logo\" title=\"Logo\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 132.5px;\" width=\"132.5\" class=\"v-src-width v-src-max-width\"/>\n" +
"      \n" +
"    </td>\n" +
"  </tr>\n" +
"</table>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
"  </div>\n" +
"</div>\n" +
"<!--[if (mso)|(IE)]></td><![endif]-->\n" +
"      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
"    </div>\n" +
"  </div>\n" +
"</div>\n" +
"\n" +
"\n" +
"\n" +
"<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
"  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n" +
"    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n" +
"      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n" +
"      \n" +
"<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
"<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
"  <div style=\"width: 100% !important;\">\n" +
"  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
"  \n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid #BBBBBB;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
"    <tbody>\n" +
"      <tr style=\"vertical-align: top\">\n" +
"        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
"          <span>&#160;</span>\n" +
"        </td>\n" +
"      </tr>\n" +
"    </tbody>\n" +
"  </table>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"<table id=\"u_content_heading_1\" style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:30px 10px 10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"  <h1 class=\"v-font-size\" style=\"margin: 0px; color: #5d49d6; line-height: 140%; text-align: center; word-wrap: break-word; font-weight: normal; font-family: comic sans ms,sans-serif; font-size: 35px;\">\n" +
"    <strong>Ch&agrave;o m???ng b???n,</strong><br /><strong>"+nickname+"!</strong>\n" +
"  </h1>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
"  </div>\n" +
"</div>\n" +
"<!--[if (mso)|(IE)]></td><![endif]-->\n" +
"      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
"    </div>\n" +
"  </div>\n" +
"</div>\n" +
"\n" +
"\n" +
"\n" +
"<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
"  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n" +
"    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n" +
"      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n" +
"      \n" +
"<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
"<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
"  <div style=\"width: 100% !important;\">\n" +
"  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
"  \n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:0px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
"  <tr>\n" +
"    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n" +
"      \n" +
"      <img align=\"center\" border=\"0\" src=\"https://i.imgur.com/C2EeoJe.jpg\" alt=\"Phone Authentication\" title=\"Phone Authentication\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 550px;\" width=\"550\" class=\"v-src-width v-src-max-width\"/>\n" +
"      \n" +
"    </td>\n" +
"  </tr>\n" +
"</table>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"  <div style=\"line-height: 150%; text-align: center; word-wrap: break-word;\">\n" +
"    <p style=\"font-size: 14px; line-height: 150%;\"><strong><span style=\"font-size: 16px; line-height: 24px; font-family: Montserrat, sans-serif;\">???n v&agrave;o n&uacute;t d?????i ??&acirc;y ????? k&iacute;ch ho???t t&agrave;i kho???n</span></strong></p>\n" +
"<p style=\"font-size: 14px; line-height: 150%;\"><strong><span style=\"font-size: 16px; line-height: 24px; font-family: Montserrat, sans-serif;\">v&agrave; truy c???p v&agrave;o h&agrave;ng ngh&igrave;n kho&aacute; h???c tuy???t v???i.</span></strong></p>\n" +
"<p style=\"font-size: 14px; line-height: 150%;\">&nbsp;</p>\n" +
"<p style=\"font-size: 14px; line-height: 150%;\"><span style=\"font-size: 20px; line-height: 30px; color: #5d49d6;\"><strong><span style=\"font-family: Montserrat, sans-serif; line-height: 30px; font-size: 20px;\">HIHIHIHIHIHIHI!</span></strong></span></p>\n" +
"  </div>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:30px 10px 40px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"<div align=\"center\">\n" +
"  <!--[if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-spacing: 0; border-collapse: collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;font-family:arial,helvetica,sans-serif;\"><tr><td style=\"font-family:arial,helvetica,sans-serif;\" align=\"center\"><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:37px; v-text-anchor:middle; width:250px;\" arcsize=\"11%\" strokecolor=\"#5d49d6\" strokeweight=\"2px\" fillcolor=\"#ffffff\"><w:anchorlock/><center style=\"color:#5d49d6;font-family:arial,helvetica,sans-serif;\"><![endif]-->\n" +
"    <a href=\"\" target=\"_blank\" style=\"box-sizing: border-box;display: inline-block;font-family:arial,helvetica,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #5d49d6; background-color: #ffffff; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;border-top-color: #5d49d6; border-top-style: solid; border-top-width: 2px; border-left-color: #5d49d6; border-left-style: solid; border-left-width: 2px; border-right-color: #5d49d6; border-right-style: solid; border-right-width: 2px; border-bottom-color: #5d49d6; border-bottom-style: solid; border-bottom-width: 2px;\">\n" +
" <a href=\""+url+"auth?action=verify&token="+token+"\" target=\"_blank\" style=\"box-sizing: border-box;display: inline-block;font-family:arial,helvetica,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #5d49d6; background-color: #ffffff; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;border-top-color: #5d49d6; border-top-style: solid; border-top-width: 2px; border-left-color: #5d49d6; border-left-style: solid; border-left-width: 2px; border-right-color: #5d49d6; border-right-style: solid; border-right-width: 2px; border-bottom-color: #5d49d6; border-bottom-style: solid; border-bottom-width: 2px;\">"+
"      <span style=\"display:block;padding:10px 50px;line-height:120%;\"><strong><span style=\"font-size: 14px; line-height: 16.8px;\">K&iacute;ch ho???t t&agrave;i kho???n &gt;&gt;</span></strong></span>\n" +
"    </a>\n" +
"  <!--[if mso]></center></v:roundrect></td></tr></table><![endif]-->\n" +
"</div>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
"  </div>\n" +
"</div>\n" +
"<!--[if (mso)|(IE)]></td><![endif]-->\n" +
"      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
"    </div>\n" +
"  </div>\n" +
"</div>\n" +
"\n" +
"\n" +
"\n" +
"<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
"  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #9399ef;\">\n" +
"    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n" +
"      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #9399ef;\"><![endif]-->\n" +
"      \n" +
"<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
"<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
"  <div style=\"width: 100% !important;\">\n" +
"  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
"  \n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:40px 10px 0px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"  <h1 class=\"v-font-size\" style=\"margin: 0px; color: #ffffff; line-height: 140%; text-align: center; word-wrap: break-word; font-weight: normal; font-family: 'Montserrat',sans-serif; font-size: 22px;\">\n" +
"    FBT E-Learning\n" +
"  </h1>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"25%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 9px dotted #ffffff;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
"    <tbody>\n" +
"      <tr style=\"vertical-align: top\">\n" +
"        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
"          <span>&#160;</span>\n" +
"        </td>\n" +
"      </tr>\n" +
"    </tbody>\n" +
"  </table>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 0px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"  <div style=\"color: #ffffff; line-height: 180%; text-align: left; word-wrap: break-word;\">\n" +
"    <ul style=\"list-style-type: square;\">\n" +
"<li style=\"font-size: 14px; line-height: 25.2px;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 25.2px;\">Tuy???t v???i &ocirc;ng m???t tr???i</span></li>\n" +
"<li style=\"font-size: 14px; line-height: 25.2px;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 25.2px;\">Tuy???t v???i m???t tr??ng</span></li>\n" +
"<li style=\"font-size: 14px; line-height: 25.2px;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 25.2px;\">Tuy???t v???i sao ho???</span></li>\n" +
"<li style=\"font-size: 14px; line-height: 25.2px;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 25.2px;\">Tuy???t v???i sao kim</span></li>\n" +
"</ul>\n" +
"  </div>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 30px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"  <div style=\"line-height: 140%; text-align: center; word-wrap: break-word;\">\n" +
"    <p style=\"font-size: 14px; line-height: 140%;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 19.6px; color: #ffffff;\"><strong>+ View More&gt;&gt;</strong></span></p>\n" +
"  </div>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 40px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"<div align=\"center\">\n" +
"  <!--[if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-spacing: 0; border-collapse: collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;font-family:arial,helvetica,sans-serif;\"><tr><td style=\"font-family:arial,helvetica,sans-serif;\" align=\"center\"><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:37px; v-text-anchor:middle; width:210px;\" arcsize=\"11%\" strokecolor=\"#ffffff\" strokeweight=\"2px\" fillcolor=\"#9399ef\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:arial,helvetica,sans-serif;\"><![endif]-->\n" +
"    <a href=\"\" target=\"_blank\" style=\"box-sizing: border-box;display: inline-block;font-family:arial,helvetica,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #9399ef; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;border-top-color: #ffffff; border-top-style: solid; border-top-width: 2px; border-left-color: #ffffff; border-left-style: solid; border-left-width: 2px; border-right-color: #ffffff; border-right-style: solid; border-right-width: 2px; border-bottom-color: #ffffff; border-bottom-style: solid; border-bottom-width: 2px;\">\n" +
"      <span style=\"display:block;padding:10px 50px;line-height:120%;\"><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14px; line-height: 16.8px;\"><strong><span style=\"font-size: 14px; line-height: 16.8px;\">Contact Support</span></strong></span></span>\n" +
"    </a>\n" +
"  <!--[if mso]></center></v:roundrect></td></tr></table><![endif]-->\n" +
"</div>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
"  </div>\n" +
"</div>\n" +
"<!--[if (mso)|(IE)]></td><![endif]-->\n" +
"      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
"    </div>\n" +
"  </div>\n" +
"</div>\n" +
"\n" +
"\n" +
"\n" +
"<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
"  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n" +
"    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n" +
"      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n" +
"      \n" +
"<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
"<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
"  <div style=\"width: 100% !important;\">\n" +
"  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
"  \n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:40px 10px 10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"<div align=\"center\">\n" +
"  <div style=\"display: table; max-width:207px;\">\n" +
"  <!--[if (mso)|(IE)]><table width=\"207\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"border-collapse:collapse;\" align=\"center\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse; mso-table-lspace: 0pt;mso-table-rspace: 0pt; width:207px;\"><tr><![endif]-->\n" +
"  \n" +
"    \n" +
"    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 20px;\" valign=\"top\"><![endif]-->\n" +
"    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 20px\">\n" +
"      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
"        <a href=\"https://instagram.com/\" title=\"Instagram\" target=\"_blank\">\n" +
"          <img src=\"https://i.imgur.com/GTLwHNN.png\" alt=\"Instagram\" title=\"Instagram\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
"        </a>\n" +
"      </td></tr>\n" +
"    </tbody></table>\n" +
"    <!--[if (mso)|(IE)]></td><![endif]-->\n" +
"    \n" +
"    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 20px;\" valign=\"top\"><![endif]-->\n" +
"    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 20px\">\n" +
"      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
"        <a href=\"https://linkedin.com/\" title=\"LinkedIn\" target=\"_blank\">\n" +
"          <img src=\"https://i.imgur.com/5Diz4ag.png\" alt=\"LinkedIn\" title=\"LinkedIn\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
"        </a>\n" +
"      </td></tr>\n" +
"    </tbody></table>\n" +
"    <!--[if (mso)|(IE)]></td><![endif]-->\n" +
"    \n" +
"    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 20px;\" valign=\"top\"><![endif]-->\n" +
"    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 20px\">\n" +
"      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
"        <a href=\"https://twitter.com/\" title=\"Twitter\" target=\"_blank\">\n" +
"          <img src=\"https://i.imgur.com/WNsljUb.png\" alt=\"Twitter\" title=\"Twitter\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
"        </a>\n" +
"      </td></tr>\n" +
"    </tbody></table>\n" +
"    <!--[if (mso)|(IE)]></td><![endif]-->\n" +
"    \n" +
"    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 0px;\" valign=\"top\"><![endif]-->\n" +
"    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 0px\">\n" +
"      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
"        <a href=\"https://youtube.com/\" title=\"YouTube\" target=\"_blank\">\n" +
"          <img src=\"https://i.imgur.com/rPHSitf.png\" alt=\"YouTube\" title=\"YouTube\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
"        </a>\n" +
"      </td></tr>\n" +
"    </tbody></table>\n" +
"    <!--[if (mso)|(IE)]></td><![endif]-->\n" +
"    \n" +
"    \n" +
"    <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
"  </div>\n" +
"</div>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"  <div style=\"line-height: 140%; text-align: center; word-wrap: break-word;\">\n" +
"    <p style=\"font-size: 14px; line-height: 140%;\"><span style=\"font-size: 18px; line-height: 25.2px; font-family: Montserrat, sans-serif;\">FBT-ELEARNING</span></p>\n" +
"  </div>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"  <div style=\"color: #888888; line-height: 180%; text-align: center; word-wrap: break-word;\">\n" +
"    <p style=\"font-size: 14px; line-height: 180%;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 25.2px;\">Want to change how you receive these emails? You can update your preferences or <span style=\"text-decoration: underline; font-size: 14px; line-height: 25.2px;\">unsubscribe</span> from this list.</span></p>\n" +
"<p style=\"font-size: 14px; line-height: 180%;\">&nbsp;</p>\n" +
"<p style=\"font-size: 14px; line-height: 180%;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 12px; line-height: 21.6px;\">&copy; 2021 FBT. All Rights Reserved.</span></p>\n" +
"  </div>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
"  </div>\n" +
"</div>\n" +
"<!--[if (mso)|(IE)]></td><![endif]-->\n" +
"      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
"    </div>\n" +
"  </div>\n" +
"</div>\n" +
"\n" +
"\n" +
"\n" +
"<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
"  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n" +
"    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n" +
"      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n" +
"      \n" +
"<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
"<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
"  <div style=\"width: 100% !important;\">\n" +
"  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
"  \n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:0px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
"  <tr>\n" +
"    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n" +
"      \n" +
"      <img align=\"center\" border=\"0\" src=\"https://i.imgur.com/yZ8KDTZ.png\" alt=\"Image\" title=\"Image\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 550px;\" width=\"550\" class=\"v-src-width v-src-max-width\"/>\n" +
"      \n" +
"    </td>\n" +
"  </tr>\n" +
"</table>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
"  </div>\n" +
"</div>\n" +
"<!--[if (mso)|(IE)]></td><![endif]-->\n" +
"      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
"    </div>\n" +
"  </div>\n" +
"</div>\n" +
"\n" +
"\n" +
"\n" +
"<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
"  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n" +
"    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n" +
"      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n" +
"      \n" +
"<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
"<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n" +
"  <div style=\"width: 100% !important;\">\n" +
"  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
"  \n" +
"<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n" +
"        \n" +
"  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 0px solid #BBBBBB;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
"    <tbody>\n" +
"      <tr style=\"vertical-align: top\">\n" +
"        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
"          <span>&#160;</span>\n" +
"        </td>\n" +
"      </tr>\n" +
"    </tbody>\n" +
"  </table>\n" +
"\n" +
"      </td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>\n" +
"\n" +
"  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
"  </div>\n" +
"</div>\n" +
"<!--[if (mso)|(IE)]></td><![endif]-->\n" +
"      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
"    </div>\n" +
"  </div>\n" +
"</div>\n" +
"\n" +
"\n" +
"    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\n" +
"    </td>\n" +
"  </tr>\n" +
"  </tbody>\n" +
"  </table>\n" +
"  <!--[if mso]></div><![endif]-->\n" +
"  <!--[if IE]></div><![endif]-->\n" +
"</body>\n" +
"\n" +
"</html>";
            }

            if (action.equalsIgnoreCase("forgot")){
                template = "\"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n"
                    + "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n"
                    + "<head>\n"
                    + "<!--[if gte mso 9]>\n"
                    + "<xml>\n"
                    + "  <o:OfficeDocumentSettings>\n"
                    + "    <o:AllowPNG/>\n"
                    + "    <o:PixelsPerInch>96</o:PixelsPerInch>\n"
                    + "  </o:OfficeDocumentSettings>\n"
                    + "</xml>\n"
                    + "<![endif]-->\n"
                    + "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                    + "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                    + "  <meta name=\"x-apple-disable-message-reformatting\">\n"
                    + "  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->\n"
                    + "  <title></title>\n"
                    + "  \n"
                    + "    <style type=\"text/css\">\n"
                    + "      table, td { color: #000000; } a { color: #0000ee; text-decoration: underline; } @media (max-width: 480px) { #u_content_image_1 .v-container-padding-padding { padding: 10px 10px 15px !important; } #u_content_image_1 .v-src-width { width: 1910px !important; } #u_content_image_1 .v-src-max-width { max-width: 36% !important; } #u_content_heading_1 .v-container-padding-padding { padding: 15px 10px 10px !important; } #u_content_heading_1 .v-font-size { font-size: 35px !important; } }\n"
                    + "@media only screen and (min-width: 570px) {\n"
                    + "  .u-row {\n"
                    + "    width: 550px !important;\n"
                    + "  }\n"
                    + "  .u-row .u-col {\n"
                    + "    vertical-align: top;\n"
                    + "  }\n"
                    + "\n"
                    + "  .u-row .u-col-100 {\n"
                    + "    width: 550px !important;\n"
                    + "  }\n"
                    + "\n"
                    + "}\n"
                    + "\n"
                    + "@media (max-width: 570px) {\n"
                    + "  .u-row-container {\n"
                    + "    max-width: 100% !important;\n"
                    + "    padding-left: 0px !important;\n"
                    + "    padding-right: 0px !important;\n"
                    + "  }\n"
                    + "  .u-row .u-col {\n"
                    + "    min-width: 320px !important;\n"
                    + "    max-width: 100% !important;\n"
                    + "    display: block !important;\n"
                    + "  }\n"
                    + "  .u-row {\n"
                    + "    width: calc(100% - 40px) !important;\n"
                    + "  }\n"
                    + "  .u-col {\n"
                    + "    width: 100% !important;\n"
                    + "  }\n"
                    + "  .u-col > div {\n"
                    + "    margin: 0 auto;\n"
                    + "  }\n"
                    + "}\n"
                    + "body {\n"
                    + "  margin: 0;\n"
                    + "  padding: 0;\n"
                    + "}\n"
                    + "\n"
                    + "table,\n"
                    + "tr,\n"
                    + "td {\n"
                    + "  vertical-align: top;\n"
                    + "  border-collapse: collapse;\n"
                    + "}\n"
                    + "\n"
                    + "p {\n"
                    + "  margin: 0;\n"
                    + "}\n"
                    + "\n"
                    + ".ie-container table,\n"
                    + ".mso-container table {\n"
                    + "  table-layout: fixed;\n"
                    + "}\n"
                    + "\n"
                    + "* {\n"
                    + "  line-height: inherit;\n"
                    + "}\n"
                    + "\n"
                    + "a[x-apple-data-detectors='true'] {\n"
                    + "  color: inherit !important;\n"
                    + "  text-decoration: none !important;\n"
                    + "}\n"
                    + "\n"
                    + "</style>\n"
                    + "  \n"
                    + "  \n"
                    + "\n"
                    + "<!--[if !mso]><!--><link href=\"https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap\" rel=\"stylesheet\" type=\"text/css\"><!--<![endif]-->\n"
                    + "\n"
                    + "</head>\n"
                    + "\n"
                    + "<body class=\"clean-body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #e7e7e7;color: #000000\">\n"
                    + "  <!--[if IE]><div class=\"ie-container\"><![endif]-->\n"
                    + "  <!--[if mso]><div class=\"mso-container\"><![endif]-->\n"
                    + "  <table style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #e7e7e7;width:100%\" cellpadding=\"0\" cellspacing=\"0\">\n"
                    + "  <tbody>\n"
                    + "  <tr style=\"vertical-align: top\">\n"
                    + "    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n"
                    + "    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #e7e7e7;\"><![endif]-->\n"
                    + "    \n"
                    + "\n"
                    + "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n"
                    + "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n"
                    + "    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n"
                    + "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n"
                    + "      \n"
                    + "<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n"
                    + "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n"
                    + "  <div style=\"width: 100% !important;\">\n"
                    + "  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n"
                    + "  \n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 0px solid #BBBBBB;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "    <tbody>\n"
                    + "      <tr style=\"vertical-align: top\">\n"
                    + "        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "          <span>&#160;</span>\n"
                    + "        </td>\n"
                    + "      </tr>\n"
                    + "    </tbody>\n"
                    + "  </table>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "<!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n"
                    + "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n"
                    + "    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n"
                    + "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n"
                    + "      \n"
                    + "<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n"
                    + "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n"
                    + "  <div style=\"width: 100% !important;\">\n"
                    + "  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n"
                    + "  \n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:0px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                    + "  <tr>\n"
                    + "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n"
                    + "      \n"
                    + "      <img align=\"center\" border=\"0\" src=\"https://i.imgur.com/ksvMD9q.png\" alt=\"Image\" title=\"Image\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 550px;\" width=\"550\" class=\"v-src-width v-src-max-width\"/>\n"
                    + "      \n"
                    + "    </td>\n"
                    + "  </tr>\n"
                    + "</table>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "<!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n"
                    + "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n"
                    + "    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n"
                    + "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n"
                    + "      \n"
                    + "<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n"
                    + "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n"
                    + "  <div style=\"width: 100% !important;\">\n"
                    + "  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n"
                    + "  \n"
                    + "<table id=\"u_content_image_1\" style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:0px 10px 15px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                    + "  <tr>\n"
                    + "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n"
                    + "      \n"
                    + "      <img align=\"center\" border=\"0\" src=\"https://i.imgur.com/DZilQPU.png\" alt=\"Logo\" title=\"Logo\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 25%;max-width: 132.5px;\" width=\"132.5\" class=\"v-src-width v-src-max-width\"/>\n"
                    + "      \n"
                    + "    </td>\n"
                    + "  </tr>\n"
                    + "</table>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "<!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n"
                    + "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n"
                    + "    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n"
                    + "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n"
                    + "      \n"
                    + "<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n"
                    + "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n"
                    + "  <div style=\"width: 100% !important;\">\n"
                    + "  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n"
                    + "  \n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid #BBBBBB;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "    <tbody>\n"
                    + "      <tr style=\"vertical-align: top\">\n"
                    + "        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "          <span>&#160;</span>\n"
                    + "        </td>\n"
                    + "      </tr>\n"
                    + "    </tbody>\n"
                    + "  </table>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table id=\"u_content_heading_1\" style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:30px 10px 10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <h1 class=\"v-font-size\" style=\"margin: 0px; color: #2499e3; line-height: 140%; text-align: center; word-wrap: break-word; font-weight: normal; font-family: comic sans ms,sans-serif; font-size: 35px;\">\n"
                    + "    <strong>We're sorry you forgot your password,</strong><br /><strong>" + nickname + "!</strong>\n"
                    + "  </h1>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "<!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n"
                    + "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n"
                    + "    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n"
                    + "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n"
                    + "      \n"
                    + "<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n"
                    + "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n"
                    + "  <div style=\"width: 100% !important;\">\n"
                    + "  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n"
                    + "  \n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:0px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                    + "  <tr>\n"
                    + "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n"
                    + "      \n"
                    + "      <img align=\"center\" border=\"0\" src=\"https://i.imgur.com/C2EeoJe.jpg\" alt=\"Phone Authentication\" title=\"Phone Authentication\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 550px;\" width=\"550\" class=\"v-src-width v-src-max-width\"/>\n"
                    + "      \n"
                    + "    </td>\n"
                    + "  </tr>\n"
                    + "</table>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <div style=\"line-height: 150%; text-align: center; word-wrap: break-word;\">\n"
                    + "    <p style=\"font-size: 14px; line-height: 150%;\"><strong><span style=\"font-size: 16px; line-height: 24px; font-family: Montserrat, sans-serif;\">Change your password </span></strong></p>\n"
                    + "<p style=\"font-size: 14px; line-height: 150%;\"><strong><span style=\"font-size: 16px; line-height: 24px; font-family: Montserrat, sans-serif;\">to re-access your account now.</span></strong></p>\n"
                    + "<p style=\"font-size: 14px; line-height: 150%;\">&nbsp;</p>\n"
                    + "<p style=\"font-size: 14px; line-height: 150%;\"><span style=\"font-size: 20px; line-height: 30px; color: #2499e3; background-color: #ffffff;\"><strong><span style=\"font-family: Montserrat, sans-serif; line-height: 30px; font-size: 20px; background-color: #ffffff;\">Thanks Again!</span></strong></span></p>\n"
                    + "  </div>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:30px 10px 40px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "<div align=\"center\">\n"
                    + "  <!--[if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-spacing: 0; border-collapse: collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;font-family:arial,helvetica,sans-serif;\"><tr><td style=\"font-family:arial,helvetica,sans-serif;\" align=\"center\"><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:37px; v-text-anchor:middle; width:268px;\" arcsize=\"11%\" strokecolor=\"#2499e3\" strokeweight=\"2px\" fillcolor=\"#ffffff\"><w:anchorlock/><center style=\"color:#2499e3;font-family:arial,helvetica,sans-serif;\"><![endif]-->\n"
                    + "    <a href=\""+url+"auth?action=resetpw&token=" + token + "\" target=\"_blank\" style=\"box-sizing: border-box;display: inline-block;font-family:arial,helvetica,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #2499e3; background-color: #ffffff; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;border-top-width: 2px; border-top-style: solid; border-top-color: #2499e3; border-left-width: 2px; border-left-style: solid; border-left-color: #2499e3; border-right-width: 2px; border-right-style: solid; border-right-color: #2499e3; border-bottom-width: 2px; border-bottom-style: solid; border-bottom-color: #2499e3;\">\n"
                    + "      <span style=\"display:block;padding:10px 50px;line-height:120%;\"><strong><span style=\"font-size: 14px; line-height: 16.8px;\">Change Your Password Now &gt;&gt;</span></strong></span>\n"
                    + "    </a>\n"
                    + "  <!--[if mso]></center></v:roundrect></td></tr></table><![endif]-->\n"
                    + "</div>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "<!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n"
                    + "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #2499e3;\">\n"
                    + "    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n"
                    + "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #2499e3;\"><![endif]-->\n"
                    + "      \n"
                    + "<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n"
                    + "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n"
                    + "  <div style=\"width: 100% !important;\">\n"
                    + "  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n"
                    + "  \n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:40px 10px 0px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <h1 class=\"v-font-size\" style=\"margin: 0px; color: #ffffff; line-height: 140%; text-align: center; word-wrap: break-word; font-weight: normal; font-family: 'Montserrat',sans-serif; font-size: 22px;\">\n"
                    + "    Here's What Happens Next:\n"
                    + "  </h1>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"25%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 9px dotted #ffffff;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "    <tbody>\n"
                    + "      <tr style=\"vertical-align: top\">\n"
                    + "        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "          <span>&#160;</span>\n"
                    + "        </td>\n"
                    + "      </tr>\n"
                    + "    </tbody>\n"
                    + "  </table>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 0px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <div style=\"color: #ffffff; line-height: 180%; text-align: left; word-wrap: break-word;\">\n"
                    + "    <ul style=\"list-style-type: square;\">\n"
                    + "<li style=\"font-size: 14px; line-height: 25.2px;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 25.2px;\">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</span></li>\n"
                    + "<li style=\"font-size: 14px; line-height: 25.2px;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 25.2px;\">It is a long established fact that a reader will be distracted . </span></li>\n"
                    + "<li style=\"font-size: 14px; line-height: 25.2px;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 25.2px;\">The point of using Lorem Ipsum is that it has a more-or-less normal distribution.</span></li>\n"
                    + "<li style=\"font-size: 14px; line-height: 25.2px;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 25.2px;\">There are many variations of passages of Lorem Ipsum available .</span></li>\n"
                    + "</ul>\n"
                    + "  </div>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 40px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "<div align=\"center\">\n"
                    + "  <!--[if mso]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-spacing: 0; border-collapse: collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;font-family:arial,helvetica,sans-serif;\"><tr><td style=\"font-family:arial,helvetica,sans-serif;\" align=\"center\"><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:37px; v-text-anchor:middle; width:210px;\" arcsize=\"11%\" strokecolor=\"#ffffff\" strokeweight=\"2px\" fillcolor=\"#2499e3\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:arial,helvetica,sans-serif;\"><![endif]-->\n"
                    + "    <a href=\"\" target=\"_blank\" style=\"box-sizing: border-box;display: inline-block;font-family:arial,helvetica,sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #2499e3; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;border-top-color: #ffffff; border-top-style: solid; border-top-width: 2px; border-left-color: #ffffff; border-left-style: solid; border-left-width: 2px; border-right-color: #ffffff; border-right-style: solid; border-right-width: 2px; border-bottom-color: #ffffff; border-bottom-style: solid; border-bottom-width: 2px;\">\n"
                    + "      <span style=\"display:block;padding:10px 50px;line-height:120%;\"><span style=\"font-family: arial, helvetica, sans-serif; font-size: 14px; line-height: 16.8px;\"><strong><span style=\"font-size: 14px; line-height: 16.8px;\">Contact Support</span></strong></span></span>\n"
                    + "    </a>\n"
                    + "  <!--[if mso]></center></v:roundrect></td></tr></table><![endif]-->\n"
                    + "</div>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px 10px 30px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <div style=\"line-height: 140%; text-align: center; word-wrap: break-word;\">\n"
                    + "    <p style=\"font-size: 14px; line-height: 140%;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 19.6px; color: #ffffff;\"><strong>+ View More&gt;&gt;</strong></span></p>\n"
                    + "  </div>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "<!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n"
                    + "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n"
                    + "    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n"
                    + "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n"
                    + "      \n"
                    + "<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n"
                    + "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n"
                    + "  <div style=\"width: 100% !important;\">\n"
                    + "  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n"
                    + "  \n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:40px 10px 10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "<div align=\"center\">\n"
                    + "  <div style=\"display: table; max-width:207px;\">\n"
                    + "  <!--[if (mso)|(IE)]><table width=\"207\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"border-collapse:collapse;\" align=\"center\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse; mso-table-lspace: 0pt;mso-table-rspace: 0pt; width:207px;\"><tr><![endif]-->\n"
                    + "  \n"
                    + "    \n"
                    + "    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 20px;\" valign=\"top\"><![endif]-->\n"
                    + "    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 20px\">\n"
                    + "      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n"
                    + "        <a href=\"https://instagram.com/\" title=\"Instagram\" target=\"_blank\">\n"
                    + "          <img src=\"https://i.imgur.com/GTLwHNN.png\" alt=\"Instagram\" title=\"Instagram\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n"
                    + "        </a>\n"
                    + "      </td></tr>\n"
                    + "    </tbody></table>\n"
                    + "    <!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "    \n"
                    + "    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 20px;\" valign=\"top\"><![endif]-->\n"
                    + "    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 20px\">\n"
                    + "      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n"
                    + "        <a href=\"https://linkedin.com/\" title=\"LinkedIn\" target=\"_blank\">\n"
                    + "          <img src=\"https://i.imgur.com/5Diz4ag.png\" alt=\"LinkedIn\" title=\"LinkedIn\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n"
                    + "        </a>\n"
                    + "      </td></tr>\n"
                    + "    </tbody></table>\n"
                    + "    <!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "    \n"
                    + "    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 20px;\" valign=\"top\"><![endif]-->\n"
                    + "    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 20px\">\n"
                    + "      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n"
                    + "        <a href=\"https://twitter.com/\" title=\"Twitter\" target=\"_blank\">\n"
                    + "          <img src=\"https://i.imgur.com/WNsljUb.png\" alt=\"Twitter\" title=\"Twitter\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n"
                    + "        </a>\n"
                    + "      </td></tr>\n"
                    + "    </tbody></table>\n"
                    + "    <!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "    \n"
                    + "    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 0px;\" valign=\"top\"><![endif]-->\n"
                    + "    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 0px\">\n"
                    + "      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n"
                    + "        <a href=\"https://youtube.com/\" title=\"YouTube\" target=\"_blank\">\n"
                    + "          <img src=\"https://i.imgur.com/rPHSitf.png\" alt=\"YouTube\" title=\"YouTube\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n"
                    + "        </a>\n"
                    + "      </td></tr>\n"
                    + "    </tbody></table>\n"
                    + "    <!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "    \n"
                    + "    \n"
                    + "    <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <div style=\"line-height: 140%; text-align: center; word-wrap: break-word;\">\n"
                    + "    <p style=\"font-size: 14px; line-height: 140%;\"><span style=\"font-size: 18px; line-height: 25.2px; font-family: Montserrat, sans-serif;\">www.elearning.com</span></p>\n"
                    + "  </div>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <div style=\"color: #888888; line-height: 180%; text-align: center; word-wrap: break-word;\">\n"
                    + "    <p style=\"font-size: 14px; line-height: 180%;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 14px; line-height: 25.2px;\">Want to change how you receive these emails? You can update your preferences or <span style=\"text-decoration: underline; font-size: 14px; line-height: 25.2px;\">unsubscribe</span> from this list.</span></p>\n"
                    + "<p style=\"font-size: 14px; line-height: 180%;\">&nbsp;</p>\n"
                    + "<p style=\"font-size: 14px; line-height: 180%;\"><span style=\"font-family: Montserrat, sans-serif; font-size: 12px; line-height: 21.6px;\">&copy; 20XX Company. All Rights Reserved.</span></p>\n"
                    + "  </div>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "<!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n"
                    + "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n"
                    + "    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n"
                    + "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n"
                    + "      \n"
                    + "<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n"
                    + "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n"
                    + "  <div style=\"width: 100% !important;\">\n"
                    + "  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n"
                    + "  \n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:0px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n"
                    + "  <tr>\n"
                    + "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n"
                    + "      \n"
                    + "      <img align=\"center\" border=\"0\" src=\"https://i.imgur.com/yZ8KDTZ.png\" alt=\"Image\" title=\"Image\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 100%;max-width: 550px;\" width=\"550\" class=\"v-src-width v-src-max-width\"/>\n"
                    + "      \n"
                    + "    </td>\n"
                    + "  </tr>\n"
                    + "</table>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "<!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n"
                    + "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 550px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: transparent;\">\n"
                    + "    <div style=\"border-collapse: collapse;display: table;width: 100%;background-color: transparent;\">\n"
                    + "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:550px;\"><tr style=\"background-color: transparent;\"><![endif]-->\n"
                    + "      \n"
                    + "<!--[if (mso)|(IE)]><td align=\"center\" width=\"550\" style=\"width: 550px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n"
                    + "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 550px;display: table-cell;vertical-align: top;\">\n"
                    + "  <div style=\"width: 100% !important;\">\n"
                    + "  <!--[if (!mso)&(!IE)]><!--><div style=\"padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n"
                    + "  \n"
                    + "<table style=\"font-family:arial,helvetica,sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n"
                    + "  <tbody>\n"
                    + "    <tr>\n"
                    + "      <td class=\"v-container-padding-padding\" style=\"overflow-wrap:break-word;word-break:break-word;padding:10px;font-family:arial,helvetica,sans-serif;\" align=\"left\">\n"
                    + "        \n"
                    + "  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 0px solid #BBBBBB;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "    <tbody>\n"
                    + "      <tr style=\"vertical-align: top\">\n"
                    + "        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n"
                    + "          <span>&#160;</span>\n"
                    + "        </td>\n"
                    + "      </tr>\n"
                    + "    </tbody>\n"
                    + "  </table>\n"
                    + "\n"
                    + "      </td>\n"
                    + "    </tr>\n"
                    + "  </tbody>\n"
                    + "</table>\n"
                    + "\n"
                    + "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "<!--[if (mso)|(IE)]></td><![endif]-->\n"
                    + "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n"
                    + "    </div>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "\n"
                    + "\n"
                    + "    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\n"
                    + "    </td>\n"
                    + "  </tr>\n"
                    + "  </tbody>\n"
                    + "  </table>\n"
                    + "  <!--[if mso]></div><![endif]-->\n"
                    + "  <!--[if IE]></div><![endif]-->\n"
                    + "</body>\n"
                    + "\n"
                    + "</html>";
            }
             return template;
        
    }
   
}
