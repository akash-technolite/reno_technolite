package com.dao.estimator;

import java.util.List;

import com.tlite.pojo.ContractorComplaint;
import com.tlite.pojo.Document;
import com.tlite.pojo.Employee;
import com.tlite.pojo.Lead;
import com.tlite.pojo.LeadNotes;
import com.tlite.pojo.Store;

public interface IEstimator {

	public boolean validate(String email, String password);
	
	public Employee getEmployeeDetails(String email);

	public List<Lead> getLeadsByEstimator(int contractor_id, int employee_id);

	public List<Lead> getConsultedLeadList(int contractor_id, int employee_id);

	public List<Lead> getQuotedLeadList(int contractor_id, int employee_id);

	public List<Lead> getContractorSoldLeads(int contractor_id, int employee_id);

	public List<Lead> getEstimatorWorkStartedLeads(int contractor_id, int employee_id);

	public List<Lead> getEstimatorWorkCompletedLeads(int contractor_id, int employee_id);

	public List<Lead> getEstimatorInvoicedLeads(int contractor_id, int employee_id);

	public List<Lead> getEstimatorClosedLeads(int contractor_id, int employee_id);

	public List<Lead> getEstimatorCancledLeads(int contractor_id, int employee_id);

	public List<Lead> getAllEstimatorLeads(int contractor_id, int employee_id);

	public List<ContractorComplaint> getAllestimatorComplaintsById(int leadId, int contractorId, int employee_id);

	public List<ContractorComplaint> getAllestimatorWorkingComplaintsById(int leadId, int contractorId, int employee_id);

	public List<ContractorComplaint> getAllestimatorClosedComplaintsById(int leadId, int contractorId, int employee_id);

	public List<Document> getAllEstimatorDocuments(int contractor_id, int employee_id);

	public List<Store> getAllStores(int contractor_id, int employee_id);

	public boolean validateEstimatorLead(int leadId, int contractorId, int estimator_id);

	public List<LeadNotes> getEstimatorLeadNotes(int leadId, int contractorId, int employee_id);

	public List<ContractorComplaint> getAllestimatorComplaints(int contractor_id, int employee_id);

	public List<ContractorComplaint> getAllestimatorWorkingComplaints(int contractor_id, int employee_id);

	public List<ContractorComplaint> getAllestimatorClosedComplaints(int contractor_id, int employee_id);
	
}
