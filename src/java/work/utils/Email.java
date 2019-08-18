/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package work.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import work.objects.Applications;
import work.objects.Content;
import work.objects.Files;
import work.objects.Jobs;
import work.objects.Lostpassword;
import work.objects.Mpesa;
import work.objects.Paypal;
import work.objects.Registration;
import work.objects.Seekers;
import work.objects.Tellafriend;
import work.objects.Users;

/**
 *
 * @author gachanja
 */
public class Email {

    Properties props = new Properties();
    String fromAddress = ResourceBundle.getBundle("/Bundle").getString("fromAddress");
    String fromName = ResourceBundle.getBundle("/Bundle").getString("fromName");
    @PersistenceContext(unitName = "workPU")
    private EntityManager em;
    InternetAddress ia = new InternetAddress();

    public Email() {
        try {
            props.put("mail.smtp.host", "localhost");
            props.put("mail.smtp.port", "25");
            ia.setAddress(fromAddress);
            ia.setPersonal(fromName);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String sendRegistrationEmail(Registration registration, Content content) {
        try {

            Session session = Session.getInstance(props);
            Message message = new MimeMessage(session);
            message.setFrom(ia);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(registration.getEmail()));
            message.setSubject("myjob.co.ke Registration");
            String messageContent = content.getContent().replace("UUUUU", registration.getUsername()).replace("DDDDD", ResourceBundle.getBundle("/Bundle").getString("domainName")).replace("CCCCC", registration.getCode());
            message.setDataHandler(new DataHandler(new ByteArrayDataSource(messageContent, "text/html")));
            Transport.send(message);
        } catch (IOException | MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
            return ("failed");
        }
        return ("Done");
    }

    public String sendPasswordEmail(Lostpassword lostpassword, String toAddress) {
        try {
            Session session = Session.getInstance(props);
            Message message = new MimeMessage(session);
            message.setFrom(ia);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress));
            message.setSubject("Password Recovery");
            message.setText("Hi " + lostpassword.getUsername() + "\nPlease go to the url http://" + ResourceBundle.getBundle("/Bundle").getString("domainName") + "/faces/registration/ResetPassword.xhtml?asdewedhyfse=" + lostpassword.getCode() + " to reset your password");
            Transport.send(message);
        } catch (MessagingException e) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, e);
        }
        return ("Done");
    }

    public String notifyNewUser(Users newuser) {
        try {
            Session session = Session.getInstance(props);
            Message message = new MimeMessage(session);
            message.setFrom(ia);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(newuser.getEmail()));
            message.setSubject("User Registration");
            message.setText("Hi " + newuser.getUsername() + "\nPlease go to the url http://" + ResourceBundle.getBundle("/Bundle").getString("domainName") + "/faces/registration/NewUser.xhtml?asdewedhyfse=" + newuser.getPassword() + " to complete your registration.");
            Transport.send(message);
        } catch (MessagingException e) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, e);
        }
        return ("Done");
    }

    public String tellAFriend(Tellafriend tellAFriend, Jobs job, Seekers seeker) {
        try {
            Session session = Session.getInstance(props);
            Message message = new MimeMessage(session);
            message.setFrom(ia);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(tellAFriend.getFriend()));
            message.setSubject("Job Vacancy For You");
            message.setText("Hi " + tellAFriend.getName() + ",\n" + seeker.getFirstname() + " " + seeker.getLastname() + " has spotted a job vacancy that you may be interested in\nPlease log into http://myjob.co.ke and search for the job reference  '" + job.getReferenceno() + "'.\nYours truly,\nhttp://myjob.co.ke");
            Transport.send(message);
        } catch (MessagingException e) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, e);
        }
        return ("Done");
    }

    public void sendSeekerMpesaReceipt(Mpesa payment) {
        try {
            Session session = Session.getInstance(props);
            Message message = new MimeMessage(session);
            message.setFrom(ia);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(payment.getSeekerid().getEmail()));
            message.setSubject("MyJob.co.ke MPESA Payment Receipt");
            String messageContent = getMpesaReceipt(payment, payment.getSeekerid().getUsername());
            message.setDataHandler(new DataHandler(new ByteArrayDataSource(messageContent, "text/html")));
            Transport.send(message);
            payment = null;
        } catch (IOException | MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void sendCompanyMpesaReceipt(Mpesa payment) {
        try {
            Session session = Session.getInstance(props);
            Message message = new MimeMessage(session);
            message.setFrom(ia);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(payment.getCompanyid().getEmail()));
            message.setSubject("MyJob.co.ke MPESA Payment Receipt");
            String messageContent = getMpesaReceipt(payment, payment.getCompanyid().getName());
            message.setDataHandler(new DataHandler(new ByteArrayDataSource(messageContent, "text/html")));
            Transport.send(message);
            payment = null;
        } catch (IOException | MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void sendCompanyPaypalReceipt(Paypal payment) {
        try {
            Session session = Session.getInstance(props);
            Message message = new MimeMessage(session);
            message.setFrom(ia);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(payment.getCompanyid().getEmail()));
            message.setSubject("MyJob.co.ke PayPal Payment Receipt");
            String messageContent = getPaypalReceipt(payment, payment.getCompanyid().getName());
            message.setDataHandler(new DataHandler(new ByteArrayDataSource(messageContent, "text/html")));
            Transport.send(message);
            payment = null;
        } catch (IOException | MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void sendSeekerPaypalReceipt(Paypal payment) {
        try {
            Session session = Session.getInstance(props);
            Message message = new MimeMessage(session);
            message.setFrom(ia);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(payment.getSeekerid().getEmail()));
            message.setSubject("MyJob.co.ke PayPal Payment Receipt");
            String messageContent = getPaypalReceipt(payment, payment.getSeekerid().getUsername());
            message.setDataHandler(new DataHandler(new ByteArrayDataSource(messageContent, "text/html")));
            Transport.send(message);
            payment = null;
        } catch (IOException | MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void sendApplication(Applications application) {
        try {
            Session session = Session.getInstance(props);
            Message message = new MimeMessage(session);
            message.setFrom(ia);
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(application.getJobid().getUserid().getEmail()));
            message.setSubject("MyJob.co.ke:: Application for " + application.getJobid().getTitle());
            String messageContent = application.getLetter();

            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(messageContent, "text/html");
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(messageBodyPart);
            if (application.getSeekerid().getFilesCollection().size() > 0) {
                for (Files file : application.getSeekerid().getFilesCollection()) {
                    MimeBodyPart attachPart = new MimeBodyPart();
                    attachPart.attachFile(ResourceBundle.getBundle("/Bundle").getString("uploadPath") + file.getFilename());
                    multipart.addBodyPart(attachPart);
                }
            }
            message.setContent(multipart);
//            message.setDataHandler(new DataHandler(new ByteArrayDataSource(messageContent, "text/html")));
            Transport.send(message);

        } catch (IOException | MessagingException ex) {
            Logger.getLogger(Email.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public String getMpesaReceipt(Mpesa payment, String name) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM Y hh:mm:ss a");
        String messageContent = "<body style='font-family: arial,  helvetica, sans-serif;font-size: 12px;color: #666666;'>Hi " + name + ",<br/>";
        messageContent += "Your payment was processed successfully. Thank you!<br/>Please keep this email for future reference.";
        messageContent += "<table align='center' cellpadding='8px' style='border: #666666 1px solid;font-family: arial,  helvetica, sans-serif;font-size: 12px;color: #666666;'>";
        messageContent += "<tr><td style='font-weight:bold'>Receipt ID:</td><td>" + payment.getId() + "</td></tr>";
        messageContent += "<tr style='background-color:#eee;'><td style='font-weight:bold'>Amount:</td><td>Ksh:" + payment.getAmount() + "</td></tr>";
        messageContent += "<tr><td style='font-weight:bold'>Sent By: </td><td>" + payment.getName() + "</td></tr>";
        messageContent += "<tr style='background-color:#eee;'><td style='font-weight:bold'>From Number: </td><td>" + payment.getSource() + "</td></tr>";
        messageContent += "<tr><td style='font-weight:bold'>Pay Time: </td><td>" + sdf.format(payment.getPaytime()) + "</td></tr>";
        messageContent += "<tr style='background-color:#eee;'><td style='font-weight:bold'>Receive Time: </td><td>" + sdf.format(payment.getReceivetime()) + "</td></tr>";
        messageContent += "<tr><td style='font-weight:bold'>Process Time: </td><td>" + sdf.format(payment.getProcesstime()) + "</td></tr>";
        messageContent += "<tr style='background-color:#eee;'><td style='font-weight:bold'>Previous Membership Expiry: </td><td>" + sdf.format(payment.getFromtime()) + "</td></tr>";
        messageContent += "<tr><td style='font-weight:bold'>Membership Updated To:</td><td>" + sdf.format(payment.getTotime()) + "</td></tr>";
        messageContent += "</table></body>";
        payment = null;
        name = null;
        return messageContent;
    }

    public String getPaypalReceipt(Paypal payment, String name) {
        if (name == null) {
            name = "";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM Y hh:mm:ss a");
        String messageContent = "<body style='font-family: arial,  helvetica, sans-serif;font-size: 12px;color: #666666;'>Hi " + name + ",<br/>";
        messageContent += "Your payment was processed successfully. Thank you!<br/>Please keep this email for future reference.";
        messageContent += "<table align='center' cellpadding='8px' style='border: #666666 1px solid;font-family: arial,  helvetica, sans-serif;font-size: 12px;color: #666666;'>";
        messageContent += "<tr><td style='font-weight:bold'>Receipt ID:</td><td>" + payment.getId() + "</td></tr>";
        messageContent += "<tr><td style='font-weight:bold'>Transaction ID:</td><td>" + payment.getTxnId() + "</td></tr>";
        messageContent += "<tr style='background-color:#eee;'><td style='font-weight:bold'>Amount:</td><td>Ksh:" + payment.getMcGross() + "</td></tr>";
        messageContent += "<tr><td style='font-weight:bold'>Sent By: </td><td>" + payment.getFirstName() + " " + payment.getLastName() + "</td></tr>";
        messageContent += "<tr style='background-color:#eee;'><td style='font-weight:bold'>From Email: </td><td>" + payment.getPayerEmail() + "</td></tr>";
        messageContent += "<tr><td style='font-weight:bold'>Pay Time: </td><td>" + sdf.format(payment.getPaymentDate()) + "</td></tr>";
        messageContent += "<tr style='background-color:#eee;'><td style='font-weight:bold'>Receive Time: </td><td>" + sdf.format(payment.getProcesstime()) + "</td></tr>";
        messageContent += "<tr><td style='font-weight:bold'>Process Time: </td><td>" + sdf.format(payment.getProcesstime()) + "</td></tr>";
        messageContent += "<tr style='background-color:#eee;'><td style='font-weight:bold'>Previous Membership Expiry: </td><td>" + sdf.format(payment.getFromtime()) + "</td></tr>";
        messageContent += "<tr><td style='font-weight:bold'>Membership Updated To:</td><td>" + sdf.format(payment.getTotime()) + "</td></tr>";
        messageContent += "</table></body>";
        payment = null;
        name = null;
        return messageContent;
    }

}
