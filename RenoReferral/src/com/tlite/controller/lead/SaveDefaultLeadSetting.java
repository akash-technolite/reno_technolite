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
import com.tlite.pojo.DefaultLeadSetting;
import com.tlite.pojo.DefaultLeadSubscriptions;
import com.tlite.pojo.Subscriptions;


@WebServlet("/SaveDefaultLeadSetting")
public class SaveDefaultLeadSetting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ILead leaddao=null; 
	 RequestDispatcher rd=null;
	 String path="";
	 String result="";
    public SaveDefaultLeadSetting() {
    	leaddao=new ILeadImpl(); 
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		rd=request.getRequestDispatcher("DefaultLeadAction");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 DefaultLeadSetting defaultLead=new DefaultLeadSetting(); 
		 Subscriptions subscription=new Subscriptions();
		 DefaultLeadSubscriptions defaultSub=new DefaultLeadSubscriptions();
		 
		 
		/*int NextDefaultLeadId=leaddao.getNextDefaultLeadId();*/
		
		
		
		int timeout=Integer.parseInt(request.getParameter("timeoutLimit"));
		int maxBuyers=Integer.parseInt(request.getParameter("subscriberLimit"));
			
	  
		
	   
	   defaultLead.setTimeout(timeout);
	   defaultLead.setMaxBuyers(maxBuyers);
	   
	   leaddao.saveDeafaultLeadSetting(defaultLead);
	   
	   
	   String[] subscriptionList=request.getParameterValues("defaultSubsctriptions");
	   
	   List<Integer> subscriptionIdList=new ArrayList<>();
	   
	  
	   int id=0;
	   for (String string : subscriptionList) {
		
		    id=Integer.parseInt(string);
		   
		   
		   subscriptionIdList.add(id);
	}
	   
	   
	   for (int subscriptions : subscriptionIdList) {
		
		   System.out.println(subscriptions);
		   
	}
	   
	   
	   
	   defaultSub.setDefaultLeadSettingId(1);
	   
	   defaultSub.setSubscriptionIdList(subscriptionIdList);
	   leaddao.deleteDefaultLeadSubscriptions();
	  result=leaddao.saveDefaultLeadSubscriptions(defaultSub);
	   
	   
	   
	   
		if(result.equals("success")){
			
			request.setAttribute("SuccessMessage", "Setting Saved Successfully");
			
			path="DefaultLeadAction";
		}
		
		else{
			
      request.setAttribute("ErrorMessage", "Setting  Not Saved");
			
			path="DefaultLeadAction";
			
			
		}
		
		
		
		rd=request.getRequestDispatcher(path);
		rd.forward(request, response);
       
	   
	   
	   
	   
	   
	   
	   
	   
	   
	}

}
