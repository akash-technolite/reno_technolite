package com.tlite.dao.contractor;

import java.util.List;

import com.tlite.pojo.ContractorComplaint;

public interface IContractorComplaints {

	
	
	public List<ContractorComplaint> getAllContractorNewComplaintsById(int leadId, int contractorId);
	public List<ContractorComplaint> getAllContractorAssignedComplaintsById(int leadId, int contractorId);
	public List<ContractorComplaint> getAllContractorWorkingComplaintsById(int leadId, int contractorId);
	public List<ContractorComplaint> getAllContractorClosedComplaintsById(int leadId, int contractorId);
	
	public String saveComplaint(ContractorComplaint complaint);
	
	public String assignComplaint(int complaint_id,int employee_id,int installer_id);
	
	public String updateComplaintStatus(int complaint_id,String status);
	public List<ContractorComplaint> getAllContractorNewComplaints(int contractorId);
	public List<ContractorComplaint> getAllContractorAssignedComplaints(int contractorId);
	public List<ContractorComplaint> getAllContractorWorkingComplaints(int contractorId);
	public List<ContractorComplaint> getAllContractorClosedComplaints(int contractorId);
}
