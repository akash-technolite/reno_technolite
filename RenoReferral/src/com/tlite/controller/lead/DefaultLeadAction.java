package com.tlite.controller.lead;

import java.io.IOException;
import java.util.ArrayList;
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
import com.tlite.pojo.DefaultLeadSetting;
import com.tlite.pojo.DefaultLeadSubscriptions;
import com.tlite.pojo.Subscriptions;


@WebServlet("/DefaultLeadAction")
public class DefaultLeadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ISubscriptions subscriptionDao=null; 
	RequestDispatcher rd=null;
	
	ILead leaddao=new ILeadImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		subscriptionDao=new ISubscriptionsImpl();  
		
		List<Subscriptions> subscriptionsList=subscriptionDao.getAllTotalSubscriptionForDefaulLeadAction();
		
		List<DefaultLeadSetting> DefaultLeadSetting=leaddao.getDeafaultLeadSetting();
		
		List<DefaultLeadSubscriptions> defaultSub=subscriptionDao.getAllDefaultSubscription();
		
	      List<Integer> defaulSubIds= new ArrayList<>();
	  
		for (DefaultLeadSubscriptions defaultLeadSubscriptions : defaultSub) {
			
			defaulSubIds.add(defaultLeadSubscriptions.getSubscriptionId());
		}
		
		
		request.setAttribute("subscriptionsList", subscriptionsList);
		request.setAttribute("defaultLeadSetting", DefaultLeadSetting);
		request.setAttribute("defaulSubIds", defaulSubIds);
		
       rd=request.getRequestDispatcher("defaultLeadSetting.jsp");
		
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
