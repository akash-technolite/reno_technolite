package com.tlite.pojo;

import java.sql.Timestamp;

public class SubscriptionQueue {
	
	private	int  queue_id;
	private	int  contractorId;
	private	int  subscriptionId;
	private	int  previousSubId;
	private	Timestamp  queued_time;
	
	public int getQueue_id() {
		return queue_id;
	}
	public void setQueue_id(int queue_id) {
		this.queue_id = queue_id;
	}
	public int getContractorId() {
		return contractorId;
	}
	public void setContractorId(int contractorId) {
		this.contractorId = contractorId;
	}
	public int getSubscriptionId() {
		return subscriptionId;
	}
	public void setSubscriptionId(int subscriptionId) {
		this.subscriptionId = subscriptionId;
	}
	public int getPreviousSubId() {
		return previousSubId;
	}
	public void setPreviousSubId(int previousSubId) {
		this.previousSubId = previousSubId;
	}
	public Timestamp getQueued_time() {
		return queued_time;
	}
	public void setQueued_time(Timestamp queued_time) {
		this.queued_time = queued_time;
	}
	
	
}
