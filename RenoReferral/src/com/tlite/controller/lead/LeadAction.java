package com.tlite.controller.lead;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.pojo.Lead;

@WebServlet("/LeadAction")
public class LeadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 RequestDispatcher rd=null;
		ILead leaddao=new ILeadImpl();
		IUser userDao=new IUserImpl();
		IContractor contractorDao=new IContractorImpl();
		ISubscriptions	subscriptionDao=new ISubscriptionsImpl();  
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		if(request.getParameter("result")!=null){
			
			String result=request.getParameter("result");
			
			
			if(result.equals("1")){
				request.setAttribute("SuccessMessage", "Lead Created Successfully");
				
			}else if(result.equals("leadAssigned")){
				
				request.setAttribute("SuccessMessage", "Lead Assigned Successfully");
				
			}else if(result.equals("leadNotAssigned")){
				
				 request.setAttribute("ErrorMessage", "Lead  Not Assigned");
			}else
				
				 request.setAttribute("ErrorMessage", "Lead Not created");
				 
			}
			
		request.setAttribute("UnAssignedLeadList", leaddao.getAllUnassignedLeads());
		request.setAttribute("assignedLeadList", leaddao.getAllAssignedLeads());
		request.setAttribute("appBuyList", leaddao.getAllAppliedBuyLeads());

		
		
		/*List<Lead> aplByeList=new ArrayList<>();
		
		
		
		List<Lead> assList=contractorDao.getContractorAssignedLeads();
		
		for (Lead lead : assList) {
			
			aplByeList.add(lead);
			
		}
		
		
		
	   List<Lead> allList=contractorDao.getContractorAppliedLeads();
	   
	   for (Lead lead : allList) {
			
		   aplByeList.add(lead);
		}
		
	   
	   HashSet<Lead> sortAplByeList=new HashSet<>();
	   
	   for (Lead lead : aplByeList) {
			
		   sortAplByeList.add(lead);
		}
	   
	   
           
	  
	      for (Lead lead : sortAplByeList) {
	        	
		   System.out.println("lead"+lead.getLeadID());
		   
	        }
	        
	        
	   request.setAttribute("sortAplByeList",sortAplByeList);
	   */
		
		
		
		rd=request.getRequestDispatcher("adminLeads.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
