package com.tlite.pojo;

/**
 * @author AakashTechnolite
 *
 */
public class ContractorComplaint {

	private int con_complaint_id=0;
	private String timestamp=null;
	private int LeadID=0;
	private int contractorId=0;
	private int employee_id=0;
	private String complaint_text=null;
	private String complaint_status=null;
	private int installer_id=0;
	
	
	public int getCon_complaint_id() {
		return con_complaint_id;
	}
	public void setCon_complaint_id(int con_complaint_id) {
		this.con_complaint_id = con_complaint_id;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public int getLeadID() {
		return LeadID;
	}
	public void setLeadID(int leadID) {
		LeadID = leadID;
	}
	public int getContractorId() {
		return contractorId;
	}
	
	
	public int getEmployee_id() {
		return employee_id;
	}
	
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public void setContractorId(int contractorId) {
		this.contractorId = contractorId;
	}
	public String getComplaint_text() {
		return complaint_text;
	}
	public void setComplaint_text(String complaint_text) {
		this.complaint_text = complaint_text;
	}
	public String getComplaint_status() {
		return complaint_status;
	}
	public void setComplaint_status(String complaint_status) {
		this.complaint_status = complaint_status;
	}
	public int getInstaller_id() {
		return installer_id;
	}
	public void setInstaller_id(int installer_id) {
		this.installer_id = installer_id;
	}
	
	
	 
	
}
