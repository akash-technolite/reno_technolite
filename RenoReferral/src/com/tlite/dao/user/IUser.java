package com.tlite.dao.user;

import java.util.List;

import com.tlite.pojo.Contractor;
import com.tlite.pojo.ContractorLimits;
import com.tlite.pojo.Lead;
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;

public interface IUser {
	
	
	public int saveContractorServices(int contractorId,List<Integer> contractorServicesIds);
	
	public int saveContractorLocations(int contractorId,List<Integer> contractorLocationsIds);
    
	
	public int getNextContractorId();
	
	public String saveContractor(Contractor contractor);
	
	
	public List<Contractor> getAllContractors();
	
	public List<Contractor> getAllContractorsByLead(int lead_id);
	
	public List<Contractor> getAllContractors(Lead lead);
	
	public List<Integer> getAllContractorsIdBySubscription(int SubscriptionId);
	
	public List<Integer> getAllContractorsIdBySubscription(int SubscriptionId,Lead lead);
	
	public List<Services> getContractorServices(int contractorId);
	
	public List<Locations> getContractorlocations(int contractorId);
	
	public int getContractorId();
	
	public String saveContractorSignUp(Contractor cont);
	
	public String updateContractor(Contractor contractor);
	
	public int addContractorLimits(ContractorLimits conLimits);
	
	public int renewSubscription(ContractorLimits conLimits);
	
	public int updateContractorLimit(String coloumname,int decrementValue,int contractorId);

	public boolean validateContractorEmail(String contractorEmail);

}
