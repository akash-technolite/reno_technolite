package com.tlite.controller.contractor;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.login.ILogin;
import com.dao.login.LoginImpl;
import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.ContractorLimits;
import com.tlite.pojo.SubscriptionQueue;
import com.tlite.pojo.SubscriptionTransaction;
import com.tlite.pojo.Subscriptions;
import com.tlite.utility.TimestampGenerator;

/**
 * Servlet implementation class ContractorLogin
 */
@WebServlet("/ContractorLogin")
public class ContractorLogin extends HttpServlet {
	
	IContractor contractorDao=new IContractorImpl();  

   private static final long serialVersionUID = 1L;

   RequestDispatcher rd = null;
   int res=0;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		ILogin login=new LoginImpl();
		ISubscriptions subdao=new ISubscriptionsImpl();
		IUser userDao=new IUserImpl();
		Contractor contractor=new Contractor();
		
		HttpSession session =request.getSession(true);
		
		
		contractor.setContractorEmail(email);;
		contractor.setPassword(password);
		
		 
		String result =login.ValidateContractor(contractor); 
		
		if (result.isEmpty()){
			
			result="  ";
			
		}
		
		 contractor=contractorDao.getContractorByEmail(email);
		 int contractorId=contractor.getContractorId();
		 
	  	   if (result.equals("success")) {
			
			
			
			
			Subscriptions subscription=subdao.getSubscriptionById(contractor.getSubscriptionId());
			
			int remaining_days=subdao.getSubscriptionRemainingDays(contractorId);
			
			     System.out.println("remaining_days="+remaining_days);
			
			      if(0 <= remaining_days  && remaining_days <= 10){
				 
			    	  if(subdao.checkSubscriptionQueueAvailability(contractorId)){
			    		  
				      
			    	 
			    	  }else{
			    		  
			    		 session.setAttribute("subAlert","Only <strong>"+remaining_days+"</strong> Days Remaining! Please Renew Your Subscription otherwise you will be shifted to default subscription");
			           
			    	  }
			      
			      }else if(remaining_days<0){
				 
				 
				 
				     if(subdao.checkSubscriptionQueueAvailability(contractorId)){
				    	 
				  
   				   System.out.println("Subscription Queue Available");
   				
			    	 SubscriptionQueue queue=subdao.getSubscriptionQueue(contractorId);
			    	 
			    	 Subscriptions queued_sub=subdao.getSubscriptionById(queue.getSubscriptionId());
   					 
			    	 res=contractorDao.changeContractorSubscription(contractorId,queue.getSubscriptionId(),queue.getPreviousSubId()); 
   					   
			    	 if(res>0){
   						
   						 if(!queued_sub.getRenoLeadLimit().equals("Unlimited") &&
   					    			!queued_sub.getPurchaseLeadLimit().equals("Unlimited") &&
   					    			!queued_sub.getCreateLeadLimit().equals("Unlimited") &&
   					    			!queued_sub.getCreateEmployeeLimit().equals("Unlimited") &&
   					    			!queued_sub.getCreateSubConLimit().equals("Unlimited")){
   					    		
   					       ContractorLimits conLimit=new ContractorLimits();
   					    	    	 
   					    	conLimit.setContractorId(contractorId);	
   					    	conLimit.setRenoLeadLimit(Integer.parseInt(queued_sub.getRenoLeadLimit()));
   					    	conLimit.setPurchaseLeadLimit(Integer.parseInt(queued_sub.getPurchaseLeadLimit()));
   					    	conLimit.setCreateLeadLimit(Integer.parseInt(queued_sub.getCreateLeadLimit()));
   					    	conLimit.setCreateEmployeeLimit(Integer.parseInt(queued_sub.getCreateEmployeeLimit()));
   					    	conLimit.setCreateSubConLimit(Integer.parseInt(queued_sub.getCreateSubConLimit()));
   					    	
   					    	res=userDao.renewSubscription(conLimit);
   					    	
   						 }
   						 
   						 
   					     System.out.println("Contractor  Limits  Updated");
   	   				   
   					    System.out.println("Contractor  Subscription Changed");
   						 
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
   				    	
   				    	 res=subdao.addNewSubscriptionTransaction(transaction);
   				    	 System.out.println("Contractor  Subscription Transaction Added");
   						 res=subdao.deleteSubscriptionQueue(contractorId);
   						 System.out.println("Contractor  Subscription Queue Deleted");
   						 
   						request.setAttribute("SuccessMessage", "Your Queued Subscription Applied!Now You Can GEt Full Benifits");
   					    	}
   					   
   					   
				     }else{
   					    		
				    	 System.out.println("Subscription Queue Not Available");   	
					 Subscriptions default_subscription=subdao.getDefaultSubscription();
					 
					 System.out.println("default_subscription_id="+default_subscription.getSubscriptionId());
					 System.out.println("subscription_id="+subscription.getSubscriptionId());
					 
					if(default_subscription.getSubscriptionId()!=subscription.getSubscriptionId()){ 
					 
						res=contractorDao.changeContractorSubscription(contractorId, default_subscription.getSubscriptionId(), subscription.getSubscriptionId());
						
						if(res>0){
						
						 if(!default_subscription.getRenoLeadLimit().equals("Unlimited") &&
					    			!default_subscription.getPurchaseLeadLimit().equals("Unlimited") &&
					    			!default_subscription.getCreateLeadLimit().equals("Unlimited") &&
					    			!default_subscription.getCreateEmployeeLimit().equals("Unlimited") &&
					    			!default_subscription.getCreateSubConLimit().equals("Unlimited")){
					    		
					       ContractorLimits conLimit=new ContractorLimits();
					    	    	 
					    	conLimit.setContractorId(contractorId);	
					    	conLimit.setRenoLeadLimit(Integer.parseInt(default_subscription.getRenoLeadLimit()));
					    	conLimit.setPurchaseLeadLimit(Integer.parseInt(default_subscription.getPurchaseLeadLimit()));
					    	conLimit.setCreateLeadLimit(Integer.parseInt(default_subscription.getCreateLeadLimit()));
					    	conLimit.setCreateEmployeeLimit(Integer.parseInt(default_subscription.getCreateEmployeeLimit()));
					    	conLimit.setCreateSubConLimit(Integer.parseInt(default_subscription.getCreateSubConLimit()));
					    	
					    	res=userDao.renewSubscription(conLimit);
					    	
					    	}
						 
					  
						
						 session.setAttribute("subExpired","true");
						 
						 session.setAttribute("subAlert","You are on <span style='color:blue;'><strong> DEFAULT SUBSCRIPTION!</strong></span> Please renew now to get full benifits!");
					
					  }
					  
					
					}else{
						
	                     session.setAttribute("subExpired","true");
						 
						 session.setAttribute("subAlert","You are on <span style='color:blue;'><strong> DEFAULT SUBSCRIPTION!</strong></span> Please renew now to get full benifits!");
					}
			     }
					
			     }
			
			Contractor con2=contractorDao.getContractorByEmail(email);
			request.setAttribute("user","contractor");
			session.setAttribute("user","contractor");
			session.setAttribute("contractor",con2);
			session.setAttribute("userId",contractorId);
			session.setAttribute("username",con2.getContractorName());
			session.setAttribute("conSub",subdao.getSubscriptionById(con2.getSubscriptionId()));
			session.setAttribute("conLimit",contractorDao.getContractorLimits(con2.getContractorId()));
			 
			rd = request.getRequestDispatcher("/contractorDashboard.jsp");
			
			rd.forward(request, response);
			
		   }else{
			
			request.setAttribute("msg", "Invalid Username or Password");
			
			rd = request.getRequestDispatcher("/contractorLogin.jsp");
			
			rd.forward(request, response);
		     }
		
		
		
	}
	
	
	@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		response.sendRedirect("CreateLeadAction");
		
		
		
		
		}
	
	

	}


