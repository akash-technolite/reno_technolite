package com.tlite.controller.complaint;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlite.dao.complaint.IComplaint;
import com.tlite.dao.complaint.IComplaintImpl;
import com.tlite.dao.contractor.IContractorComplaints;
import com.tlite.dao.contractor.IContractorComplaintsImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.pojo.Complaint;
import com.tlite.pojo.ContractorComplaint;
import com.tlite.utility.TimestampGenerator;


@WebServlet("/CreateComplaint")
public class CreateComplaint extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Complaint complaint;
	IComplaint complaintDao;
	String result="";
	String path="";
	RequestDispatcher rd=null;
	IContractorComplaints comDao=new IContractorComplaintsImpl();
	ILead leaddao=new ILeadImpl();
	IUser userDao=new IUserImpl();
	
    public CreateComplaint() {
    	complaint=new Complaint(); 
    	complaintDao=new IComplaintImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
						/*path="createComplaint.jsp";*/
						
					/*rd=request.getRequestDispatcher(path);
					rd.forward(request, response);*/
	
					/*response.sendRedirect(path);*/
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String action=request.getParameter("action");
		
		
		if(action.equalsIgnoreCase("createComplaint"))
		{
		
		int contractorId=Integer.parseInt(request.getParameter("contractor_id"));
		   int leadId=Integer.parseInt(request.getParameter("lead_id"));
		   
		System.out.println("contractorId="+contractorId);
		
		//if no contractor selected
        if(contractorId==0){
        
		String complaintText=request.getParameter("complaintText");
		
		complaint.setLeadId(leadId);
		
		complaint.setComplaintText(complaintText);
		
		complaint.setComplaint_status("new");
		
		complaint.setTimestamp(String.valueOf(TimestampGenerator.getTimestamp()));
		
		result=complaintDao.saveComplaint(complaint);
			
		/*path="createComplaint.jsp";*/
		
		if(result.equalsIgnoreCase("success")){
			
			response.sendRedirect("Admin?action=LeadComplaints&result=success&lead_id="+leadId);
		}
		else{
		
	    response.sendRedirect("Admin?action=LeadComplaints&result=error&lead_id="+leadId);
		}
		
        }else{
        	
        	
        	//save in admin complaints
        	complaint.setLeadId(leadId);
    		
    		complaint.setComplaintText(request.getParameter("complaintText"));
    		
    		complaint.setComplaint_status("assigned");
    		
    		complaint.setTimestamp(String.valueOf(TimestampGenerator.getTimestamp()));
    		
    		result=complaintDao.saveComplaint(complaint);
        	
        	
        	//save in contractor complaints
        	ContractorComplaint complaint2=new ContractorComplaint();
   		    
   			complaint2.setLeadID(leadId);
   			complaint2.setContractorId(contractorId);
   			complaint2.setTimestamp(String.valueOf(TimestampGenerator.getTimestamp()));
   			complaint2.setComplaint_text(request.getParameter("complaintText"));
   			complaint2.setComplaint_status("new");
   			
   			result=comDao.saveComplaint(complaint2);
   				
       
        
        
          if(result.equals("success")){
			
			/*request.setAttribute("SuccessMessage", "Complaint Created Successfully");
			
			path="createComplaint.jsp";
			
			rd=request.getRequestDispatcher(path);
			rd.forward(request, response);*/
        	  
        	  response.sendRedirect("Admin?action=LeadComplaints&result=success&lead_id="+leadId);
		   }
		
		  else{
			
        /* request.setAttribute("ErrorMessage", "Complaint Not created");
			
			path="createComplaint.jsp";
			
			rd=request.getRequestDispatcher(path);
			rd.forward(request, response);*/
			  
			  response.sendRedirect("Admin?action=LeadComplaints&result=error&lead_id="+leadId);
		}
        
        }
       /* request.setAttribute("lead",leaddao.getLeadDetails(leadId));
       	
       	request.setAttribute("conList",userDao.getAllContractorsByLead(leadId));*/
        
		
		
		}
		
		if(action.equalsIgnoreCase("assignComplaint"))
		{
		   
			int complaint_id=Integer.parseInt(request.getParameter("complaint_id"));
			int contractorId=Integer.parseInt(request.getParameter("contractor_id"));
			
			
			
           
			
			
			
			
			Complaint comp=complaintDao.getComplaintById(complaint_id);
		
			    
	    		
	    	//in contractor complaints	
            ContractorComplaint complaint=new ContractorComplaint();
   		    
   			complaint.setLeadID(comp.getLeadId());
   			complaint.setContractorId(contractorId);
   			complaint.setTimestamp(comp.getTimestamp());
   			complaint.setComplaint_text(comp.getComplaintText());
   			complaint.setComplaint_status("new");
   			
   			result=comDao.saveComplaint(complaint);
   			
   			
   			
   			if(result.equalsIgnoreCase("success")){
   				
   			   //update admin complaint
   				complaintDao.updateStatus("assigned", complaint_id);
   				
   				int leadId=comp.getLeadId();
   				
   				response.sendRedirect("Admin?action=LeadComplaints&result=assigned&lead_id="+leadId);
   				
   			   }
   			
   			  else{
   				  
   			  int leadId=comp.getLeadId();
   	          response.sendRedirect("Admin?action=LeadComplaints&result=notAssigned&lead_id="+leadId);
   			}
   			
   			
   			
   			
   			
   			
   			
   			/*request.setAttribute("lead",leaddao.getLeadDetails(leadId));
        	request.setAttribute("newComplaints",complaintDao.getAllNewComplaintsById(leadId));
         	request.setAttribute("assignedComplaints",complaintDao.getAllAssignedComplaintsById(leadId));
         	request.setAttribute("workingComplaints",complaintDao.getAllWorkingComplaintsById(leadId));
         	request.setAttribute("closedComplaints",complaintDao.getAllClosedComplaintsById(leadId));
         	request.setAttribute("conList",userDao.getAllContractorsByLead(leadId));
         	*/
         	
         	
         	
         	
			/*path="adminLeadComplaints.jsp";
			
			rd=request.getRequestDispatcher(path);
			rd.forward(request, response);*/
		}
		
		
		/*rd=request.getRequestDispatcher(path);
		rd.forward(request, response);*/
	}

}

