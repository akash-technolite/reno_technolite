package com.tlite.dao.complaint;

import java.util.List;

import com.tlite.pojo.Complaint;
import com.tlite.pojo.ContractorComplaint;

public interface IComplaint {

	public String saveComplaint(Complaint complaint);
	
	public List<Complaint> getAllComplaints();
	
	public List<Complaint> getAllNewComplaintsById(int lead_id);
	public List<Complaint> getAllAssignedComplaintsById(int lead_id);
	public List<ContractorComplaint> getAllWorkingComplaintsById(int lead_id);
	public List<ContractorComplaint> getAllClosedComplaintsById(int lead_id);
	
	
	public String deleteComplaint(int complaintId);
	
	public String updateComplaint(Complaint complaint);
	
	public String assignComplaint(Complaint complaint);
	
	public Complaint getComplaintById(int complaint_id);
	
	
	public String updateStatus(String status,int complaint_id);

	
}
