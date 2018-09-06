package com.dao.setting;

import com.tlite.pojo.BudgetRanges;

public interface ISetting {

	public int addService(String service_name);

	public int addBudgetRange(BudgetRanges range);
	
	public int validateBudgetRange(BudgetRanges range);

	public int deleteService(int service_id);
	
	public int deleteBudgetRange(int range_id);

	public int updateLeadPrice(double price);
}
