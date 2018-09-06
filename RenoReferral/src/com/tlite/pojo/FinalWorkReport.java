package com.tlite.pojo;

import java.util.List;

public class FinalWorkReport {

	private int report_id;
	private int leadId;
	private int contractorId;
	private String to;
	private String subject;
	private String mesage;
	private List<FinalWorkReportFiles> files;
	
	
	
	
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getMesage() {
		return mesage;
	}
	public void setMesage(String mesage) {
		this.mesage = mesage;
	}
	public List<FinalWorkReportFiles> getFiles() {
		return files;
	}
	public void setFiles(List<FinalWorkReportFiles> files) {
		this.files = files;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	} 
	
	
}
