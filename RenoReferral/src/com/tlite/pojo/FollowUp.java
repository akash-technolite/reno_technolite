package com.tlite.pojo;

public class FollowUp {
	
	private int follow_up_id=0;
	
	private int leadId=0;
	
	private String name=null;
	
	private String email=null;
	
	private long mobile=0;
	
	private int contractorId=0;
	
	private String timestamp;
	
	private String note;

	
	
	 
	
	public int getFollow_up_id() {
		return follow_up_id;
	}

	public void setFollow_up_id(int follow_up_id) {
		this.follow_up_id = follow_up_id;
	}

	public int getLeadId() {
		return leadId;
	}

	public void setLeadId(int leadId) {
		this.leadId = leadId;
	}

	public int getContractorId() {
		return contractorId;
	}

	public void setContractorId(int contractorId) {
		this.contractorId = contractorId;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	
	
	

}
