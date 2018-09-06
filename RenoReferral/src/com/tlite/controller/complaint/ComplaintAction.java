package com.tlite.controller.complaint;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlite.dao.complaint.IComplaint;
import com.tlite.dao.complaint.IComplaintImpl;
import com.tlite.pojo.Complaint;


@WebServlet("/ComplaintAction")
public class ComplaintAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Complaint complaint;   
	IComplaint complaintDao=null;
	RequestDispatcher rd=null;
	String result="";
	
    public ComplaintAction() {
    	complaint=new Complaint(); 
    	complaintDao=new IComplaintImpl();  
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action=request.getParameter("action");
		
		
		if(action.equalsIgnoreCase("showComplaint")){
			
			List<Complaint> complaintsList=complaintDao.getAllComplaints();
			
			request.setAttribute("complaintsList", complaintsList);
			
			rd=request.getRequestDispatcher("showComplaints.jsp");
			rd.forward(request, response);
		}
		
		
      if(action.equalsIgnoreCase("delete")){
			
    	  int complaintId=Integer.parseInt(request.getParameter("complaintId"));
    	  
    	  result=complaintDao.deleteComplaint(complaintId);
    	  
    	  if(result.equalsIgnoreCase("success")){
    		  
    		  request.setAttribute("SuccessMessage", "Complaint Deleted Successfully");
    		  
    	  }
    	  
    	  else{
    		  
    		  request.setAttribute("ErrorMessage", "Complaint Not Deleted");
    		  
    	  }
    	  
    	  
    	  
    	  
    	    rd=request.getRequestDispatcher("ComplaintAction?action=showComplaint");
			rd.forward(request, response);
			
			
		}
		
		
		
          if(action.equalsIgnoreCase("update")){
			
    	   int complaintId=Integer.parseInt(request.getParameter("complaintId"));
    	   int leadId=Integer.parseInt(request.getParameter("leadReferenceNumber"));
  		   String complaintText=request.getParameter("complaintText");
  		   String status=request.getParameter("status");
  		  
  		  complaint.setComplaintId(complaintId);
  		  complaint.setLeadId(leadId);
  		  complaint.setComplaintText(complaintText);
  		  complaint.setStatus(status);
  		  
  		  result=complaintDao.updateComplaint(complaint);
  		  
  		  
  		 if(result.equalsIgnoreCase("success")){
   		  
   		  request.setAttribute("SuccessMessage", "Complaint Update Successfully");
   		  
   	  }
   	  
   	    else{
   		  
   		  request.setAttribute("ErrorMessage", "Complaint Not Updated");
   		  
   	  }
   	  
   	  
   	  
   	  
   	    rd=request.getRequestDispatcher("ComplaintAction?action=showComplaint");
			rd.forward(request, response);
			
  		  
  		  
			
		}
		
		
		
		
		
		
		
		
		
		
		
	}

	
	
	
	
	
	
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
