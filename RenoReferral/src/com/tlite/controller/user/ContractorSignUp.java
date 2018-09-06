package com.tlite.controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.mail.Mailer2;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.ContractorLimits;
import com.tlite.pojo.Locations;
import com.tlite.pojo.SubscriptionTransaction;
import com.tlite.pojo.Subscriptions;
import com.tlite.utility.TimestampGenerator;



@WebServlet("/ContractorSignUp")
public class ContractorSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       String PATH=null;
	ISubscriptions subscriptionDao=null;
	ILead leaddao=null;
	IUser userDao=new IUserImpl();
	IContractor conDao=null;
	Contractor contractor=new Contractor();
	RequestDispatcher rd=null;
	int res=0;
    public ContractorSignUp() {
    	subscriptionDao=new ISubscriptionsImpl();  
        leaddao=new ILeadImpl();
        conDao=new  IContractorImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("add")){
		request.setAttribute("serviceList", leaddao.getAllServices());
		request.setAttribute("LocationList", leaddao.getAllLocations());
		request.setAttribute("subscriptionsList", subscriptionDao.getAllSubscription());
	
		int subscriptionId=Integer.parseInt(request.getParameter("subscriptionId"));
		
		request.setAttribute("subscription",subscriptionDao.getSubscriptionById(subscriptionId));
		PATH="contractorSignUp.jsp";
		}
		
		else if(action.equalsIgnoreCase("show"))
			
		{
			request.setAttribute("contractorId", userDao.getContractorId());
			System.out.println(userDao.getContractorId());
			PATH="thankUcontractor.jsp";
		}
		
		else if(action.equalsIgnoreCase("view"))
		{
			
			String contractorEmail=request.getParameter("email").trim();
		
			System.out.println("contractorEmail="+contractorEmail);
			
			  if(userDao.validateContractorEmail(contractorEmail)){
				  
			    request.setAttribute("contractorEmail",contractorEmail);		  
				request.setAttribute("subscriptionsView", subscriptionDao.getAllSubscription());
				
				  PATH="contrctorSign.jsp";
			  
			  }else{
		        	 
		        	 
		     	  request.setAttribute("ErrorMessage", "Email already registered");
		        	 
		      	 PATH="contratactorSignUpEmail.jsp";
		        	 
		        	 
		         }
			
			
			
		}else if(action.equalsIgnoreCase("SignUpSuccess")){
			
			request.setAttribute("stripeToken", request.getParameter("stripeToken"));
			 request.setAttribute("stripeTokenType", request.getParameter("stripeTokenType"));
		     request.setAttribute("contractorId", userDao.getContractorId());
				
				PATH="thankUcontractor.jsp";
				
		}
		
		
        rd=request.getRequestDispatcher(PATH);
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String action=request.getParameter("button");
	
	if(action.equalsIgnoreCase("save"))
	{
		int contractorId=userDao.getNextContractorId();
		 String contractorName=request.getParameter("contractorName");
		 String contractorEmail=request.getParameter("contractorEmail");
		 long contractorMobileNumber=Long.parseLong(request.getParameter("contractorMobileNumber"));
		 String contractorCompany=request.getParameter("contractorCompany");
		 int contractorSubscription=Integer.parseInt(request.getParameter("contractorSubscription"));
		 String contractorAddress=request.getParameter("address");
		
		 contractor.setContractorName(contractorName);
         contractor.setContractorEmail(contractorEmail);
         contractor.setContractorMobileNumber(contractorMobileNumber);
         contractor.setContractorCompany(contractorCompany);
		 contractor.setSubscriptionId(contractorSubscription);
         contractor.setContractorAddress(contractorAddress);
		 
		 java.sql.Date contractorRegDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		 contractor.setContractorRegDate(contractorRegDate);
		 contractor.setPreviousSubscription(subscriptionDao.getDefaultSubscriptionId());
		 
			String result=userDao.saveContractorSignUp(contractor);
				 
			if(result.equals("success")){
			    	
			      
			String[] contractorServices=request.getParameterValues("contractorServices") ;
			 
			List<Integer> contractorServicesIds =new ArrayList<>();
			 
			 for(String service:contractorServices){
					
				 contractorServicesIds.add(Integer.parseInt(service));
					
				}
			 
			 
			 
			 res=userDao.saveContractorServices(contractorId, contractorServicesIds);
			 
			 if(res>0){
				 
           String[] cityPostals=request.getParameterValues("contractorLocations");
			 
			 
			 List<String> contractorLocations=new ArrayList<>();
			 
			 
			 for (String city : cityPostals) {
				
				 /*String array[]=string.split(":");*/
				 
				 
				 
				 /*System.out.println(array[0]+":"+array[1]);*/
				 
				 
					Locations loc=new Locations();
	    			loc.setCityName(city);
	    			/*loc.setLocationName(array[1].trim());*/
	    	    	
	    			String postalCodeId;
	    			
	    			int postal_code=leaddao.checkforLocation(city);
	    			
	    			if(postal_code>0){
	    				
	    				postalCodeId=String.valueOf(postal_code);
	    			 
	    			
	    			}else{
	    				
	    				postalCodeId=String.valueOf(leaddao.addNewLocation(loc));
	    		    
	    			}
	    			
	    			
	    			contractorLocations.add(postalCodeId);
			}
			 
			 
			 
			 
			 List<Integer> contractorLocationsIds =new ArrayList<>();
			 
			
			 
			 
			 for(String location:contractorLocations){
					
				 contractorLocationsIds.add(Integer.parseInt(location));
					
				}
			 
			  
			  res=userDao.saveContractorLocations(contractorId, contractorLocationsIds);
			 
			    if(res>0){
				  
			    	
			    	SubscriptionTransaction transaction=new SubscriptionTransaction();
			    	
			    	transaction.setContractorId(contractorId);
			    	transaction.setTransaction_time(TimestampGenerator.getTimestamp());
			    	
			    	//get current  sql date
			    	java.sql.Date subscription_start_date=new java.sql.Date(Calendar.getInstance().getTimeInMillis());
					
					Calendar c = Calendar.getInstance();
					c.setTime(new Date()); // Now use today date.
					c.add(Calendar.DATE,30); // Adding 30 days
					
					//get next+30 sql date
			       java.sql.Date subscription_end_date=new java.sql.Date(c.getTimeInMillis());
					
					
					
			    	transaction.setSubscription_start_date(subscription_start_date);
			    	transaction.setSubscription_end_date(subscription_end_date);
			    	
			    	res=subscriptionDao.addNewSubscriptionTransaction(transaction);
			    	
			    	 	
			    	Subscriptions sub=subscriptionDao.getSubscriptionById(contractorSubscription);
			    	
			    	
			    	
			    	    /* if(!sub.getRenoLeadLimit().equals("Unlimited") &&
			    			!sub.getPurchaseLeadLimit().equals("Unlimited") &&
			    			!sub.getCreateLeadLimit().equals("Unlimited") &&
			    			!sub.getCreateEmployeeLimit().equals("Unlimited") &&
			    			!sub.getCreateSubConLimit().equals("Unlimited")){*/
			    		
			        ContractorLimits conLimit=new ContractorLimits();
			    	    	 
			    	conLimit.setContractorId(contractorId);	
			    	conLimit.setRenoLeadLimit(Integer.parseInt(sub.getRenoLeadLimit()));
			    	conLimit.setPurchaseLeadLimit(Integer.parseInt(sub.getPurchaseLeadLimit()));
			    	conLimit.setCreateLeadLimit(Integer.parseInt(sub.getCreateLeadLimit()));
			    	conLimit.setCreateEmployeeLimit(Integer.parseInt(sub.getCreateEmployeeLimit()));
			    	conLimit.setCreateSubConLimit(Integer.parseInt(sub.getCreateSubConLimit()));
			    	
			    	res=userDao.addContractorLimits(conLimit);
			    	
			    	/*}*/
			    	
			    	
			    	 if(res>0){
			    		 
				     request.setAttribute("stripeToken", request.getParameter("stripeToken"));
					 request.setAttribute("stripeTokenType", request.getParameter("stripeTokenType"));
				     request.setAttribute("contractorId", userDao.getContractorId());
						
						/*PATH="thankUcontractor.jsp";
						rd=request.getRequestDispatcher(PATH);
						
						rd.forward(request, response); */
				     
				        String to=contractorEmail;
						String subject="RenoReferral:Registration Success";
						String msg=" Welcome to RenoReferral.\n Thank You for registering with us .\n You will receive your password within 48hrs\n"
								+ " Your Referrance no. is "+contractorId+"\n Please note down fo further queries.\n Fill free to contact us at renoreferral@gmail.com";
						
						Mailer2.send(to, subject, msg);
				     
				     
				     response.sendRedirect("ContractorSignUp?action=SignUpSuccess");  
				     
			    	 }else{
						  
						  response.sendRedirect("errorPage.jsp");  
						  
					  }
			  }else{
				  
				  response.sendRedirect("errorPage.jsp");  
				  
			  }
			  
			  
			 }else{
				 response.sendRedirect("errorPage.jsp");
			 }
			 
			  }
			    else {
			    	
			    	response.sendRedirect("errorPage.jsp");
			    }  
			 	    
			    
	}
	
	
	if(action.equalsIgnoreCase("add")){
		
		String stripeToken=request.getParameter("stripeToken");
		
		if(stripeToken!=null){
			
			
		System.out.println("stripeToken:"+request.getParameter("stripeToken"));
		System.out.println("stripeTokenType:"+request.getParameter("stripeTokenType"));
		System.out.println("stripeEmail:"+request.getParameter("stripeEmail"));
		int subscriptionId=Integer.parseInt(request.getParameter("subscriptionId"));
		
		request.setAttribute("stripeToken", request.getParameter("stripeToken"));
		request.setAttribute("stripeTokenType", request.getParameter("stripeTokenType"));
		request.setAttribute("stripeEmail", request.getParameter("stripeEmail"));
		request.setAttribute("serviceList", leaddao.getAllServices());
		request.setAttribute("LocationList", leaddao.getAllLocations());
		request.setAttribute("subscriptionsList", subscriptionDao.getAllSubscription());
	    request.setAttribute("subscription",subscriptionDao.getSubscriptionById(subscriptionId));
		PATH="contractorSignUp.jsp";
		
          rd=request.getRequestDispatcher(PATH);
		
		rd.forward(request, response);
		}
		
		else{
			
			response.sendRedirect("errorPage.jsp");
			
		}
		
	}
	
	
	
	
	
	
	
			
	}
}
