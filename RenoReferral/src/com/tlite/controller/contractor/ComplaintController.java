package com.tlite.controller.contractor;

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
import com.tlite.dao.contractor.IContractorComplaints;
import com.tlite.dao.contractor.IContractorComplaintsImpl;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.pojo.ContractorComplaint;
import com.tlite.pojo.Employee;
import com.tlite.utility.TimestampGenerator;

@WebServlet("/ComplaintController")
public class ComplaintController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IContractorComplaints comDao=new IContractorComplaintsImpl();
	IContractor contractorDao=new IContractorImpl();
    RequestDispatcher rd=null;
    ILead leaddao=new ILeadImpl();
    IEstimator estimatorDao=new IEstimatorImpl();
    IInstaller instDao= new IInstallerImpl();
	String result=null;
	String PATH=null;
	int count=0;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		
		
         if(action.equalsIgnoreCase("showComplaints")){
        	
        	int leadId=Integer.parseInt(request.getParameter("lead_id"));
        	
        	 if(contractorDao.validateContractorLead(leadId,contractorId)){
        		 
        	request.setAttribute("employees",contractorDao.getAllEstimators(contractorId));	
        	request.setAttribute("installers",contractorDao.getAllInstaller(contractorId));	
         	request.setAttribute("newComplaints",comDao.getAllContractorNewComplaintsById(leadId, contractorId));
         	request.setAttribute("assignedComplaints",comDao.getAllContractorAssignedComplaintsById(leadId, contractorId));
         	request.setAttribute("workingComplaints",comDao.getAllContractorWorkingComplaintsById(leadId, contractorId));
         	request.setAttribute("closedComplaints",comDao.getAllContractorClosedComplaintsById(leadId, contractorId));
        	request.setAttribute("lead",leaddao.getLeadDetails(leadId));
        	rd=request.getRequestDispatcher("contractorLeadComplaints.jsp");
			
			rd.forward(request, response);
			
        	 }else{
 				
				     request.setAttribute("ErrorMessage", "Please enter valid referrence number");
		    		rd=request.getRequestDispatcher("contractorComplaints.jsp");
					rd.forward(request, response);	
			}
		}
		
		if(action.equalsIgnoreCase("createNewComplaint")){
			
			int leadId=Integer.parseInt(request.getParameter("lead_id"));
			
			request.setAttribute("employees",contractorDao.getAllEstimators(contractorId));	
        	request.setAttribute("installers",contractorDao.getAllInstaller(contractorId));
			request.setAttribute("lead",leaddao.getLeadDetails(leadId));
            rd=request.getRequestDispatcher("addContractorComplaints.jsp");
			
			rd.forward(request, response);
		}
		
		
           if(action.equalsIgnoreCase("saveComplaint")){
			
        	int leadId=Integer.parseInt(request.getParameter("lead_id"));
   			String emp_id=request.getParameter("employee_id");
   			String inst_id=request.getParameter("installer_id");
   			System.out.println("emp_id="+emp_id);
   			System.out.println("inst_id="+inst_id);
   			String stat="new";
   			
   			int employee_id=Integer.parseInt(emp_id);
   			int installer_id=Integer.parseInt(inst_id);
   			
   			   if(employee_id>0){
   				   
   				  stat="assigned";
   				
   			   }
   			   
   				if(installer_id>0){
   					
   			    stat="assigned";
   				
   				}
   			   	
   	   			
   			
   			ContractorComplaint complaint=new ContractorComplaint();
   			complaint.setLeadID(leadId);
   			complaint.setContractorId(contractorId);
   			
   			   
   			complaint.setEmployee_id(employee_id);
   			complaint.setTimestamp(String.valueOf(TimestampGenerator.getTimestamp()));
   			complaint.setComplaint_text(request.getParameter("complaint_text"));
   			complaint.setComplaint_status(stat);
   			complaint.setInstaller_id(installer_id);
   			
   			result=comDao.saveComplaint(complaint);
   			
   			System.out.println("controller result"+result);
   			
   			   if(result.equalsIgnoreCase("success")){
   				
   				   response.sendRedirect("ComplaintController?action=showComplaints&lead_id="+leadId+"&result=saveSuccess");
   				   
   				 
   		       	}else{
   		       		
   		       	
   		       	response.sendRedirect("ComplaintController?action=showComplaints&lead_id="+leadId+"&result=saveFailed");
   		       	
   		       	}
   				
   			   
		}
           
           if(action.equalsIgnoreCase("assignComplaint")){
        	   
        	   int leadId=Integer.parseInt(request.getParameter("lead_id"));
        	   
        	   int complaint_id=Integer.parseInt(request.getParameter("complaint_id"));
        	   
        	   int employee_id=Integer.parseInt(request.getParameter("employee_id"));
        	   
        	   String int_id=request.getParameter("installer_id");
        	   
        	   int installer_id=0;
        	   
        	   if(int_id!=null){
        		   
        	   installer_id=Integer.parseInt(int_id);
        	   
        	   }
        	   
        	   result=comDao.assignComplaint(complaint_id, employee_id,installer_id);
      			
      			
        	   if(result.equalsIgnoreCase("success")){
      				
   				   response.sendRedirect("ComplaintController?action=showComplaints&lead_id="+leadId+"&result=assignSuccess");
   				   
   				 
   		       	}else{
   		       		
   		       	
   		       	response.sendRedirect("ComplaintController?action=showComplaints&lead_id="+leadId+"&result=assignFailed");
   		       	
   		       	}
        	   
        	   
      			
      			  
           }
           
           if(action.equalsIgnoreCase("moveToWorking")){
        	   
               int leadId=Integer.parseInt(request.getParameter("lead_id"));
        	   int complaint_id=Integer.parseInt(request.getParameter("complaint_id"));
        	   
        	   result=comDao.updateComplaintStatus(complaint_id,"working");
     			
     			
     			
        	   if(result.equalsIgnoreCase("success")){
     				
   				   response.sendRedirect("ComplaintController?action=showComplaints&lead_id="+leadId+"&result=moveSuccess");
   				   
   				 
   		       	}else{
   		       		
   		       	
   		       	response.sendRedirect("ComplaintController?action=showComplaints&lead_id="+leadId+"&result=moveFailed");
   		       	
   		       	}
        	   
           }
           
           if(action.equalsIgnoreCase("closeComplaint")){
        	   int leadId=Integer.parseInt(request.getParameter("lead_id"));
        	   int complaint_id=Integer.parseInt(request.getParameter("complaint_id"));
        	   
        	   result=comDao.updateComplaintStatus(complaint_id,"closed");
     			
        	   if(result.equalsIgnoreCase("success")){
     				
   				   response.sendRedirect("ComplaintController?action=showComplaints&lead_id="+leadId+"&result=closeSuccess");
   				   
   				 
   		       	}else{
   		       		
   		       	
   		       	response.sendRedirect("ComplaintController?action=showComplaints&lead_id="+leadId+"&result=closeFailed");
   		       	
   		       	}
     			
  			    
           }
           
           
           
           
           
			
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		String result=request.getParameter("result");
		
        if(action.equalsIgnoreCase("showComplaints")){
        	
        	
        	     if(result!=null){
          		
    			if(result.equals("saveSuccess")){
    				
    				request.setAttribute("SuccessMessage", "Complaint Created Successfully");
    				
    			}else if(result.equals("saveFailed")){
    				
    				request.setAttribute("ErrorMessage", "Complaint Not created");
    				
       			}else if(result.equals("assignSuccess")){
    				
       				request.setAttribute("SuccessMessage", "Complaint assigned successfully");
    				
       			}else if(result.equals("assignFailed")){
    				
       				request.setAttribute("ErrorMessage", "Complaint not assigned");
       				
       			}else if(result.equals("moveSuccess")){
    				
       				request.setAttribute("SuccessMessage", "Complaint marked as working");
       				
       			}else if(result.equals("moveFailed")){
    				
       				request.setAttribute("ErrorMessage", "Complaint not marked");
       				
       			}else if(result.equals("closeSuccess")){
    				
       				request.setAttribute("SuccessMessage", "Complaint closed successfully");
       				
       			}else if(result.equals("closeFailed")){
    				
       				request.setAttribute("ErrorMessage", "Complaint not closed");
       			}
    			
    			
        	    }
    			
        	     String user=(String) request.getSession(false).getAttribute("user");
        	      
        	     if(user.equals("contractor")){
 					
        	    	 int leadId=Integer.parseInt(request.getParameter("lead_id"));
        	    	 
        	    	    request.setAttribute("employees",contractorDao.getAllEstimators(contractorId));	
        	        	request.setAttribute("installers",contractorDao.getAllInstaller(contractorId));
        	         	request.setAttribute("newComplaints",comDao.getAllContractorNewComplaintsById(leadId, contractorId));
        	         	request.setAttribute("assignedComplaints",comDao.getAllContractorAssignedComplaintsById(leadId, contractorId));
        	         	request.setAttribute("workingComplaints",comDao.getAllContractorWorkingComplaintsById(leadId, contractorId));
        	         	request.setAttribute("closedComplaints",comDao.getAllContractorClosedComplaintsById(leadId, contractorId));
        	        	request.setAttribute("lead",leaddao.getLeadDetails(leadId));
        	        	rd=request.getRequestDispatcher("contractorLeadComplaints.jsp");
        	        	rd.forward(request, response);
 					
 				}else if(user.equals("estimator")){
 					
 					int leadId=Integer.parseInt(request.getParameter("lead_id"));
 		        	Employee emp=(Employee)request.getSession(false).getAttribute("emp");
 		    		
 		    		contractorId=emp.getContractor_id();
 		    		int employee_id=emp.getEmployee_id();
 		        	
 		         
 		         	request.setAttribute("assignedComplaints",estimatorDao.getAllestimatorComplaintsById(leadId, contractorId,employee_id));
 		         	request.setAttribute("workingComplaints",estimatorDao.getAllestimatorWorkingComplaintsById(leadId, contractorId,employee_id));
 		         	request.setAttribute("closedComplaints",estimatorDao.getAllestimatorClosedComplaintsById(leadId, contractorId,employee_id));
 		        	request.setAttribute("lead",leaddao.getLeadDetails(leadId));
 		        	rd=request.getRequestDispatcher("estimatorLeadComplaints.jsp");
 					
 					rd.forward(request, response);
 					
 				}else if(user.equals("installer")){
 					
 					int leadId=Integer.parseInt(request.getParameter("lead_id"));
 		        	Employee emp=(Employee)request.getSession(false).getAttribute("emp");
 		    		
 		    		contractorId=emp.getContractor_id();
 		    		int employee_id=emp.getEmployee_id();
 		        	
 		         
 		    		request.setAttribute("assignedComplaints",instDao.getAllInstallerComplaintsById(leadId, contractorId,employee_id));
 		         	request.setAttribute("workingComplaints",instDao.getAllInstallerWorkingComplaintsById(leadId, contractorId,employee_id));
 		         	request.setAttribute("closedComplaints",instDao.getAllInstallerClosedComplaintsById(leadId, contractorId,employee_id));
 		        	request.setAttribute("lead",leaddao.getLeadDetails(leadId));
 		        	rd=request.getRequestDispatcher("installerLeadComplaints.jsp");
 					
 					rd.forward(request, response);
 					
 				}
        	
        	
			
		}
	}

}
