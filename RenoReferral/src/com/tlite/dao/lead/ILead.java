package com.tlite.dao.lead;

import java.util.List;

import com.tlite.pojo.BudgetRanges;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.DefaultLeadSetting;
import com.tlite.pojo.DefaultLeadSubscriptions;
import com.tlite.pojo.Lead;
import com.tlite.pojo.LeadImages;
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;
import com.tlite.pojo.Taxation;

public interface ILead {

	 public List<Lead> getAllLeads();
	 
	public String registerLead(Lead lead);
	
	public Lead getLeadDetails(int LeadID);
	
	public String  saveImagePaths(LeadImages images);
	
	public int  getNextLeadId();
	
	public List<String> getImagePaths(int leadId);
	
	public List<Services> getAllServices();
	
	public List<Locations> getAllLocations();
	
	public String saveDeafaultLeadSetting(DefaultLeadSetting defaultLead);
	
	public List<DefaultLeadSetting> getDeafaultLeadSetting();
	
	
	public int getNextDefaultLeadId();
	
	public String saveDefaultLeadSubscriptions(DefaultLeadSubscriptions defaultLeadSub);

	public Boolean deleteDefaultLeadSubscriptions();
	
    public String assignLead(int LeadId,List<Integer> contractorIdList);

    public int getContractorsCount(int subscriptionId);
    
    public int getContractorsCount(int subscriptionId,Lead lead);
    
    public List<Lead> getAllUnassignedLeads();
    
    public List<Lead> getAllAssignedLeads(); 
    
    public List<Lead> getAllAppliedBuyLeads(); 
    
    public int getLeadSellCount(int leadId); 
   
    public String updateLeadSellCount(int count,int leadId);
    
    public String addNewContractorLeads(int LeadId,List<Integer> contractorIdList);
    
    
    public String updateLeadStatus(String status,int leadId);
    
    
    public String addApplyBuyLead(int leadId,int contractorId);
    
    public List<Locations> getAllCities();
    
    public List<Locations> getPincodesByCity(String cityName);
    
    public int addNewLocation(Locations location);
    
    public int checkforLocation(String locationName);
    
    public List<BudgetRanges> getBudgetRanges();

	public boolean validateLead(int lead_id);

	public boolean checkIfSold(int leadId);

	public Contractor getLeadContractorDetails(int leadID);

	public String getLeadEmail(int leadId);

	public int getLast24hrsleadCount();

	public int getContractorsCountFromLast7days();

	public double getDefaultLeadPrice();

	public List<Taxation> getTaxation();

	public Taxation getTaxationById(int tax_id);

	public int updateTaxation(Taxation tax);
	
	 
}
