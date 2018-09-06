package com.tlite.pojo;

public class Complaint {
	
	
	private int complaintId=0;
	
	private int LeadId=0;
	
	private int contractorId=0;
	private String ComplaintText=null;
	
	private String Status=null;
	
	private String timestamp=null;
	
	private String complaint_status=null;
	
	
	
	
	

	public int getComplaintId() {
		return complaintId;
	}

	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}

	public int getLeadId() {
		return LeadId;
	}

	public void setLeadId(int leadId) {
		LeadId = leadId;
	}

	public String getComplaintText() {
		return ComplaintText;
	}

	public void setComplaintText(String complaintText) {
		ComplaintText = complaintText;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public int getContractorId() {
		return contractorId;
	}

	public void setContractorId(int contractorId) {
		this.contractorId = contractorId;
	}

	public String getComplaint_status() {
		return complaint_status;
	}

	public void setComplaint_status(String complaint_status) {
		this.complaint_status = complaint_status;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	
	
	
	

}
