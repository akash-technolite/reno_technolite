package com.tlite.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.estimator.IEstimator;
import com.dao.estimator.IEstimatorImpl;
import com.dao.installer.IInstaller;
import com.dao.installer.IInstallerImpl;
import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.Employee;


@WebServlet("/InstallerController")
public class InstallerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IInstaller instDao= new IInstallerImpl();
	RequestDispatcher rd=null;
	 int res=0;
	 	IContractor contractorDao=new IContractorImpl();
	 ISubscriptions subdao=new ISubscriptionsImpl();
	 String PATH="";
	 ILead leaddao=new ILeadImpl();
	 IEstimator estimatorDao=new IEstimatorImpl();
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*Employee emp=(Employee)request.getSession(false).getAttribute("emp");*/
		
		/*int contractor_id=emp.getContractor_id();
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
		    	
		    request.setAttribute("workStartedLeads", instDao.getInstallerWorkStartedLeads(contractor_id,employee_id));
			request.setAttribute("workCompledLeads", instDao.getInstallerWorkCompletedLeads(contractor_id,employee_id));
			
			
		    rd=request.getRequestDispatcher("installerLeads.jsp");
				
				rd.forward(request, response);
		    	
		    	
		    }else if(action.equalsIgnoreCase("showAllDocuments")){
	  			   
	  			   
				request.setAttribute("documentlist", instDao.getAllInstallerDocuments(contractor_id,employee_id));
				
				rd=request.getRequestDispatcher("installerDocuments.jsp");
				
				rd.forward(request, response);
				
	         }else if(action.equalsIgnoreCase("showAllStores")){
				   
				   
	     		request.setAttribute("storeslist", estimatorDao.getAllStores(contractor_id,employee_id));
	     		
	     		rd=request.getRequestDispatcher("installerStores.jsp");
	     		
	     		rd.forward(request, response);
	     		
	           }else if(action.equalsIgnoreCase("installerComplaints")){
				   
	        		request.setAttribute("assignedComplaints",instDao.getAllInstallerComplaints(contractor_id,employee_id));
		         	request.setAttribute("workingComplaints",instDao.getAllInstallerWorkingComplaints(contractor_id,employee_id));
		         	request.setAttribute("closedComplaints",instDao.getAllInstallerClosedComplaints(contractor_id,employee_id));
		     		
		     		
		     		rd=request.getRequestDispatcher("installerComplaints.jsp");
		     		
		     		rd.forward(request, response);
		     		
		           }else  if(action.equalsIgnoreCase("installerleadNotes")){
		       		
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
		       				request.setAttribute("notesList",instDao.getInstallerLeadNotesById(leadId,contractor_id));
		       				
		       				PATH="contractorLeadNotes.jsp";
		       				
		       				rd=request.getRequestDispatcher(PATH);
		       				rd.forward(request, response);
		       				
		       		}
		    
		    
		    /*else if(action.equalsIgnoreCase("estimatorComplaints"))
			{
				
				request.setAttribute("leadList",estimatorDao.getAllEstimatorLeads(contractor_id,employee_id));
				
				
				PATH="estimatorComplaints.jsp";
				
				rd=request.getRequestDispatcher(PATH);
				rd.forward(request, response);
				 
			}
		    */
		    
		   }
		
	}

	
	     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	
	    	
		     
		
		     String action=request.getParameter("action");
     	
		
		       if(action.equalsIgnoreCase("login")){ 
			 
			  String email=request.getParameter("email");
			  String password=request.getParameter("password");
			 
			    if(instDao.validate(email,password)){  
			      
			    	HttpSession session= request.getSession(true);
			    	
			    	
				  Employee emp=estimatorDao.getEmployeeDetails(email); 
				  session.setAttribute("empId",emp.getEmployee_id());
				  session.setAttribute("employee_name",emp.getEmployee_name());
				  session.setAttribute("emp",emp);
				  session.setAttribute("user","installer");
				 /* Contractor  contractor=contractorDao.getContractorById(emp.getContractor_id());*/
					
					/*request.setAttribute("user","contractor");
					session.setAttribute("user","contractor");*/
					/*session.setAttribute("contractor",contractor=contractorDao.getContractorByEmail(email));*/
				     session.setAttribute("userId",emp.getContractor_id());
					/*session.setAttribute("username",emp.getEmployee_name());*/
					/*session.setAttribute("conSub",subdao.getSubscriptionById(contractor.getSubscriptionId()));
				   */
					  
				/*	rd=request.getRequestDispatcher("installerDashboard.jsp");
					
					rd.forward(request, response);	*/
				    
				    response.sendRedirect("InstallerController?action=showLeads");
			    }  
			    else{  
			     
			    	request.setAttribute("msg", "Invalid Username or Password");
			          
			    	   rd=request.getRequestDispatcher("installerLogin.jsp");
						
						rd.forward(request, response);	
			    }  
			 
			 
		 }else  if(action.equalsIgnoreCase("showComplaints")){
	        	
			      HttpSession session= request.getSession(false);
			 
	        	int leadId=Integer.parseInt(request.getParameter("lead_id"));
	        	/*Employee emp=(Employee)request.getSession(false).getAttribute("emp");*/
	        	
	    		int contractorId=(int) session.getAttribute("userId");
	    		int employee_id=(int) session.getAttribute("empId");
	        	
	    		System.out.println("Employee_Id="+employee_id);
	    		
	    		if(instDao.validateInstallerLead(leadId,contractorId,employee_id)){
	    			
	         	request.setAttribute("assignedComplaints",instDao.getAllInstallerComplaintsById(leadId, contractorId,employee_id));
	         	request.setAttribute("workingComplaints",instDao.getAllInstallerWorkingComplaintsById(leadId, contractorId,employee_id));
	         	request.setAttribute("closedComplaints",instDao.getAllInstallerClosedComplaintsById(leadId, contractorId,employee_id));
	        	request.setAttribute("lead",leaddao.getLeadDetails(leadId));
	        	rd=request.getRequestDispatcher("installerLeadComplaints.jsp");
				
				rd.forward(request, response);
				
	    		}else{
	        		
	        		request.setAttribute("ErrorMessage", "Please enter valid referrence number");
	        		PATH="installerComplaints.jsp";
					
					rd=request.getRequestDispatcher(PATH);
					rd.forward(request, response);
	        	}
		
	}else  if(action.equalsIgnoreCase("installerleadNotes")){
		
		int leadId=Integer.parseInt(request.getParameter("lead_id"));
		
		  HttpSession session= request.getSession(false);
			 
      	int contractor_id=(int) session.getAttribute("userId");
  		int employee_id=(int) session.getAttribute("empId");
		
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
				request.setAttribute("notesList",instDao.getInstallerLeadNotesById(leadId,contractor_id));
				
				PATH="contractorLeadNotes.jsp";
				
				rd=request.getRequestDispatcher(PATH);
				rd.forward(request, response);
				
		}

     	
		
		
		
	}

}
