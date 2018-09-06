package com.tlite.mail;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;

public class Mailer2{

	    private static final String HOST = "smtp.gmail.com";

	    //for localhost
	    private static final int PORT = 465;

	    //for server
	    // private static final int PORT = 587;
	    
	    private static final boolean SSL_FLAG = true;
        
	    
	 
     public static String send(String to,String subject,String msg){

	        String message="success"; 
            
	       String userName = "sarjine.tlss@gmail.com";

	        String password = "Akash1612";

	         
            String fromAddress="sarjine.tlss@gmail.com";

	        String toAddress =  to;

	          

	        try {

	            Email email = new SimpleEmail();

	            email.setHostName(HOST);

	            email.setSmtpPort(PORT);

	            email.setAuthenticator(new DefaultAuthenticator(userName, password));

	            email.setSSLOnConnect(SSL_FLAG);
	            
	            //additional
	            email.setStartTLSEnabled(true);

	            email.setFrom(fromAddress);

	            email.setSubject(subject);

	            email.setMsg(msg);

	            email.addTo(toAddress);

	            email.send();

	        }catch(Exception ex){

	        	message="error";
	        	
	            System.out.println("Unable to send email");

	            System.out.println(ex);

	        }
	        
			return message;

	    }

	}