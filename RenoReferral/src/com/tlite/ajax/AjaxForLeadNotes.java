package com.tlite.ajax;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.pojo.FollowUp;
import com.tlite.pojo.LeadNotes;
import com.tlite.utility.TimestampGenerator;

/**
 * Servlet implementation class AjaxForLeadNotes
 */
@WebServlet("/AjaxForLeadNotes")
public class AjaxForLeadNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IContractor contratorDao=null;
	
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		contratorDao=new IContractorImpl();
		List<LeadNotes> notesList=null;
		 int contractorId=Integer.parseInt(request.getParameter("contractorId"));
		 int  leadId=Integer.parseInt(request.getParameter("leadId"));
		  String note=request.getParameter("note");
		
		  
		if(request.getParameter("note")!=null){
		
		
		 Timestamp timestamp=TimestampGenerator.getTimestamp();
		
		 
		  
		 LeadNotes leadNote=new LeadNotes();
		 
		 leadNote.setLeadId(leadId);
		 leadNote.setContractorId(contractorId);
		 leadNote.setNote_timestamp(String.valueOf(timestamp));
		 leadNote.setNote(note);
		 
		  String result=contratorDao.addLeadNote(leadNote);
		
		 notesList=contratorDao.getLeadNotesById(leadId,contractorId);
			 
		}
		
		else{
			
			
			notesList=contratorDao.getLeadNotesById(leadId,contractorId);
			
			
		}
		
		 
		 
		 
		
		String  json= new Gson().toJson(notesList);
		 
		    /*System.out.println(json);
		     */
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		    
		
		    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
