package com.tlite.controller.lead;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.Lead;

/**
 * Servlet implementation class ViewLeads
 */
@WebServlet("/ViewLeads")
public class ViewLeads extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   ILead leaddao=new ILeadImpl();
    public ViewLeads() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int LeadID=Integer.parseInt(request.getParameter("LeadID"));
		
		Lead lead=leaddao.getLeadDetails(LeadID);
		
		Contractor contractor=leaddao.getLeadContractorDetails(LeadID);
		
		lead.setContractor(contractor);
		
		request.setAttribute("lead",lead);
		
		request.setAttribute("imagePaths", leaddao.getImagePaths(LeadID));
		
		
		RequestDispatcher rd=request.getRequestDispatcher("viewLead.jsp");
		
		rd.forward(request, response);
	}

}
