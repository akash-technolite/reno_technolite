package com.tlite.pojo;

import java.sql.Timestamp;
import java.util.List;

/**
 * @author AakashTechnolite
 *
 */
public class Lead {
	
	
	private int LeadID=0;
	private int serviceId=0;
	private int locationId=0;
	private Timestamp timestamp=null;
	private String Name=null;
	private String Email=null;
	private long Mobile=0;
	private String PostalCode=null;
	private String Address=null;
	private String Description=null;
	private String LeadReferrance=null;
	private String image;
	private String ServiceName=null;
	private String locationName=null;
	private int estimatorId=0;
	private String estimatorName=null;
	private int installerId=0;
	private String installerName=null;
	private int  contactorCount=0;
	private int sell_count=0;
	private int max_byers=0;
	private int budget_range_id=0;
	private String lead_status=null;
	private String lead_type=null;
	private BudgetRanges budgetrange;
	private List<LeadNotes> leadNotes;
	private List<LeadEstimation> leadEstimations;
	private List<LeadInvoice> leadInvoices;
	private List<FollowUp> leadFollowUps;
	private int contractorId=0;
	private String contractorName=null;
	private Contractor contractor=null;
	private Employee estimator=null;
	private Employee installer=null;
	private String city=null;
	
	public int getLeadID() {
		return LeadID;
	}
	public void setLeadID(int leadID) {
		LeadID = leadID;
	}
	
	
	
	
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public long getMobile() {
		return Mobile;
	}
	public void setMobile(long mobile) {
		Mobile = mobile;
	}
	public String getPostalCode() {
		return PostalCode;
	}
	public void setPostalCode(String postalCode) {
		PostalCode = postalCode;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getLeadReferrance() {
		return LeadReferrance;
	}
	public void setLeadReferrance(String leadReferrance) {
		LeadReferrance = leadReferrance;
	}
	
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getServiceName() {
		return ServiceName;
	}
	public void setServiceName(String serviceName) {
		ServiceName = serviceName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public int getEstimatorId() {
		return estimatorId;
	}
	public void setEstimatorId(int estimatorId) {
		this.estimatorId = estimatorId;
	}
	public String getEstimatorName() {
		return estimatorName;
	}
	public void setEstimatorName(String estimatorName) {
		this.estimatorName = estimatorName;
	}
	public int getInstallerId() {
		return installerId;
	}
	public void setInstallerId(int installerId) {
		this.installerId = installerId;
	}
	public String getInstallerName() {
		return installerName;
	}
	public void setInstallerName(String installerName) {
		this.installerName = installerName;
	}
	public int getContactorCount() {
		return contactorCount;
	}
	public void setContactorCount(int contactorCount) {
		this.contactorCount = contactorCount;
	}
	public int getLocationId() {
		return locationId;
	}
	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}
	public int getSell_count() {
		return sell_count;
	}
	public void setSell_count(int sell_count) {
		this.sell_count = sell_count;
	}
	public int getMax_byers() {
		return max_byers;
	}
	public void setMax_byers(int max_byers) {
		this.max_byers = max_byers;
	}
	public String getLead_status() {
		return lead_status;
	}
	public void setLead_status(String lead_status) {
		this.lead_status = lead_status;
	}
	public String getLead_type() {
		return lead_type;
	}
	public void setLead_type(String lead_type) {
		this.lead_type = lead_type;
	}
	public int getBudget_range_id() {
		return budget_range_id;
	}
	public void setBudget_range_id(int budget_range_id) {
		this.budget_range_id = budget_range_id;
	}
	public BudgetRanges getBudgetrange() {
		return budgetrange;
	}
	public void setBudgetrange(BudgetRanges budgetrange) {
		this.budgetrange = budgetrange;
	}
	public List<LeadNotes> getLeadNotes() {
		return leadNotes;
	}
	public void setLeadNotes(List<LeadNotes> leadNotes) {
		this.leadNotes = leadNotes;
	}
	public List<LeadEstimation> getLeadEstimations() {
		return leadEstimations;
	}
	public void setLeadEstimations(List<LeadEstimation> leadEstimations) {
		this.leadEstimations = leadEstimations;
	}
	public List<LeadInvoice> getLeadInvoices() {
		return leadInvoices;
	}
	public void setLeadInvoices(List<LeadInvoice> leadInvoices) {
		this.leadInvoices = leadInvoices;
	}
	public List<FollowUp> getLeadFollowUps() {
		return leadFollowUps;
	}
	public void setLeadFollowUps(List<FollowUp> leadFollowUps) {
		this.leadFollowUps = leadFollowUps;
	}
	public int getContractorId() {
		return contractorId;
	}
	public void setContractorId(int contractorId) {
		this.contractorId = contractorId;
	}
	public String getContractorName() {
		return contractorName;
	}
	public void setContractorName(String contractorName) {
		this.contractorName = contractorName;
	}
	public Contractor getContractor() {
		return contractor;
	}
	public void setContractor(Contractor contractor) {
		this.contractor = contractor;
	}
	public Employee getEstimator() {
		return estimator;
	}
	public void setEstimator(Employee estimator) {
		this.estimator = estimator;
	}
	public Employee getInstaller() {
		return installer;
	}
	public void setInstaller(Employee installer) {
		this.installer = installer;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	
	
	
	
	
	
	
	
	

}
