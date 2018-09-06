package com.tlite.dao.contractor;

import java.util.List;

import com.tlite.pojo.WorkOrder;
import com.tlite.pojo.WorkOrderElement;

public interface IWorkOrder {

	public int saveWorkOrderElement(WorkOrderElement element);
	
	public int getNewWorkOrderId();
	
	public int getItemNumber(int work_order_id);
	
	public int saveWorkOrder(WorkOrder order);
	
	public int updateWorkOrder(WorkOrder order);
	
	public int deleteWorkOrderElement(int work_order_id,int item_no);
	
	public List<WorkOrderElement> getWorkOrderElement(int work_order_id);
	
	public WorkOrder getWorkOrder(int work_order_id);
	
	public List<WorkOrder> getWorkOrdersByLeadId(int lead_id,int contractor_id);

	public int deleteWorkOrder(int work_order_id);

	public int saveWorkOrderPaths(String webPath, String realPath, int work_order_id);
}
