package com.tlite.pojo;

import java.util.List;

/**
 * @author AakashTechnolite
 *
 */
public class EmailFormat {
	
	String username;
	String password;
	String to;
	String subject;
	String message;
	String clientName;
	String companyName;
	String attachment;
	List<Attachment> attachmentPaths;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public List<Attachment> getAttachmentPaths() {
		return attachmentPaths;
	}
	public void setAttachmentPaths(List<Attachment> attachmentPaths) {
		this.attachmentPaths = attachmentPaths;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	
	
	

	
	
	
	
}
