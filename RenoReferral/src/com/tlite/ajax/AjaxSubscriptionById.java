package com.tlite.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.pojo.Subscriptions;


@WebServlet("/AjaxSubscriptionById")
public class AjaxSubscriptionById extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		 int subId=Integer.parseInt(request.getParameter("subId"));
	
		    String  json= null;
		   
		     
		    ISubscriptions subdao=new ISubscriptionsImpl();
		    Subscriptions sub=subdao.getSubscriptionById(subId);
		   
		   
		     
		     json= new Gson().toJson(sub);
		     System.out.println(json);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		    
		
		    }

}
