package com.tlite.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlite.dao.contractor.IDocument;
import com.tlite.dao.contractor.IDocumentImpl;
import com.tlite.pojo.Employee;


@WebServlet("/AjaxGetDocumentSharedList")
public class AjaxGetDocumentSharedList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IDocument docDao=new IDocumentImpl();  
    public AjaxGetDocumentSharedList() {
        super();
       
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
      int document_id=Integer.parseInt(request.getParameter("document_id"));
		
		
	    String  json= null;
		   
	    List<Employee> sharedList=docDao.getSharedList(document_id);
	      
	     
	    json= new Gson().toJson(sharedList);
	    System.out.println(json);
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
		
		
		
		
	}

}
