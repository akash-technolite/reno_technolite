package com.tlite.dao.subscriptions;

import java.util.List;

import com.tlite.pojo.DefaultLeadSubscriptions;
import com.tlite.pojo.SubscriptionQueue;
import com.tlite.pojo.SubscriptionTransaction;
import com.tlite.pojo.Subscriptions;

public interface ISubscriptions {
	
	public String createSubscription(Subscriptions sub);
	public String updateSubscription(Subscriptions sub);
	public List<Subscriptions> getAllSubscription();//public
	public List<Subscriptions> getAllSubscriptionPrivate();
	public List<DefaultLeadSubscriptions> getAllDefaultSubscription();
	public List<Subscriptions> getSubscriptions();
	public Subscriptions getSubscriptionById(int subId);

	public List<Subscriptions> getAllTotalSubscription();
	
	public List<Subscriptions> getContractorsSubscriptionsById(int serviceId,int locationId);
	
	public int makePrivate(int subscription_id);
	
	public int makePublic(int subscription_id);
	
	public int disableSubscription(int subscription_id);
	
	public int addNewSubscriptionTransaction(SubscriptionTransaction transaction);
	
	SubscriptionTransaction getLastTransaction(int contractorId);
	
	int getSubscriptionRemainingDays(int contractorId);
	
	public Subscriptions getDefaultSubscription();
	
	public int addNewSubscriptionQueue(SubscriptionQueue queue);
	
	public SubscriptionQueue getSubscriptionQueue(int contractorId);
	
	public boolean checkSubscriptionQueueAvailability(int contractorId);
	
	public int deleteSubscriptionQueue(int contractorId);
	
	public int getDefaultSubscriptionId();
	
	public String updateDefaultSubscription(Subscriptions sub);
	
	
	public List<Subscriptions> getAllTotalSubscriptionForDefaulLeadAction();
}
