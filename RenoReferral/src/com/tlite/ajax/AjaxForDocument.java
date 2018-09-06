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
import com.tlite.dao.contractor.IStore;
import com.tlite.dao.contractor.IStoreImpl;
import com.tlite.pojo.Document;
import com.tlite.pojo.Store;

@WebServlet("/AjaxForDocument")
public class AjaxForDocument extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 IDocument docDao=new IDocumentImpl();  
	   
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int document_id=Integer.parseInt(request.getParameter("document_id"));
		
		
	    String  json= null;
		   
	    Document document=docDao.getDocument(document_id);
	      
	     
	    json= new Gson().toJson(document);
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
	    
	}
}
