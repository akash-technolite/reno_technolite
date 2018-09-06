package com.tlite.pojo;

public class LeadEstimationElement {
  
	private int estimation_element_id=0;
	private int estimation_id=0;
	private int item_code=0;
	private String date=null;
	private String service_description=null;
	private int quantity=0;
	private Double price=0.0;
	private Double tax=0.0;
	private Double amount=0.0; 
	
	
	public int getEstimation_element_id() {
		return estimation_element_id;
	}
	public void setEstimation_element_id(int estimation_element_id) {
		this.estimation_element_id = estimation_element_id;
	}
	public int getEstimation_id() {
		return estimation_id;
	}
	public void setEstimation_id(int estimation_id) {
		this.estimation_id = estimation_id;
	}
	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getService_description() {
		return service_description;
	}
	public void setService_description(String service_description) {
		this.service_description = service_description;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getTax() {
		return tax;
	}
	public void setTax(Double tax) {
		this.tax = tax;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	
	
	
}


