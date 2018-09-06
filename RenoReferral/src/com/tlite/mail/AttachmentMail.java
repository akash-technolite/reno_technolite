package com.tlite.mail;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.MultiPartEmail;

import com.tlite.pojo.Attachment;
import com.tlite.pojo.EmailFormat;

public class AttachmentMail {

	
	public void sendEmail(EmailFormat emailFormat) {
		
		 List<EmailAttachment> attachmentFiles=new ArrayList<>();
		 EmailAttachment attachmentFile = new EmailAttachment();
		 
		if(emailFormat.getAttachment()!=null){
			
			
			attachmentFile.setPath(emailFormat.getAttachment()); 
			attachmentFile.setDisposition(EmailAttachment.ATTACHMENT);
			
		}else{
		
		 List<Attachment> attachments=emailFormat.getAttachmentPaths();
		// Create the attachment
		 
		
         
		 for (Attachment attach : attachments) {
			EmailAttachment attachment = new EmailAttachment();
			attachment.setPath(attach.getAttachmentpath()); // here I want to set the prepared report path so that it could be sent to the user.
			attachment.setDisposition(EmailAttachment.ATTACHMENT);
			/*attachment.setDescription(attach.getDescription());
			attachment.setName(attach.getName());*/
			
			attachmentFiles.add(attachment);
		}
		 
		}
		 
		 
		 
		// Create the email message
		MultiPartEmail email = new MultiPartEmail();
		email.setHostName("smtp.googlemail.com");
		email.setSmtpPort(465);
		email.setAuthenticator(new DefaultAuthenticator(emailFormat.getUsername(), emailFormat.getPassword()));
		email.setSSLOnConnect(true);
		try {
			
	    email.addTo(emailFormat.getTo(), emailFormat.getClientName());
		email.setFrom(emailFormat.getUsername(),emailFormat.getCompanyName());
		email.setSubject(emailFormat.getSubject());
		email.setMsg(emailFormat.getMessage());
		 
		// add the attachment
		
		
           if(emailFormat.getAttachment()!=null){
			
        	   email.attach(attachmentFile);
			
		}else{
		
			for (EmailAttachment emailAttachment : attachmentFiles) {
				
				email.attach(emailAttachment);
			}
		
		}

		
		 
		// send the email
		email.send();
		
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
}
