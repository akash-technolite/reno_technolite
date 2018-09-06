package com.tlite.dao.contractor;

import java.util.List;

import com.tlite.pojo.Assign;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.ContractorLeadEmployeeDetails;
import com.tlite.pojo.ContractorLimits;
import com.tlite.pojo.DocumentTypes;
import com.tlite.pojo.Employee;
import com.tlite.pojo.FinalWorkReport;
import com.tlite.pojo.FinalWorkReportFiles;
import com.tlite.pojo.FollowUp;
import com.tlite.pojo.Lead;
import com.tlite.pojo.LeadNotes;
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;
import com.tlite.pojo.Subscriptions;

public interface IContractor {
	
 public List<Lead> getLeadsByContractor(int contractorId);
 
 public List<Lead> geAllContractorLeads(int contractorId);
 
 public Contractor getContractorByEmail(String email);
 
 public Lead getContracorLeadDetails(int leadId,int contractorId);
 
 public String addEmployee(Employee employee);
 
 public List<Employee> getAllEmployee(int contractorId);
 
 public List<Employee> getAllEstimators(int contractorId);
 
 public List<Employee> getAllInstaller(int contractorId);

 public String addAssign(Assign assigned);
 
 public String addContractorLeadEmployeeDetails(ContractorLeadEmployeeDetails conLeadEmp);
 
 public String applyLead(Assign assigned);
 
 public List<Lead> getContractorAssignedLeads(int contractorId);
 
 public List<Lead> getContractorAppliedLeads(int contractorId);
 
 public List<Contractor> getContractorDetails(int contractorId);
 
 
 public String deleteAppliedLead(Assign assigned);
 public String deleteAssignedLead(int leadId,int contractorId);
 
 
 public String deleteContractorLead(String tablename,int leadId,int contractorId);
 
 public String addFollowUp(FollowUp follow);
 
 public List<FollowUp> getAllFollowUp(int contractorId);
 
 public List<FollowUp> getAllFollowUpByLead(int leadId,int contractorId);
 
 public String addContractorLead(int leadId,int contractorId);
 
 public List<FollowUp> getTodaysFollowUp(int leadId,int contractorId);
 public List<FollowUp> getPastFollowUp(int leadId,int contractorId);
 public List<FollowUp> getUpcomingFollowUp(int leadId,int contractorId);
 
 public String moveToConsulted(int leadId,int contractorId);
 
 public List<Lead> getConsultedLeadList(int contractorId);
 
 public int getFollowUpCount(int contractorId);

public String addLeadNote(LeadNotes leadNote);

public List<LeadNotes> getLeadNotesById(int leadId, int contractorId);
 
public String moveContractorLead(String tablename,int leadId,int contractorId);

public List<Lead> getQuotedLeadList(int contractorId);

public Contractor getContractorById(int conID);

public Contractor getContractorId(int conID);

public List<Lead> getContractorAssignedLeads();

public List<Lead> getContractorAppliedLeads();

public List<Lead> getContractorSoldLeads(int contractorId);

public List<Lead> getContractorCancledLeads(int contractorId);

public List<Lead> getContractorWorkStartedLeads(int contractorId);

public List<Lead> getContractorWorkCompletedLeads(int contractorId);

public List<Lead> getContractorInvoicedLeads(int contractorId);

public List<Lead> getContractorClosedLeads(int contractorId);

public int deleteLeadNote(int notes_id);

public ContractorLimits getContractorLimits(int contractorId);

public boolean isSubscriptionExpired(int contractorId);

public int changeContractorSubscription(int contractorId,int current_subId,int prev_sub_id);

public boolean validateEmployeeEmail(String employee_email,int contractorId);

public boolean validateContractorLead(int lead_id,int contractorId);

public List<Integer> getContractorServices(int contractor_id);

public List<Locations> getContractorLocations(int contractor_id);

public boolean updateContractor(Contractor contractor);

public boolean deleteContractorServices(int contractor_id);

public boolean deleteContractorLocations(int contractor_id);

public boolean uploadProfilePicture(String finalPath, int contractorId);

public List<DocumentTypes> getDocumentTypes(int contractorId);

public int deleteDocumentType(int type_id);

public int addDocumentType(String document_type);

public boolean validateDocumentType(String document_type);

public int saveFinalWorkReport(FinalWorkReport workReport);

public int saveFinalWorkReportFiles(FinalWorkReportFiles reportFile);

public Lead getContracorLeadEmployeeDetails(int leadId, int contractorId);

public Subscriptions getContractorSubscription(int contractorId);

public Employee getLeadEstimator(int leadId, int contractorId);

public Employee getLeadInstaller(int leadId, int contractorId);

public int uploadCompanyLogo(String webPath, String realPath, int contractorId);

public String getCompanyLogo(int contractorId);

public String getCompanyRealLogo(int contractorId);

public int getContractorClosedLeadsCount(int contractorId);

public int getContractorByiedLeadsCount(int contractorId);

public FinalWorkReport getFinalReport(int leadId, int contractorId);

public List<FinalWorkReportFiles> getFinalReportFiles(int report_id);

public int deleteFinalWorkReportFiles(int report_id);

public int updateFinalWorkReport(FinalWorkReport workReport);

public double getContractorTax(int contractorId);

public int shareNote(int notes_id,int status);

}
