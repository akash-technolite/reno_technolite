package com.tlite.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.pojo.Lead;


@WebServlet("/AjaxForContractorCount")
public class AjaxForContractorCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AjaxForContractorCount() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		 String  json= null;
		
		 ILead leadDao=new ILeadImpl();
		
		
		    int subscriptionId=Integer.parseInt(request.getParameter("subscriptionId"));
		    int serviceId=Integer.parseInt(request.getParameter("serviceId"));
			int locationId=Integer.parseInt(request.getParameter("locationId"));
			
			
			Lead lead=new Lead();
			
			
			lead.setServiceId(serviceId);
			lead.setLocationId(locationId);
			
		 int contractorCount=leadDao.getContractorsCount(subscriptionId,lead);
		 
		 
		System.out.println(contractorCount);
		json= new Gson().toJson(contractorCount);
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
		
			
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
