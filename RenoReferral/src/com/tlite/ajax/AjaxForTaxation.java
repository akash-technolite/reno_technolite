package com.tlite.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlite.dao.contractor.IDocument;
import com.tlite.dao.contractor.IDocumentImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.pojo.Document;
import com.tlite.pojo.Taxation;

/**
 * Servlet implementation class AjaxForTaxation
 */
@WebServlet("/AjaxForTaxation")
public class AjaxForTaxation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 ILead leadDao=new ILeadImpl();  
	   
	    
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			int tax_id=Integer.parseInt(request.getParameter("tax_id"));
			
			
		    String  json= null;
			   
		    Taxation tax=leadDao.getTaxationById(tax_id);
		      
		     
		    json= new Gson().toJson(tax);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		    
		}
}