package com.tlite.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlite.dao.contractor.IInvoice;
import com.tlite.dao.contractor.IInvoiceImpl;
import com.tlite.pojo.LeadInvoice;

@WebServlet("/AjaxForDueAmount")
public class AjaxForDueAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	IInvoice invDao=new IInvoiceImpl();  
		
		 int invoice_id=Integer.parseInt(request.getParameter("invoice_id"));
		 
    	LeadInvoice invoice=invDao.getInvoiceById(invoice_id);
		
		String  json= new Gson().toJson(invoice);
		 
		    System.out.println(json);
		    
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		    
		
		    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
