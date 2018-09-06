package com.tlite.timer;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tlite.dao.contractor.IPromotion;
import com.tlite.dao.contractor.IPromotionImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.pojo.DefaultLeadSubscriptions;
import com.tlite.pojo.Lead;
import com.tlite.timer.dao.ITimerTask;
import com.tlite.timer.dao.ITimerTaskImpl;

public class TimerJob implements Runnable {

	IUser userDao=new IUserImpl();
	ILead leaddao=new ILeadImpl();
	List<Lead> leadList;
	ISubscriptions	subscriptionDao=new ISubscriptionsImpl();  
	List<DefaultLeadSubscriptions> subList;
	 IPromotion promotionDao=new IPromotionImpl();
	 
	@Override
	public void run() {
		
		
		promotionDao.RemoveExpiredPromotion();
		
        ITimerTask timerDao=new ITimerTaskImpl();
        
        int hours=timerDao.getDefaultHours();
		
		
		
		leadList=leaddao.getAllUnassignedLeads();
		subList=subscriptionDao.getAllDefaultSubscription();
		
		List<Integer> contractorIdList=new ArrayList<>();
		
		List<Integer> contractorIds=new ArrayList<>();
		List<List<Integer>> contractors=new ArrayList<>();
		
		
		
		for (DefaultLeadSubscriptions defSub : subList) {
			
			contractorIds=userDao.getAllContractorsIdBySubscription(defSub.getSubscriptionId());
			
			contractors.add(contractorIds);
		}
		
		
		for (List<Integer> list : contractors) {
			
			for (Integer contractorId : list) {
				
				
				
				contractorIdList.add(contractorId);
				
				
				
			} 
			
			
			
			
		}
		
		
		for (Lead lead : leadList) {
		
			
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			
			  long milliseconds1 = lead.getTimestamp().getTime();
			  long milliseconds2 = timestamp.getTime();
			  
			  
			  
			  long diff = milliseconds2 - milliseconds1;
			  
			  long diffHours = diff / (60 * 60 * 1000);
			   
			
			  if(diffHours>=hours){
			
		      leaddao.assignLead(lead.getLeadID(), contractorIdList);
		   
		      leaddao.updateLeadStatus("assigned", lead.getLeadID());
		      
		      leaddao.addNewContractorLeads(lead.getLeadID(), contractorIdList);
		      
		   }
			
			else{
				
				System.out.println("Time Not Matched");
				
				
			}
			
			
		
		}
		
		

	}

}
