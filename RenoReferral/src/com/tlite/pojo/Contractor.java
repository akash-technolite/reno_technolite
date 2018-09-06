package com.tlite.pojo;

import java.sql.Date;
import java.util.List;

public class Contractor {

	private int contractorId=0;
	
	private String contractorName=null;
	
	private String contractorEmail=null;
	
	private long contractorMobileNumber=0;
	
	private String contractorCompany=null;
	
	private int contractorServiceId=0;
	
	private int contractorLocationsId=0;
	
	private int subscriptionId=0;
	
	
	private String subscriptionName=null;
	
	private String serviceName=null;
	
	private String locationName=null;
	
	private String password=null;
	
	private List<Services> contractorServices=null;
	
	private List<Locations> contractorLocations=null; 
	
	private String stripeToken=null;
	
	private String stripeTokenType=null;
	
	private Date subscription_start_date;
	
	private Date subscription_end_date;
	
	
	private int previousSubscription;
	
	private String contractorAddress=null;
	
	private String contractorPicture=null;
	
	private Date contractorRegDate;
	
	private int tax_id;
	
	
	
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

	public String getContractorEmail() {
		return contractorEmail;
	}

	public void setContractorEmail(String contractorEmail) {
		this.contractorEmail = contractorEmail;
	}

	public String getContractorCompany() {
		return contractorCompany;
	}

	public void setContractorCompany(String contractorCompany) {
		this.contractorCompany = contractorCompany;
	}

	public int getContractorServiceId() {
		return contractorServiceId;
	}

	public void setContractorServiceId(int contractorServiceId) {
		this.contractorServiceId = contractorServiceId;
	}

	public int getContractorLocationsId() {
		return contractorLocationsId;
	}

	public void setContractorLocationsId(int contractorLocationsId) {
		this.contractorLocationsId = contractorLocationsId;
	}

	public int getSubscriptionId() {
		return subscriptionId;
	}

	public void setSubscriptionId(int subscriptionId) {
		this.subscriptionId = subscriptionId;
	}

	public String getPassword() {
		return password;
	}

	public List<Services> getContractorServices() {
		return contractorServices;
	}

	public void setContractorServices(List<Services> contractorServices) {
		this.contractorServices = contractorServices;
	}

	public List<Locations> getContractorLocations() {
		return contractorLocations;
	}

	public void setContractorLocations(List<Locations> contractorLocations) {
		this.contractorLocations = contractorLocations;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getContractorMobileNumber() {
		return contractorMobileNumber;
	}

	public void setContractorMobileNumber(long contractorMobileNumber) {
		this.contractorMobileNumber = contractorMobileNumber;
	}

	public String getSubscriptionName() {
		return subscriptionName;
	}

	public void setSubscriptionName(String subscriptionName) {
		this.subscriptionName = subscriptionName;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getStripeToken() {
		return stripeToken;
	}

	public void setStripeToken(String stripeToken) {
		this.stripeToken = stripeToken;
	}

	public String getStripeTokenType() {
		return stripeTokenType;
	}

	public void setStripeTokenType(String stripeTokenType) {
		this.stripeTokenType = stripeTokenType;
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

	public int getPreviousSubscription() {
		return previousSubscription;
	}

	public void setPreviousSubscription(int previousSubscription) {
		this.previousSubscription = previousSubscription;
	}

	public String getContractorAddress() {
		return contractorAddress;
	}

	public void setContractorAddress(String contractorAddress) {
		this.contractorAddress = contractorAddress;
	}

	public String getContractorPicture() {
		return contractorPicture;
	}

	public void setContractorPicture(String contractorPicture) {
		this.contractorPicture = contractorPicture;
	}

	public Date getContractorRegDate() {
		return contractorRegDate;
	}

	public void setContractorRegDate(Date contractorRegDate) {
		this.contractorRegDate = contractorRegDate;
	}

	public int getTax_id() {
		return tax_id;
	}

	public void setTax_id(int tax_id) {
		this.tax_id = tax_id;
	}
	
	
	
	
	
	
	
}
