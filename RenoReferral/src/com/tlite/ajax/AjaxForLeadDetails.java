package com.tlite.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.estimator.IEstimator;
import com.dao.estimator.IEstimatorImpl;
import com.google.gson.Gson;
import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.contractor.IEstimation;
import com.tlite.dao.contractor.IEstimationImpl;
import com.tlite.dao.contractor.IInvoice;
import com.tlite.dao.contractor.IInvoiceImpl;
import com.tlite.pojo.FollowUp;
import com.tlite.pojo.Lead;
import com.tlite.pojo.LeadNotes;


@WebServlet("/AjaxForLeadDetails")
public class AjaxForLeadDetails extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	IContractor contratorDao=null;
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		contratorDao=new IContractorImpl();
		IInvoice invDao=new IInvoiceImpl();
		IEstimation estDao=new IEstimationImpl();
		
		 int contractorId=Integer.parseInt(request.getParameter("contractorId"));
		
		 
		 int  leadId=Integer.parseInt(request.getParameter("leadId"));
		 
		 Lead mainLead=new Lead();
		 
		 Lead lead=contratorDao.getContracorLeadDetails(leadId, contractorId);
		 
		/* Lead lead2=contratorDao.getContracorLeadEmployeeDetails(leadId, contractorId);*/
		
		
		 
		 mainLead.setLeadID(lead.getLeadID());
		 mainLead.setServiceId(lead.getServiceId());
		 mainLead.setDescription(lead.getDescription());
		 mainLead.setName(lead.getName());
		 mainLead.setEmail(lead.getEmail());
		 mainLead.setMobile(lead.getMobile());
		 mainLead.setPostalCode(lead.getPostalCode());
		 mainLead.setAddress(lead.getAddress());
		 mainLead.setTimestamp(lead.getTimestamp());
		 mainLead.setLead_status(lead.getLead_status());
		 mainLead.setBudgetrange(lead.getBudgetrange());
		 mainLead.setServiceName(lead.getServiceName());
		 mainLead.setLocationId(lead.getLocationId());
		 mainLead.setLocationName(lead.getLocationName());
		/* mainLead.setEstimatorId(lead2.getEstimatorId());
		 mainLead.setEstimatorName(lead2.getEstimatorName());
		 mainLead.setInstallerId(lead2.getInstallerId());
		 mainLead.setInstallerName(lead2.getInstallerName());*/
		 
		 mainLead.setEstimator(contratorDao.getLeadEstimator(leadId,contractorId));          
		 mainLead.setInstaller(contratorDao.getLeadInstaller(leadId,contractorId));
		 mainLead.setLeadNotes(contratorDao.getLeadNotesById(leadId,contractorId));
		 mainLead.setLeadInvoices(invDao.getAllInvoiceById(leadId, contractorId));
		 mainLead.setLeadEstimations(estDao.getAllEstimationById(leadId, contractorId));
		 
		 List<FollowUp> upcomingFollowList=contratorDao.getUpcomingFollowUp(leadId, contractorId);
		 List<FollowUp> todayFollowList=contratorDao.getTodaysFollowUp(leadId, contractorId);

		 todayFollowList.addAll(upcomingFollowList);
		 
		 mainLead.setLeadFollowUps(todayFollowList);
		 
		 String  json= new Gson().toJson(mainLead);
		 
		     /*System.out.println(json);*/
		     
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
		    
		System.out.println(json);
		    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
