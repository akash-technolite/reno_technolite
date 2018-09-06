package com.tlite.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.pojo.FollowUp;

@WebServlet("/AjaxForFollowUP")
public class AjaxForFollowUP extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IContractor contratorDao=null;
	
	
       protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		contratorDao=new IContractorImpl();
		
		 int contractorId=Integer.parseInt(request.getParameter("contractorId"));
		
		 
		 int  leadId=Integer.parseInt(request.getParameter("leadId"));
		 
		
		/* List<FollowUp> followList=contratorDao.getAllFollowUpByLead(leadId, contractorId);*/
		 List<FollowUp> todayFollowList=contratorDao.getTodaysFollowUp(leadId, contractorId);
		 List<FollowUp> pastFollowList=contratorDao.getPastFollowUp(leadId, contractorId);
		 List<FollowUp> upfollowList=contratorDao.getUpcomingFollowUp(leadId, contractorId);
		 
		/* Object[] followList={todayFollowList,pastFollowList,upfollowList};*/
		 
		 List<List<FollowUp>> followList = new ArrayList<List<FollowUp>>();
		 
		 followList.add(todayFollowList);
		 followList.add(pastFollowList);
		 followList.add(upfollowList);
		 
		 String  json= new Gson().toJson(followList);
		 
		     /*System.out.println(json);*/
		     
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		    
		
		    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
