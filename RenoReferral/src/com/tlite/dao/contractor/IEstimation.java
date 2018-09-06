package com.tlite.dao.contractor;

import java.util.List;

import com.tlite.pojo.LeadEstimation;
import com.tlite.pojo.LeadEstimationElement;

public interface IEstimation {

public int getNextEstimationId();
public int getNextItemCode(int estimation_id);
public String addEstimation(LeadEstimation estimation);
public String addEstimationElement(LeadEstimationElement estimationElement);

public List<LeadEstimationElement> getEstimationElementById(int estimation_id);

public LeadEstimation getEstimationById(int estimation_id);

public String updateEstimationTotal(Double total,int estimation_id);

public String deleteEstimationElement(int item_code,int estimation_id);


public List<LeadEstimation> getAllEstimationById(int leadId,int contractorId);


public String updateEstimationStatus(String estimation_status,int estimation_id);

public int saveEstimationPaths(String webPath, String realPath,int estimation_id);

public String getEstimationRealPath(int estimation_id);

}
