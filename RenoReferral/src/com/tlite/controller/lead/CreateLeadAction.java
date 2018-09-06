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
import com.tlite.pojo.BudgetRanges;
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;


@WebServlet("/CreateLeadAction")
public class CreateLeadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IUser userDao=new IUserImpl();
	ILead leaddao=new ILeadImpl();
	ISubscriptions	subscriptionDao=new ISubscriptionsImpl();  
	    

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			/*List<Locations> LocationList=leaddao.getAllLocations();*/
			List<Services> serviceList=leaddao.getAllServices();
			/*List<Locations> cities=leaddao.getAllCities();*/
			request.setAttribute("budgetRanges", leaddao.getBudgetRanges());
			
			List<BudgetRanges> br=leaddao.getBudgetRanges();
			
			for (BudgetRanges budgetRanges : br) {
				
				System.out.println(budgetRanges.getMax_value());
			}
			
			
			request.setAttribute("serviceList", serviceList);
			/*request.setAttribute("LocationList", LocationList);*/
			/*request.setAttribute("cities", cities);*/
			
			
			
			RequestDispatcher rd=request.getRequestDispatcher("adminCreateLead.jsp");
			
			rd.forward(request, response);
		}

	
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			/*List<Locations> cities=leaddao.getAllCities();*/
			/*List<Locations> LocationList=leaddao.getAllLocations();*/
			List<Services> serviceList=leaddao.getAllServices();
			
			request.setAttribute("serviceList", serviceList);
			/*request.setAttribute("LocationList", LocationList);*/
			request.setAttribute("budgetRanges",leaddao.getBudgetRanges());
			
         List<BudgetRanges> br=leaddao.getBudgetRanges();
			
			for (BudgetRanges budgetRanges : br) {
				
				System.out.println(budgetRanges.getMax_value());
			}
			
			
			RequestDispatcher rd=request.getRequestDispatcher("adminCreateLead.jsp");
			
			rd.forward(request, response);
		}
		
		
		
		
	}