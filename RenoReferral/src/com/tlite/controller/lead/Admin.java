package com.tlite.controller.lead;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlite.dao.complaint.IComplaint;
import com.tlite.dao.complaint.IComplaintImpl;
import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.mail.Mailer2;
import com.tlite.pojo.Contractor;


@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ILead leaddao=new ILeadImpl();
	String PATH="";
	RequestDispatcher rd=null;
	IUser userDao=new IUserImpl();
	IComplaint comDao=new IComplaintImpl();
	IContractor contractorDao=new IContractorImpl();
    public Admin() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
		String action=request.getParameter("action");
		
		//browse all leads
				if(action.equalsIgnoreCase("AllComplaints")){
					
					/*request.setAttribute("leadList",leaddao.getAllLeads());*/
					
						
					PATH="adminComplaints.jsp";
					
					rd=request.getRequestDispatcher(PATH);
					rd.forward(request, response);
				}
		
           if(action.equalsIgnoreCase("LeadComplaints")){
        	
        	   if(request.getParameter("result")!=null){
       			if(request.getParameter("result").equals("success")){
       				request.setAttribute("SuccessMessage", "Complaint Added");
       				
       			}else if(request.getParameter("result").equals("error")){
       				request.setAttribute("ErrorMessage", "Complaint Not Added");
       			}else if(request.getParameter("result").equals("assigned")){
    				request.setAttribute("SuccessMessage", "Complaint Assigned Successfully");
    			}else if(request.getParameter("result").equals("notAssigned")){
    				request.setAttribute("ErrorMessage", "Complaint Not Assigned");
    			}
       			}
        	   
        	   
        	   
        	   
        	int leadId=Integer.parseInt(request.getParameter("lead_id"));
        	
         	if(leaddao.validateLead(leadId)){
        	
        	request.setAttribute("lead",leaddao.getLeadDetails(leadId));
        	request.setAttribute("newComplaints",comDao.getAllNewComplaintsById(leadId));
         	request.setAttribute("assignedComplaints",comDao.getAllAssignedComplaintsById(leadId));
         	request.setAttribute("workingComplaints",comDao.getAllWorkingComplaintsById(leadId));
         	request.setAttribute("closedComplaints",comDao.getAllClosedComplaintsById(leadId));
         	request.setAttribute("conList",userDao.getAllContractorsByLead(leadId));
         	
			PATH="adminLeadComplaints.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
			
        	}else{
        		
        		request.setAttribute("ErrorMessage", "Please Enter Valid Referrence Number!");
        		
        		PATH="adminComplaints.jsp";
				
				rd=request.getRequestDispatcher(PATH);
				rd.forward(request, response);
        	}
		}
           
           if(action.equalsIgnoreCase("dashboard")){
        	   
        	   
        	   request.setAttribute("rr_24new",leaddao.getLast24hrsleadCount());
        	   request.setAttribute("new_7con",leaddao.getContractorsCountFromLast7days());
        	   
        	   PATH="dashboard.jsp";
   			
   			rd=request.getRequestDispatcher(PATH);
   			rd.forward(request, response);
           }
		
        
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("action");
		
		System.out.println("action="+action);
		//All Complaints By LeadId
         if(action.equalsIgnoreCase("LeadComplaints")){
        	
        	int leadId=Integer.parseInt(request.getParameter("lead_id"));
        	
        	if(leaddao.validateLead(leadId)){
        	request.setAttribute("lead",leaddao.getLeadDetails(leadId));
        	request.setAttribute("newComplaints",comDao.getAllNewComplaintsById(leadId));
         	request.setAttribute("assignedComplaints",comDao.getAllAssignedComplaintsById(leadId));
         	request.setAttribute("workingComplaints",comDao.getAllWorkingComplaintsById(leadId));
         	request.setAttribute("closedComplaints",comDao.getAllClosedComplaintsById(leadId));
         	request.setAttribute("conList",userDao.getAllContractorsByLead(leadId));
         	
			PATH="adminLeadComplaints.jsp";
			
            }else{
        		
        		request.setAttribute("ErrorMessage", "Please Enter Valid Referrence Number!");
        		
        		PATH="adminComplaints.jsp";
				
				
        	}
		}
         
         
         //to create complaint page
         if(action.equalsIgnoreCase("createNewComplaint")){
         	
         	int leadId=Integer.parseInt(request.getParameter("lead_id"));
         	
         	request.setAttribute("lead",leaddao.getLeadDetails(leadId));
         	
         	request.setAttribute("conList",userDao.getAllContractorsByLead(leadId));
 			PATH="createComplaint.jsp";
 		}
         if(action.equalsIgnoreCase("contractorProfile")){
          	
        	 int contractorId=Integer.parseInt(request.getParameter("contractorId"));
        	 
     		List<Contractor> contractorList=contractorDao.getContractorDetails(contractorId);
     		
     		HashSet<String> contractorServices=new HashSet<String>();  
     		
     		for (Contractor con : contractorList) {
     			
     			contractorServices.add(con.getServiceName());
     			
     		}
     		
     	   HashSet<String> contractorLocations=new HashSet<String>();  
     		
     		for (Contractor con : contractorList) {
     			
     			contractorLocations.add(con.getLocationName());
     			
     		}
     		
     		request.setAttribute("buyCount",contractorDao.getContractorByiedLeadsCount(contractorId));
			request.setAttribute("closeCount",contractorDao.getContractorClosedLeadsCount(contractorId));
     		request.setAttribute("contractorList",contractorList );
     		request.setAttribute("contractorServices",contractorServices );
     		request.setAttribute("contractorLocations",contractorLocations );
     		
     		PATH="adminContractorProfile.jsp";
     		
     		
     }if(action.equalsIgnoreCase("dashboard")){
  	   
  	   
  	   request.setAttribute("rr_24new",leaddao.getLast24hrsleadCount());
  	   request.setAttribute("new_7con",leaddao.getContractorsCountFromLast7days());
  	   
  	   PATH="dashboard.jsp";
			
			
     }
        	rd=request.getRequestDispatcher(PATH);
		rd.forward(request, response);
	}
	
	
}
