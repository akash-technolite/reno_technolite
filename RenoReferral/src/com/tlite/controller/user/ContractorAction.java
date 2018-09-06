package com.tlite.controller.user;

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
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;
import com.tlite.pojo.Subscriptions;


@WebServlet("/ContractorAction")
public class ContractorAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ISubscriptions subscriptionDao=null;
	ILead leaddao=null;
	RequestDispatcher rd=null;
   
    public ContractorAction() {
    	subscriptionDao=new ISubscriptionsImpl();  
     leaddao=new ILeadImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");		
	
			
			if(request.getParameter("result")!=null){
				
			if(request.getParameter("result").equals("emailAlreadyRegistered")){
				
				 request.setAttribute("ErrorMessage", "Email already registered");
			}
			
			}
			
			
		
		List<Subscriptions> subscriptionsList=subscriptionDao.getAllTotalSubscription();
		
		
		List<Services> serviceList=leaddao.getAllServices();
		
		/*List<Locations> LocationList=leaddao.getAllLocations();*/
		
		request.setAttribute("serviceList", serviceList);
		/*request.setAttribute("LocationList", LocationList);*/
		request.setAttribute("subscriptionsList", subscriptionsList);
		List<Locations> cities=leaddao.getAllCities();
		   request.setAttribute("cities", cities);
		rd=request.getRequestDispatcher("createContractor.jsp");
		
		rd.forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		doGet(request,response);
	}

}
