package com.tlite.mail;



import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.annotation.WebServlet;


@WebServlet("/Mailer")
public class Mailer {

       
   
    public Mailer() {
        super();
       
    }

	
    public static void send(String to,String subject,String msg){  
    	  
    	final String user="sarjine.tlss@gmail.com";
    	final String pass="Akash1612";  
    	  
    	//1st step) Get the session object    
    	  Properties props = new Properties();
    	  props.put("mail.smtp.auth", "true");
          props.put("mail.smtp.starttls.enable", "true");
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.port", "465");    
          props.put("mail.smtp.host", "smtp.gmail.com");
          
    	Session session = Session.getDefaultInstance(props,  
    	 new javax.mail.Authenticator() {  
    	  protected PasswordAuthentication getPasswordAuthentication() {  
    	   return new PasswordAuthentication(user,pass);  
    	   }  
    	});  
    	//2nd step)compose message  
    	try {  
    	 MimeMessage message = new MimeMessage(session);  
    	 message.setFrom(new InternetAddress(user));  
    	 message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
    	 message.setSubject(subject);  
    	 
    	 
    	 MimeBodyPart messageBodyPart1 = new MimeBodyPart();  
    	    messageBodyPart1.setText(msg);  
 
    
           // creates multi-part
           Multipart multipart = new MimeMultipart();
           multipart.addBodyPart(messageBodyPart1);
           // adds attachments
          /* if (attachedFiles != null && attachedFiles.size() > 0) {
               for (File aFile : attachedFiles) {
                   MimeBodyPart attachPart = new MimeBodyPart();
    
                   try {
                       attachPart.attachFile(aFile);
                   } catch (IOException ex) {
                       ex.printStackTrace();
                   }
    
                   multipart.addBodyPart(attachPart);
               }
           }*/
    
           
          
           // sets the multi-part as e-mail's content
           message.setContent(multipart);
    
    	 
    	 
    	 //3rd step)send message  
    	 Transport.send(message);  
    	  
    	 System.out.println("Done");  
    	  
    	 } catch (MessagingException e) {  
    	    throw new RuntimeException(e);  
    	 }  
    	      
    	}  
}
