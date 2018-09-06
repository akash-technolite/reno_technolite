package com.tlite.pojo;

public class WorkOrder {
	
	private int work_order_id;
	private int LeadId;
	private int contractorId;
	private String title;
	private String special_notes;
	private String web_path=null;
	private String real_path=null;
	
	
	public int getWork_order_id() {
		return work_order_id;
	}
	public void setWork_order_id(int work_order_id) {
		this.work_order_id = work_order_id;
	}
	public int getLeadId() {
		return LeadId;
	}
	public void setLeadId(int leadId) {
		LeadId = leadId;
	}
	public int getContractorId() {
		return contractorId;
	}
	public void setContractorId(int contractorId) {
		this.contractorId = contractorId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSpecial_notes() {
		return special_notes;
	}
	public void setSpecial_notes(String special_notes) {
		this.special_notes = special_notes;
	}
	public String getWeb_path() {
		return web_path;
	}
	public void setWeb_path(String web_path) {
		this.web_path = web_path;
	}
	public String getReal_path() {
		return real_path;
	}
	public void setReal_path(String real_path) {
		this.real_path = real_path;
	}
	
	 
}
