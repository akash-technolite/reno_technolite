package com.dao.installer;

import java.util.List;

import com.tlite.pojo.ContractorComplaint;
import com.tlite.pojo.Document;
import com.tlite.pojo.Lead;
import com.tlite.pojo.LeadNotes;

public interface IInstaller {

	List<Lead> getInstallerWorkStartedLeads(int contractor_id, int employee_id);

	List<Lead> getInstallerWorkCompletedLeads(int contractor_id, int employee_id);

	boolean validate(String email, String password);

	List<Document> getAllInstallerDocuments(int contractor_id, int employee_id);

	List<ContractorComplaint> getAllInstallerWorkingComplaintsById(int leadId, int contractorId, int employee_id);

	List<ContractorComplaint> getAllInstallerComplaintsById(int leadId, int contractorId, int employee_id);

	List<ContractorComplaint> getAllInstallerClosedComplaintsById(int leadId, int contractorId, int employee_id);

	boolean validateInstallerLead(int leadId, int contractorId, int employee_id);

	List<ContractorComplaint> getAllInstallerComplaints(int contractor_id, int employee_id);

	List<ContractorComplaint> getAllInstallerClosedComplaints(int contractor_id, int employee_id);

	List<ContractorComplaint> getAllInstallerWorkingComplaints(int contractor_id, int employee_id);

	List<LeadNotes>  getInstallerLeadNotesById(int leadId, int contractor_id);

}
