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

@WebServlet("/CreateContractor")
public class CreateContractor extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	IUser userDao=new IUserImpl();
	Contractor contractor=new Contractor();
	RequestDispatcher rd=null;
	ILead leaddao=new ILeadImpl();
	int result=0;
	ISubscriptions subscriptionDao=new ISubscriptionsImpl(); 
	int count=0;
	 String contractorEmail;
	public CreateContractor() {
       
    }

	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		rd=request.getRequestDispatcher("ContractorAction");
		 rd.forward(request, response);
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 int contractorId=userDao.getNextContractorId();
	    
		 String contractorName=request.getParameter("contractorName");
		 contractorEmail=request.getParameter("contractorEmail").trim().toLowerCase();
		 long contractorMobileNumber=Long.parseLong(request.getParameter("contractorMobileNumber"));
		 String contractorCompany=request.getParameter("contractorCompany");
		 int contractorSubscription=Integer.parseInt(request.getParameter("contractorSubscription"));
         String contractorPassword=request.getParameter("contractorPassword");
         String contractorAddress=request.getParameter("address");
         System.out.println("contractorEmail="+contractorEmail);
         
         if(userDao.validateContractorEmail(contractorEmail)){
        	 
         contractor.setContractorName(contractorName);
         contractor.setContractorEmail(contractorEmail);
         contractor.setContractorMobileNumber(contractorMobileNumber);
         contractor.setContractorCompany(contractorCompany);
		 contractor.setSubscriptionId(contractorSubscription);
		 contractor.setPassword(contractorPassword);
		 contractor.setContractorAddress(contractorAddress);
		 
		 java.sql.Date contractorRegDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
		 contractor.setContractorRegDate(contractorRegDate);
		 
         System.out.println("default_subscription_id="+subscriptionDao.getDefaultSubscriptionId());
		 contractor.setPreviousSubscription(subscriptionDao.getDefaultSubscriptionId());
		 
		 
		String res=userDao.saveContractor(contractor);
			 
		if(res.equalsIgnoreCase("success")){
			
		String[] contractorServices=request.getParameterValues("contractorServices") ;
		 
		List<Integer> contractorServicesIds =new ArrayList<>();
		 
		 for(String service:contractorServices){
				
			 contractorServicesIds.add(Integer.parseInt(service));
				
			}
		 
		
		 result=userDao.saveContractorServices(contractorId, contractorServicesIds);
		
		 
		 //For Location
		 if(result>0){
		 String[] cityPostals=request.getParameterValues("contractorLocations");
		 
		 
		 List<String> contractorLocations=new ArrayList<>();
		 
		 
		 for (String city : cityPostals) {
			
			 /*String array[]=string.split(":");*/
			 
			 
			 
			/* System.out.println(array[0]+":"+array[1]);
			 */
			 
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
				
			 /*System.out.println(location);*/
			 contractorLocationsIds.add(Integer.parseInt(location));
				
			}
		 
		 
		 
		 result=userDao.saveContractorLocations(contractorId, contractorLocationsIds);
		 
		 if(result>0){
			 
			    /* ContractorLimits conLimit=new ContractorLimits();
		    	
		    	Subscriptions sub=subscriptionDao.getSubscriptionById(contractorSubscription);
		    	
		    	conLimit.setContractorId(contractorId);
		    	conLimit.setRenoLeadLimit(Integer.parseInt(sub.getRenoLeadLimit()));
		    	conLimit.setPurchaseLeadLimit(Integer.parseInt(sub.getPurchaseLeadLimit()));
		    	conLimit.setCreateLeadLimit(Integer.parseInt(sub.getCreateLeadLimit()));
		    	conLimit.setCreateEmployeeLimit(Integer.parseInt(sub.getCreateEmployeeLimit()));
		    	conLimit.setCreateSubConLimit(Integer.parseInt(sub.getCreateSubConLimit()));
		    	
		    	result=userDao.addContractorLimits(conLimit);*/
			 SubscriptionTransaction transaction=new SubscriptionTransaction();
		    	
		    	transaction.setContractorId(contractorId);
		    	transaction.setTransaction_time(TimestampGenerator.getTimestamp());
		    	
		    	//get current  sql date
		    	java.sql.Date subscription_start_date=new java.sql.Date(Calendar.getInstance().getTimeInMillis());
				
				Calendar c = Calendar.getInstance();
				c.setTime(new Date()); // Now use today date.
				c.add(Calendar.DATE,30); // Adding 5 days
				
				//get next+30 sql date
		       java.sql.Date subscription_end_date=new java.sql.Date(c.getTimeInMillis());
				
				
				
		    	transaction.setSubscription_start_date(subscription_start_date);
		    	transaction.setSubscription_end_date(subscription_end_date);
		    	
		    	result=subscriptionDao.addNewSubscriptionTransaction(transaction);
		    	
		    	 	
		    	Subscriptions sub=subscriptionDao.getSubscriptionById(contractorSubscription);
		    	
		    	
		    	
		    	   /*  if(!sub.getRenoLeadLimit().equals("Unlimited") &&
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
		    	
		    	result=userDao.addContractorLimits(conLimit);
		    	
		    /*	}*/
			 
		    	if(result>0){
			 
		    		String to=contractorEmail;
					String subject="RenoReferral:Registration Success";
					String msg=" Welcome to RenoReferral.\n Thank You for registering with us .\nYour password is:"+contractorPassword+"\n"
							+ " Your Referrance no. is "+contractorId+"\n Please note down fo further queries.\n Fill free to contact us at renoreferral@gmail.com";
					
					Mailer2.send(to, subject, msg);
		    		
		    		
		    		
			 
			    response.sendRedirect("UserAction?action=show&result=success"); 
			 
		 }else{
			 
			 response.sendRedirect("UserAction?action=show&result=error"); 
			 
			 }
		 }
		 else{
			 response.sendRedirect("UserAction?action=show&result=error"); 
		 }
		 
		 }else{
			 response.sendRedirect("UserAction?action=show&result=error"); 
		 } 
		 }else{
			 response.sendRedirect("UserAction?action=show&result=error"); 
		 } 
		 
         }else{
        	 
        	 response.sendRedirect("ContractorAction?result=emailAlreadyRegistered"); 
/*        	 request.setAttribute("ErrorMessage", "Email already registered");
        	 
        	 rd=request.getRequestDispatcher("createContractor.jsp");
    		 rd.forward(request, response);*/
        	 
         }
		 
		/*request.setAttribute("msg", message);
		 
		 rd=request.getRequestDispatcher("ContractorAction");
		 
		 
		 rd.forward(request, response);*/
		 
		 
		
		 
	/*	
		 System.out.println("contractorName="+contractorName);
		 System.out.println("contractorEmail="+contractorEmail);
		 System.out.println("contractorMobileNumber="+contractorMobileNumber);
		 System.out.println("contractorCompany="+contractorCompany);
		 for(String abc:contractorServices){
				
				System.out.println("contractorServices="+abc);
				
			}
		 
		 for(String abc2:contractorLocations){
				
				System.out.println("contractorLocations="+abc2);
				
			}
		 
		 
		 System.out.println("contractorSubscription="+contractorSubscription);
		 System.out.println("contractorPassword="+contractorPassword);
			*/
		
	}

}
