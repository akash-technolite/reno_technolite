package com.tlite.controller.contractor;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.contractor.IEstimation;
import com.tlite.dao.contractor.IEstimationImpl;
import com.tlite.dao.contractor.IInvoice;
import com.tlite.dao.contractor.IInvoiceImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.FollowUp;
import com.tlite.pojo.Subscriptions;

@WebServlet("/ShowContractor")
public class ShowContractor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IContractor contractorDao=new IContractorImpl();
	RequestDispatcher rd=null;
	String PATH=null;
	IContractor idao=null;
	String result="";
	ISubscriptions subDao=new ISubscriptionsImpl();
	ILead leaddao=new ILeadImpl();
	IEstimation estDao=new IEstimationImpl();
	IInvoice invDao=new IInvoiceImpl();   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		
		int contractorId=(int) session.getAttribute("userId");
		
	
		
		    request.setAttribute("newList", contractorDao.getLeadsByContractor(contractorId));
			request.setAttribute("estimatorList", contractorDao.getAllEstimators(contractorId));
			/*List<Employee> estimatorList=contractorDao.getAllEstimators(contractorId);*/
			request.setAttribute("installerList", contractorDao.getAllInstaller(contractorId));
			List<Contractor> contractorList=contractorDao.getContractorDetails(contractorId);
			request.setAttribute("FollowUpCount", contractorDao.getFollowUpCount(contractorId));
			request.setAttribute("AllInvoiceList", invDao.getAllInvoiceByContractor(contractorId));
			
			request.setAttribute("appliedList", contractorDao.getContractorAppliedLeads(contractorId));
			request.setAttribute("asssignedList", contractorDao.getContractorAssignedLeads(contractorId));
			request.setAttribute("consultedList", contractorDao.getConsultedLeadList(contractorId));
			request.setAttribute("quotedList", contractorDao.getQuotedLeadList(contractorId));
			request.setAttribute("soldLeads", contractorDao.getContractorSoldLeads(contractorId));
			request.setAttribute("workStartedLeads", contractorDao.getContractorWorkStartedLeads(contractorId));
			request.setAttribute("workCompledLeads", contractorDao.getContractorWorkCompletedLeads(contractorId));
			/*request.setAttribute("Invoiced", contractorDao.getContractorSoldLeads(contractorId));*/
			request.setAttribute("closedLeads", contractorDao.getContractorClosedLeads(contractorId));
			request.setAttribute("cancledLeads", contractorDao.getContractorCancledLeads(contractorId));
			
			int subscriptionId=0;
			
			for (Contractor con : contractorList) {
				
				subscriptionId=con.getSubscriptionId();
				
			}
			
			Subscriptions subscriptions= subDao.getSubscriptionById(subscriptionId);
			
			request.setAttribute("subscriptions", subscriptions);
			
			/*
			List<FollowUp> followList=contractorDao.getAllFollowUp();
			request.setAttribute("followList", followList);*/
			
		         PATH="contractorLeads.jsp";
			
		
	         rd=request.getRequestDispatcher(PATH);
	 		rd.forward(request, response);
	}

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	        doPost(request, response);	
	
	}
	
	
	
	
	
	
	
	
}
