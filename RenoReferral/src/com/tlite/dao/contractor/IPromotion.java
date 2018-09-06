package com.tlite.dao.contractor;

import java.util.List;

import com.tlite.pojo.Promotion;

public interface IPromotion {

	public String addPromotion(Promotion promotion);
	
	public List<Promotion> getAllPromotion(int contractorId);
	
	public List<Promotion> getAllActivePromotion(int contractorId);
	
	
	public List<Promotion> getAllExipary();
	
	public String RemoveExpiredPromotion();
	
}
