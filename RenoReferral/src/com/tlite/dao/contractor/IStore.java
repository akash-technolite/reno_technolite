package com.tlite.dao.contractor;

import java.util.List;

import com.tlite.pojo.Employee;
import com.tlite.pojo.Store;
import com.tlite.pojo.StoreItems;

public interface IStore {
	
	public List<Store> getAllStores(int contractor_id);
    
	public int addStore(Store store);
	
	public int addStoreItems(List<StoreItems> itemsList);
	
	public List<StoreItems> getStoreItems(int stores_id);

	public int disableStore(int store_id);
	
	public Store getStore(int  stores_id);
	
	public int updateStore(Store store);
	
	public int deleteStoreItems(int stores_id);

	public boolean validateSharing(int store_id, int employee_id);

	public int shareDocument(int store_id, int employee_id);

	public List<Employee> getSharedList(int stores_id);
}
