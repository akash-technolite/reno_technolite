package com.tlite.pojo;

import java.sql.Date;
import java.sql.Timestamp;

public class SubscriptionTransaction {
	
	private int transaction_id;
	private int contractorId;
	private Timestamp transaction_time;
	private Date subscription_start_date;
	private Date subscription_end_date;
	public int getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}
	public int getContractorId() {
		return contractorId;
	}
	public void setContractorId(int contractorId) {
		this.contractorId = contractorId;
	}
	public Timestamp getTransaction_time() {
		return transaction_time;
	}
	public void setTransaction_time(Timestamp transaction_time) {
		this.transaction_time = transaction_time;
	}
	public Date getSubscription_start_date() {
		return subscription_start_date;
	}
	public void setSubscription_start_date(Date subscription_start_date) {
		this.subscription_start_date = subscription_start_date;
	}
	public Date getSubscription_end_date() {
		return subscription_end_date;
	}
	public void setSubscription_end_date(Date subscription_end_date) {
		this.subscription_end_date = subscription_end_date;
	}
	

	
	
	
	

	
}