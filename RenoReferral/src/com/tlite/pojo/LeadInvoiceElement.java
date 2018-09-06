package com.tlite.pojo;

public class LeadInvoiceElement {

	private int invoice_element_id=0;
	private int invoice_id=0;
	private int item_code=0;
	private String service_date=null;
	private String service_description=null;
	private int quantity=0;
	private Double price=0.0;
	private Double tax=0.0;
	private Double amount=0.0;
	public int getInvoice_element_id() {
		return invoice_element_id;
	}
	public void setInvoice_element_id(int invoice_element_id) {
		this.invoice_element_id = invoice_element_id;
	}
	public int getInvoice_id() {
		return invoice_id;
	}
	public void setInvoice_id(int invoice_id) {
		this.invoice_id = invoice_id;
	}
	public int getItem_code() {
		return item_code;
	}
	public void setItem_code(int item_code) {
		this.item_code = item_code;
	}
	public String getService_date() {
		return service_date;
	}
	public void setService_date(String service_date) {
		this.service_date = service_date;
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
