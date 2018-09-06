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
import com.tlite.dao.contractor.IStore;
import com.tlite.dao.contractor.IStoreImpl;
import com.tlite.pojo.Employee;


@WebServlet("/AjaxGetStoreSharedList")
public class AjaxGetStoreSharedList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	IStore storeDao=new IStoreImpl();   
    public AjaxGetStoreSharedList() {
        super();
       
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int stores_id=Integer.parseInt(request.getParameter("stores_id"));
		
		
	    String  json= null;
		   
	    List<Employee> sharedList=storeDao.getSharedList(stores_id);
	      
	     
	    json= new Gson().toJson(sharedList);
	    System.out.println(json);
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
		
		
		
		
	}

}
