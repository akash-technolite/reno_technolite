package com.tlite.pojo;

public class WorkOrderElement {

	private int work_order_element_id;
	private int work_order_id;
	private int item_no;
	private String product;
	private String product_description;
	private int quantity;
	private String other;
	
	
	public int getWork_order_element_id() {
		return work_order_element_id;
	}
	public void setWork_order_element_id(int work_order_element_id) {
		this.work_order_element_id = work_order_element_id;
	}
	public int getWork_order_id() {
		return work_order_id;
	}
	public void setWork_order_id(int work_order_id) {
		this.work_order_id = work_order_id;
	}
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getOther() {
		return other;
	}
	public void setOther(String other) {
		this.other = other;
	}
	
	
	
}
