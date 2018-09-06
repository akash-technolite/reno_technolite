package com.tlite.controller.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.estimator.IEstimator;
import com.dao.estimator.IEstimatorImpl;
import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.Employee;
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;

@WebServlet("/EstimatorController")
public class EstimatorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 RequestDispatcher rd=null;
	 int res=0;
	 IEstimator estimatorDao=new IEstimatorImpl();
	 IContractor contractorDao=new IContractorImpl();
	 ISubscriptions subdao=new ISubscriptionsImpl();
	 String PATH="";
	 ILead leaddao=new ILeadImpl();
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
	       /*	HttpSession session=request.getSession(false);
		
	    	Employee emp=(Employee) session.getAttribute("emp");
			
			System.out.println(session.getAttribute("emp").toString());
			
			int contractor_id=emp.getContractor_id();
			int employee_id=emp.getEmployee_id();*/
			
			
			
			HttpSession session= request.getSession(false);
			int contractor_id=(int) session.getAttribute("userId");
			int employee_id=(int) session.getAttribute("empId");
			
			String action=request.getParameter("action");
			String result=request.getParameter("result");

			  
			    if(action!=null){
				 
			    if(result!=null){
			
				if(result.equals("loginSuccess")){
					
					PATH="estimatorDashboard.jsp";
					
					
				}else if(result.equals("loginFailed")){
					
					request.setAttribute("msg", "Invalid Username or Password");
					
					PATH="estimatorLogin.jsp";
					
				}
				}
			    
			    
			    if(action.equalsIgnoreCase("estimatorLogin")){ 

			 
				 
				    rd=request.getRequestDispatcher(PATH);
					
					rd.forward(request, response);	
			    
			    }else if(action.equalsIgnoreCase("showLeads")){
			    	
			    	
			    	
			   request.setAttribute("asssignedList", estimatorDao.getLeadsByEstimator(contractor_id,employee_id));
			   request.setAttribute("consultedList", estimatorDao.getConsultedLeadList(contractor_id,employee_id));
				request.setAttribute("quotedList", estimatorDao.getQuotedLeadList(contractor_id,employee_id));
				request.setAttribute("soldLeads", estimatorDao.getContractorSoldLeads(contractor_id,employee_id));
				request.setAttribute("workStartedLeads", estimatorDao.getEstimatorWorkStartedLeads(contractor_id,employee_id));
				request.setAttribute("workCompledLeads", estimatorDao.getEstimatorWorkCompletedLeads(contractor_id,employee_id));
			    request.setAttribute("invoicedLeads", estimatorDao.getEstimatorInvoicedLeads(contractor_id,employee_id));
				request.setAttribute("closedLeads", estimatorDao.getEstimatorClosedLeads(contractor_id,employee_id));
				request.setAttribute("cancledLeads", estimatorDao.getEstimatorCancledLeads(contractor_id,employee_id));
				    rd=request.getRequestDispatcher("estimatorLeads.jsp");
					
					rd.forward(request, response);
			    	
			    	
			    }else if(action.equalsIgnoreCase("estimatorComplaints"))
				{
					
					/*request.setAttribute("leadList",estimatorDao.getAllEstimatorLeads(contractor_id,employee_id));*/
					
			    	request.setAttribute("assignedComplaints",estimatorDao.getAllestimatorComplaints(contractor_id,employee_id));
		         	request.setAttribute("workingComplaints",estimatorDao.getAllestimatorWorkingComplaints(contractor_id,employee_id));
		         	request.setAttribute("closedComplaints",estimatorDao.getAllestimatorClosedComplaints(contractor_id,employee_id));
					
					PATH="estimatorComplaints.jsp";
					
					rd=request.getRequestDispatcher(PATH);
					rd.forward(request, response);
					 
				}else if(action.equalsIgnoreCase("showAllDocuments")){
				   
				   
				request.setAttribute("documentlist", estimatorDao.getAllEstimatorDocuments(contractor_id,employee_id));
				
				rd=request.getRequestDispatcher("estimatorDocuments.jsp");
				
				rd.forward(request, response);
				
			 }else if(action.equalsIgnoreCase("showAllStores")){
				   
				   
			request.setAttribute("storeslist", estimatorDao.getAllStores(contractor_id,employee_id));
			
			rd=request.getRequestDispatcher("estimatorStores.jsp");
			
			rd.forward(request, response);
			
     }else  if(action.equalsIgnoreCase("estimatorleadNotes")){
			
			int leadId=Integer.parseInt(request.getParameter("lead_id"));
			
			
			
			       if(request.getParameter("result")!=null){
			    	 
					if(request.getParameter("result").equals("noteDeleted")){
						request.setAttribute("SuccessMessage", "Note Deleted");
					}else if(request.getParameter("result").equals("noteNotDeleted")){
						request.setAttribute("ErrorMessage", "Delete Failed");
					}else if(request.getParameter("result").equals("noteCreated")){
						request.setAttribute("SuccessMessage", "Note Created");
					}else if(request.getParameter("result").equals("noteNotCreated")){
						request.setAttribute("ErrorMessage", "Note Creation Failed");
					}
					}
				     
			        request.setAttribute("contractor_id",contractor_id);
			        request.setAttribute("employee_id",employee_id);
					request.setAttribute("lead",leaddao.getLeadDetails(leadId));
					/*request.setAttribute("notesList",estimatorDao.getEstimatorLeadNotes(leadId,contractorId,employee_id));*/
					request.setAttribute("notesList",contractorDao.getLeadNotesById(leadId,contractor_id));
					
					PATH="contractorLeadNotes.jsp";
					
					rd=request.getRequestDispatcher(PATH);
					rd.forward(request, response);
					
			}
			    
			    
			   }
		
	}

	
	     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
		     
		
		     String action=request.getParameter("action");
     	
		
		       if(action.equalsIgnoreCase("login")){ 
			 
			  String email=request.getParameter("email");
			  String password=request.getParameter("password");
			 
			    if(estimatorDao.validate(email,password)){  
			      
			    	HttpSession session= request.getSession(true);
				   
				  Employee emp=estimatorDao.getEmployeeDetails(email); 
				  
				  session.setAttribute("empId",emp.getEmployee_id());
				  session.setAttribute("employee_name",emp.getEmployee_name());
				  session.setAttribute("emp",emp);
				  session.setAttribute("user","estimator");
				  session.setAttribute("userId",emp.getContractor_id());
				 /* Contractor  contractor=contractorDao.getContractorById(emp.getContractor_id());*/
					
					/*request.setAttribute("user","contractor");
					session.setAttribute("user","contractor");*/
					/*session.setAttribute("contractor",contractor=contractorDao.getContractorByEmail(email));*/
				  /*session.setAttribute("userId",contractor.getContractorId());*/
					/*session.setAttribute("username",emp.getEmployee_name());*/
					/*session.setAttribute("conSub",subdao.getSubscriptionById(contractor.getSubscriptionId()));
				   */
					response.sendRedirect("EstimatorController?action=showLeads");
			    }  
			    else{  
			     
			    	request.setAttribute("msg", "Invalid Username or Password");
			          
			    	   rd=request.getRequestDispatcher("estimatorLogin.jsp");
						
						rd.forward(request, response);	
			    }  
			 
			 
		 }else  if(action.equalsIgnoreCase("showComplaints")){
	        	
	        	int leadId=Integer.parseInt(request.getParameter("lead_id"));
	        	/*Employee emp=(Employee)request.getSession(false).getAttribute("emp");
	        	int contractorId=emp.getContractor_id();
	    		int employee_id=emp.getEmployee_id();*/
	        	
	        	HttpSession session= request.getSession(false);
				int contractorId=(int) session.getAttribute("userId");
				int employee_id=(int) session.getAttribute("empId");
	        	
	        	if(estimatorDao.validateEstimatorLead(leadId,contractorId,employee_id)){
	        	
	        	request.setAttribute("assignedComplaints",estimatorDao.getAllestimatorComplaintsById(leadId, contractorId,employee_id));
	         	request.setAttribute("workingComplaints",estimatorDao.getAllestimatorWorkingComplaintsById(leadId, contractorId,employee_id));
	         	request.setAttribute("closedComplaints",estimatorDao.getAllestimatorClosedComplaintsById(leadId, contractorId,employee_id));
	        	request.setAttribute("lead",leaddao.getLeadDetails(leadId));
	        	rd=request.getRequestDispatcher("estimatorLeadComplaints.jsp");
				
				rd.forward(request, response);
				
	        	}else{
	        		
	        		request.setAttribute("ErrorMessage", "Please enter valid referrence number");
	        		PATH="estimatorComplaints.jsp";
					
					rd=request.getRequestDispatcher(PATH);
					rd.forward(request, response);
	        	}
		
		 	}else  if(action.equalsIgnoreCase("estimatorleadNotes")){
	        	
	        	int leadId=Integer.parseInt(request.getParameter("lead_id"));
	        	/*Employee emp=(Employee)request.getSession(false).getAttribute("emp");
	        	int contractorId=emp.getContractor_id();
	    		int employee_id=emp.getEmployee_id();*/
	        	
	        	HttpSession session= request.getSession(false);
				int contractorId=(int) session.getAttribute("userId");
				int employee_id=(int) session.getAttribute("empId");
	        	
	    		    request.setAttribute("contractor_id",contractorId);
	    		    request.setAttribute("employee_id",employee_id);
					request.setAttribute("lead",leaddao.getLeadDetails(leadId));
					/*request.setAttribute("notesList",estimatorDao.getEstimatorLeadNotes(leadId,contractorId,employee_id));*/
					request.setAttribute("notesList",contractorDao.getLeadNotesById(leadId,contractorId));
				
					PATH="contractorLeadNotes.jsp";
					
					rd=request.getRequestDispatcher(PATH);
					rd.forward(request, response);
					
	        	}
		
		 	}

     	
		
		
		
	}


