package com.tlite.controller.contractor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tlite.dao.contractor.IWorkOrder;
import com.tlite.dao.contractor.IWorkOrderImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.pojo.WorkOrder;
import com.tlite.pojo.WorkOrderElement;


@WebServlet("/WorkOrderController")
public class WorkOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	String action=null;
	RequestDispatcher rd=null;
	ILead leaddao=new ILeadImpl();
	IWorkOrder orderDao=new IWorkOrderImpl();
	int res=0;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
			
		String action=request.getParameter("action");
		String result=request.getParameter("result");
		
		int contractorId=(int) session.getAttribute("userId");	
		
		
		if(action.equalsIgnoreCase("elementAdded")){
			
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			int work_order_id=Integer.parseInt(request.getParameter("work_order_id"));
			
			 request.setAttribute("work_order_id",work_order_id);
			 request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
			 
			 request.setAttribute("elementList",orderDao.getWorkOrderElement(work_order_id));
			 
			    rd=request.getRequestDispatcher("createWorkOrder.jsp");
				rd.forward(request, response);
				
		}else if(action.equalsIgnoreCase("workOrderCheckOut")){
			
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			int work_order_id=Integer.parseInt(request.getParameter("work_order_id"));
			
			
			 request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
			 request.setAttribute("order",orderDao.getWorkOrder(work_order_id));
			 request.setAttribute("elementList",orderDao.getWorkOrderElement(work_order_id));
			 
			    rd=request.getRequestDispatcher("workOrderCheckout.jsp");
				rd.forward(request, response);
			
		}else if(action.equalsIgnoreCase("showWorkOrders")){
			
               if(result!=null){
          		
     			if(result.equals("orderDeleted")){
     				
     				request.setAttribute("SuccessMessage", "Work Order Deleted");
     				
     			}else if(result.equals("orderNotDeleted")){
     				
     				request.setAttribute("ErrorMessage", "Work Order Not Deleted");
     				
     			}
			
               }
			
			
			
			 int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			 
			 request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
			 
			 request.setAttribute("ordersList",orderDao.getWorkOrdersByLeadId(lead_id,contractorId));
			 
			    rd=request.getRequestDispatcher("contractorLeadWorkOrders.jsp");
				rd.forward(request, response);
	
		 }
		
		
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session=request.getSession(false);
		 int contractorId=(int) session.getAttribute("userId");
		 action=request.getParameter("action");
		 
			if(action.equalsIgnoreCase("showWorkOrders")){
				
				 int lead_id=Integer.parseInt(request.getParameter("lead_id"));
				 
				 request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
				 
				 request.setAttribute("ordersList",orderDao.getWorkOrdersByLeadId(lead_id,contractorId));
				 
				    rd=request.getRequestDispatcher("contractorLeadWorkOrders.jsp");
					rd.forward(request, response);
		
			 }else if(action.equalsIgnoreCase("createOrder")){
				 
                 int lead_id=Integer.parseInt(request.getParameter("lead_id"));
				 
                 
				 request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
				 
				    rd=request.getRequestDispatcher("createWorkOrder.jsp");
					rd.forward(request, response);
				 
			 }else if(action.equalsIgnoreCase("createElement")){
				 
				 String work_oId=request.getParameter("work_order_id");
				 
				 System.out.println("work_oId"+work_oId);
				 
				 int lead_id=Integer.parseInt(request.getParameter("lead_id"));
				 
				 int work_order_id=0;
				 
				  if(work_oId==null || work_oId.isEmpty()){
					 
					 WorkOrder order=new WorkOrder();
					 
					 order.setLeadId(lead_id);
					 order.setContractorId(contractorId);
					 order.setTitle("");
					 order.setSpecial_notes("");
					 
					 res=orderDao.saveWorkOrder(order);
					 
					 if(res>0){
						 
						 work_order_id=orderDao.getNewWorkOrderId(); 
						 
					 }else{
						 
						 response.sendRedirect("WorkOrderController");
					 }
					 
					 
				 }else{
					 
					 work_order_id=Integer.parseInt(work_oId);
				 }
				 
				 
				  
				 WorkOrderElement element=new WorkOrderElement();
				 
				 element.setWork_order_id(work_order_id);
				 element.setItem_no(orderDao.getItemNumber(work_order_id));
				 element.setProduct(request.getParameter("product"));
				 element.setProduct_description(request.getParameter("productDescription"));
				 element.setQuantity(Integer.parseInt(request.getParameter("quantity")));
				 element.setOther(request.getParameter("other"));
				 
				 
				 res=orderDao.saveWorkOrderElement(element);
				 
				 if(res>0){
					 
					response.sendRedirect("WorkOrderController?action=elementAdded&lead_id="+lead_id+"&work_order_id="+work_order_id); 
					 
				 }else{
					 
					 response.sendRedirect("WorkOrderController");
				 } 
				 
				 
			 }else if(action.equalsIgnoreCase("deleteElement")){
				 
				 int work_order_id=Integer.parseInt(request.getParameter("work_order_id"));
				 int item_no=Integer.parseInt(request.getParameter("item_no"));
				 int lead_id=Integer.parseInt(request.getParameter("lead_id"));
				 
				 res=orderDao.deleteWorkOrderElement(work_order_id,item_no);
				 
				    if(res>0){
					 
						response.sendRedirect("WorkOrderController?action=elementAdded&lead_id="+lead_id+"&work_order_id="+work_order_id); 
						 
					 }else{
						 
						 response.sendRedirect("WorkOrderController");
					 }
			 }else if(action.equalsIgnoreCase("saveFinal")){
				 
				int work_order_id=Integer.parseInt(request.getParameter("work_order_id"));
				int lead_id=Integer.parseInt(request.getParameter("lead_id"));
				 
				 WorkOrder order=new WorkOrder();
				 
				 order.setWork_order_id(work_order_id);
				 order.setLeadId(lead_id);
				 order.setContractorId(contractorId);
				 order.setTitle(request.getParameter("title"));
				 order.setSpecial_notes(request.getParameter("specialNotes"));
				 
				 res=orderDao.updateWorkOrder(order);
				 
				      if(res>0){
					 
						response.sendRedirect("WorkOrderController?action=workOrderCheckOut&lead_id="+lead_id+"&work_order_id="+work_order_id); 
						 
					 }else{
						 
						 response.sendRedirect("WorkOrderController");
					 }
				 
				 
				 
			   }else if(action.equalsIgnoreCase("deleteOrder")){
				 
				int work_order_id=Integer.parseInt(request.getParameter("work_order_id"));
				int lead_id=Integer.parseInt(request.getParameter("lead_id"));
				 
				 res=orderDao.deleteWorkOrder(work_order_id);
				 
				      if(res>0){
					 
						response.sendRedirect("WorkOrderController?action=showWorkOrders&lead_id="+lead_id+"&result=orderDeleted"); 
						 
					 }else{
						 
						 response.sendRedirect("WorkOrderController?action=showWorkOrders&lead_id="+lead_id+"&result=orderNotDeleted"); 
					 }
				 
				 
				 
			 }else if(action.equalsIgnoreCase("workOrderCheckOut")){
					
					int lead_id=Integer.parseInt(request.getParameter("lead_id"));
					int work_order_id=Integer.parseInt(request.getParameter("work_order_id"));
					
					
					 request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
					 request.setAttribute("order",orderDao.getWorkOrder(work_order_id));
					 request.setAttribute("elementList",orderDao.getWorkOrderElement(work_order_id));
					 
					    rd=request.getRequestDispatcher("workOrderCheckout.jsp");
						rd.forward(request, response);
					
				}
	}

}
