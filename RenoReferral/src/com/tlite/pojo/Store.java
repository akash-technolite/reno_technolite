package com.tlite.pojo;

import java.util.List;

public class Store {

	private int stores_id;
	private int contractor_id;
	private long store_mobile;
	private String store_name;
	private String store_address;
	private String store_email;
	/*private String store_items;*/
	private String store_status;
	private List<StoreItems> store_items;
	
	public int getStores_id() {
		return stores_id;
	}
	public void setStores_id(int stores_id) {
		this.stores_id = stores_id;
	}
	public long getStore_mobile() {
		return store_mobile;
	}
	public void setStore_mobile(long store_mobile) {
		this.store_mobile = store_mobile;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_address() {
		return store_address;
	}
	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}
	public String getStore_email() {
		return store_email;
	}
	public void setStore_email(String store_email) {
		this.store_email = store_email;
	}
	
	public String getStore_status() {
		return store_status;
	}
	public void setStore_status(String store_status) {
		this.store_status = store_status;
	}
	public int getContractor_id() {
		return contractor_id;
	}
	public void setContractor_id(int contractor_id) {
		this.contractor_id = contractor_id;
	}
	public List<StoreItems> getStore_items() {
		return store_items;
	}
	public void setStore_items(List<StoreItems> store_items) {
		this.store_items = store_items;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
