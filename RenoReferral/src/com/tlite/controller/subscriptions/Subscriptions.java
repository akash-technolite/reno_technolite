package com.tlite.controller.subscriptions;

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
import com.tlite.utility.TimestampGenerator;

@WebServlet("/Subscriptions")
public class Subscriptions extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ISubscriptions subDao=new ISubscriptionsImpl(); 
    int result=0;
    RequestDispatcher rd=null;
    IUser userDao=new IUserImpl();
    IContractor contractorDao=new IContractorImpl();  
    int	res=0;
    public Subscriptions() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String result=request.getParameter("result");
     	
		   if(result!=null){
			    	     
    			if(result.equals("subscriptionQueued")){
    				
    				request.setAttribute("SuccessMessage", "Subscription Added To Queue! Will  take effect after current ended");
    				
    			}else if(result.equals("subscriptionNotQueued")){
    				
    				request.setAttribute("ErrorMessage", "Subscription Not Queued");
    				
    			}else if(result.equals("subscriptionRenewed")){
    				
    				
    				
    				
    				
    				
    				request.setAttribute("SuccessMessage", "Subscription Renewed Successfully!");
    				
    			}else if(result.equals("subscriptionNotRenewed")){
    				
    				request.setAttribute("ErrorMessage", "Subscription Not Renewed!");
    				
    			}
    			 
    			
    			
    			    rd=request.getRequestDispatcher("/contractorDashboard.jsp");
	    			
	    			rd.forward(request, response);
    			
		   }else{
			   
			   response.sendRedirect("SubscriptionAction");  
		   }
		   
		   
		   
		   
		   
		   
		   
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("makePrivate")){
			
	   int subscription_id=Integer.parseInt(request.getParameter("subscription_id"));
	  
	  
	   result=subDao.makePrivate(subscription_id);
	  
	   if(result>0){
		   
		  response.sendRedirect("SubscriptionAction?result=makePrivateSuccess"); 
	   }else{
		   
		   response.sendRedirect("SubscriptionAction?result=makePrivateFailed");  
	   }
	   
		}else if(action.equalsIgnoreCase("disable")){
			
			   int subscription_id=Integer.parseInt(request.getParameter("subscription_id"));
			  
			  
			   result=subDao.disableSubscription(subscription_id);
			  
			   if(result>0){
				   
				  response.sendRedirect("SubscriptionAction?result=disableSuccess"); 
			   }else{
				   
				   response.sendRedirect("SubscriptionAction?result=disableFailed");  
			   }
			   
				}else if(action.equalsIgnoreCase("makePublic")){
					
		    	   int subscription_id=Integer.parseInt(request.getParameter("subscription_id"));
		    	  
		    	  
		    	   result=subDao.makePublic(subscription_id);
		    	  
		    	   if(result>0){
		    		   
		    		  response.sendRedirect("SubscriptionAction?result=makePublicSuccess"); 
		    	   }else{
		    		   
		    		   response.sendRedirect("SubscriptionAction?result=makePublicFailed");  
		    	   }
		    	   
		    		}else  if(action.equalsIgnoreCase("renewalPage")){
		    			
		    			HttpSession session=request.getSession(false);
		    			
		    			Contractor contractor=(Contractor) session.getAttribute("contractor");
		    			com.tlite.pojo.Subscriptions contractorSub=(com.tlite.pojo.Subscriptions) session.getAttribute("conSub");
		    			

		    			com.tlite.pojo.Subscriptions selectedSubscription=subDao.getDefaultSubscription();
		    			
		    			
		    				request.setAttribute("current_subscription", contractorSub);
			    			
			    			request.setAttribute("subscriptions",subDao.getAllSubscription());
		    				
			    			request.setAttribute("previous_subscription",subDao.getSubscriptionById(contractor.getPreviousSubscription()));
		    			
		    			 rd=request.getRequestDispatcher("subscriptionRenewal.jsp");
		    			
		    			rd.forward(request, response);
		    				
		    			
		    			
		    			
		    			}else  if(action.equalsIgnoreCase("renewal")){
		    				
		    				
		    			
		    			HttpSession session=request.getSession(false);
			    			
			    	int contractorId=(int) session.getAttribute("userId");
			    			
		    			int subscription_id=Integer.parseInt(request.getParameter("subscription_id"));	
		    	        
		    			int pre_sub_id=Integer.parseInt(request.getParameter("previous"));	
		    			
		    			int remaining_days=subDao.getSubscriptionRemainingDays(contractorId);
		    			
		    			com.tlite.pojo.Subscriptions selectedSubscription=subDao.getSubscriptionById(subscription_id);
		    			
		    			
		    			
		    			
		    			  if(0 <= remaining_days){
		    				  
		    				  
		    				  
		    				  
		    				  SubscriptionQueue queue=new SubscriptionQueue();
		    				  
		    				  queue.setContractorId(contractorId);
		    				  queue.setSubscriptionId(subscription_id);
		    				  queue.setPreviousSubId(pre_sub_id);
		    				  
		   				   res=subDao.addNewSubscriptionQueue(queue);
		   				
		   				   
		   				if(res>0){
		   					
		   					    session.removeAttribute("subAlert");
						        session.removeAttribute("subExpired");
						        
		   					response.sendRedirect("Subscriptions?result=subscriptionQueued");
		   				}else{
		   					
		   					response.sendRedirect("Subscriptions?result=subscriptionNotQueued");
		   				}
		   				   
		   				   
		   				  }else if(remaining_days<0){
		   				 
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
					    	
					    	 res=subDao.addNewSubscriptionTransaction(transaction);
		   				   
		   					 res=contractorDao.changeContractorSubscription(contractorId,subscription_id,pre_sub_id);
		   				 
		   					   if(res>0){
		   						
		   						 if(!selectedSubscription.getRenoLeadLimit().equals("Unlimited") &&
		   					    			!selectedSubscription.getPurchaseLeadLimit().equals("Unlimited") &&
		   					    			!selectedSubscription.getCreateLeadLimit().equals("Unlimited") &&
		   					    			!selectedSubscription.getCreateEmployeeLimit().equals("Unlimited") &&
		   					    			!selectedSubscription.getCreateSubConLimit().equals("Unlimited")){
		   					    		
		   					       ContractorLimits conLimit=new ContractorLimits();
		   					    	    	 
		   					    	conLimit.setContractorId(contractorId);	
		   					    	conLimit.setRenoLeadLimit(Integer.parseInt(selectedSubscription.getRenoLeadLimit()));
		   					    	conLimit.setPurchaseLeadLimit(Integer.parseInt(selectedSubscription.getPurchaseLeadLimit()));
		   					    	conLimit.setCreateLeadLimit(Integer.parseInt(selectedSubscription.getCreateLeadLimit()));
		   					    	conLimit.setCreateEmployeeLimit(Integer.parseInt(selectedSubscription.getCreateEmployeeLimit()));
		   					    	conLimit.setCreateSubConLimit(Integer.parseInt(selectedSubscription.getCreateSubConLimit()));
		   					    	
		   					    	res=userDao.renewSubscription(conLimit);
		   					    	
		   					    	}
		   						 
		   						      if(res>0){
		   							
		   							
		   							        session.removeAttribute("subAlert");
		   							        session.removeAttribute("subExpired");
		   		    						session.setAttribute("conSub",subDao.getSubscriptionById(subscription_id));
		   		    						session.setAttribute("conLimit",contractorDao.getContractorLimits(contractorId));
		   		    						
		   		    						
		   							
				   					response.sendRedirect("Subscriptions?result=subscriptionRenewed");
				   				}else{
				   					
				   					response.sendRedirect("Subscriptions?result=subscriptionRenewed");
				   				}
				   				   
		   					  
		   			      }
		    			
		    			
		    			
		    			
		    		}
		
		
	}

}
	
}
