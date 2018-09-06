package com.tlite.controller.lead;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.pojo.Lead;
import com.tlite.utility.RequestCleaner;


@WebServlet("/AssignLead")
public class AssignLead extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ILead leaddao=null;  
	 RequestDispatcher rd=null;
	 String path="";
	 String result="";
	 IUser userDao=null;
	
    public AssignLead() {
    	
    	leaddao=new ILeadImpl();
    	userDao=new IUserImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		path="adminLeads.jsp";
			
		rd=request.getRequestDispatcher(path);
		rd.forward(request, response);
    
		
		
	}

	
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int leadId=Integer.parseInt(request.getParameter("leadId"));
		int serviceId=Integer.parseInt(request.getParameter("serviceId"));
		int locationId=Integer.parseInt(request.getParameter("locationId"));
		
		
		Lead lead=new Lead();
		
		lead.setLeadID(leadId);
		lead.setServiceId(serviceId);
		lead.setLocationId(locationId);
		
		 
		  
	String[] contractorsList=request.getParameterValues("contractors");
	
	String[] subscriptionList=request.getParameterValues("subscriptions");
	
	
	List<Integer> contractorsIdBySubscription=new ArrayList<>();
	
	
	if(subscriptionList != null && subscriptionList.length > 0){
		
		System.out.println("Subscription ID is Not Null");
	   for (String SubscriptionId : subscriptionList) {
	
		contractorsIdBySubscription=userDao.getAllContractorsIdBySubscription(Integer.parseInt(SubscriptionId),lead);
		
		
		
		result=leaddao.assignLead(leadId, contractorsIdBySubscription);
		
		leaddao.updateLeadStatus("assigned", leadId);
		
		result=leaddao.addNewContractorLeads(leadId, contractorsIdBySubscription);
		
		
	    }
	 }
	
	
	
	
		
	List<Integer> contractorsIdList=new ArrayList<>();
	
	   int contractorId=0;
	   
	   if(contractorsList != null && contractorsList.length > 0){
		   
	   for (String string : contractorsList) {
		   
		System.out.println("id"+string);
		   contractorId=Integer.parseInt(string);
		   
		   
		    contractorsIdList.add(contractorId);
		
	     }
	   
	   
	   result=leaddao.assignLead(leadId, contractorsIdList);
	   
	   leaddao.updateLeadStatus("assigned", leadId);
	   
	   result=leaddao.addNewContractorLeads(leadId, contractorsIdList);
	   
	   }
	   
	     
	   
	   
	 		if(result.equals("success")){
	 			
	 			
	 			
	 			response.sendRedirect("LeadAction?result=leadAssigned");
	 		}
	 		
	 		else {
	 			
	 			
	 		response.sendRedirect("LeadAction?result=leadNotAssigned");
	 		
	            
	 			
	 			path="LeadAction";
	 			
	 			
	 		}
	 		
	 		
	 		
	 		/*rd=request.getRequestDispatcher(path);
	 		rd.forward(request, response);*/
	        
		
	}

}
