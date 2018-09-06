package com.dao.login;

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
import com.tlite.pojo.Services;


@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IUser userDao=new IUserImpl();
	ILead leaddao=new ILeadImpl();
	ISubscriptions	subscriptionDao=new ISubscriptionsImpl();  
	    
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			/*List<Locations> cities=leaddao.getAllCities();*/
			/*List<Locations> LocationList=leaddao.getAllLocations();*/
			List<Services> serviceList=leaddao.getAllServices();
			
			request.setAttribute("serviceList", serviceList);
			request.setAttribute("budgetRanges", leaddao.getBudgetRanges());
			/*request.setAttribute("LocationList", LocationList);*/
			/*request.setAttribute("cities", cities);*/
			
			
			
			RequestDispatcher rd=request.getRequestDispatcher("leadRegister.jsp");
			
			rd.forward(request, response);
		}
		
		
		
		
	}