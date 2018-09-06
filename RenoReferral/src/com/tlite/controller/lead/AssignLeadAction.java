package com.tlite.controller.lead;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.Lead;
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;
import com.tlite.pojo.Subscriptions;

@WebServlet("/AssignLeadAction")
public class AssignLeadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IUser userDao=new IUserImpl();
	ILead leaddao=new ILeadImpl();
	ISubscriptions	subscriptionDao=new ISubscriptionsImpl();  
	    

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			int LeadID=Integer.parseInt(request.getParameter("LeadID"));
			int serviceId=Integer.parseInt(request.getParameter("serviceId"));
			int locationId=Integer.parseInt(request.getParameter("locationId"));
			
			
			Lead lead=new Lead();
			
			lead.setLeadID(LeadID);
			lead.setServiceId(serviceId);
			lead.setLocationId(locationId);
			
			
			
			
			
			
			request.setAttribute("lead", leaddao.getLeadDetails(LeadID));
			
			List<Contractor> contractorList=userDao.getAllContractors(lead);
			
			List<Subscriptions> subscriptionsList=subscriptionDao.getContractorsSubscriptionsById(serviceId, locationId);
		
			List<Locations> LocationList=leaddao.getAllLocations();
			
			
			request.setAttribute("contractorList", contractorList);
			request.setAttribute("LocationList", LocationList);
			request.setAttribute("subscriptionsList", subscriptionsList);
			
			request.setAttribute("LeadId", LeadID);
			
			
			RequestDispatcher rd=request.getRequestDispatcher("assignLead.jsp");
			
			rd.forward(request, response);
		}

	
		
		
		
		
		
	}