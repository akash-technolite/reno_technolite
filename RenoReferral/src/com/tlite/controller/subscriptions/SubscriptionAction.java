package com.tlite.controller.subscriptions;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.pojo.Subscriptions;


@WebServlet("/SubscriptionAction")
public class SubscriptionAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ISubscriptions subDao=new ISubscriptionsImpl();
	RequestDispatcher rd=null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List<Subscriptions> subList=subDao.getAllSubscription();
		
		request.setAttribute("subscriptionsList", subList);
		request.setAttribute("subscriptionPrivate",subDao.getAllSubscriptionPrivate() );
		rd=request.getRequestDispatcher("adminSubscriptions.jsp");
		rd.forward(request, response);
		
		
		
		
	}

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    	if(request.getParameter("result")!=null){
			if(request.getParameter("result").equals("success")){
				request.setAttribute("SuccessMessage", "Subscription Added");
				
			}else if(request.getParameter("result").equals("error")){
				request.setAttribute("ErrorMessage", "Subscription Not Added");
			}else if(request.getParameter("result").equals("makePrivateSuccess")){
				request.setAttribute("SuccessMessage", "Moved to Private");
			}else if(request.getParameter("result").equals("makePrivateFailed")){
				request.setAttribute("ErrorMessage", "Moving Failed");
			}else if(request.getParameter("result").equals("disableSuccess")){
				request.setAttribute("SuccessMessage", "Deleted Successfully");
			}else if(request.getParameter("result").equals("disableFailed")){
				request.setAttribute("ErrorMessage", "Deleting Failed");
			}else if(request.getParameter("result").equals("makePublicSuccess")){
				request.setAttribute("SuccessMessage", "Moved to Public");
			}else if(request.getParameter("result").equals("makePublicFailed")){
				request.setAttribute("ErrorMessage", "Moving Failed");
			}else if(request.getParameter("result").equals("defaultUpdated")){
				request.setAttribute("SuccessMessage", "Default Subscription Updated");
			}else if(request.getParameter("result").equals("defaultNotUpdated")){
				request.setAttribute("ErrorMessage", "Default Subscription Not Updated");
			}
			}
		
		
		
	    	List<Subscriptions> subList=subDao.getAllSubscription();
			
			request.setAttribute("subscriptionsList", subList);
			request.setAttribute("subscriptionPrivate",subDao.getAllSubscriptionPrivate() );
			request.setAttribute("defaultSub",subDao.getDefaultSubscription());
			
			rd=request.getRequestDispatcher("adminSubscriptions.jsp");
			rd.forward(request, response);
			
	
	
	}
	
	
	
	
}
