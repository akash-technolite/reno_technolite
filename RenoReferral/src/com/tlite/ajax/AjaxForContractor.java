package com.tlite.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.pojo.Contractor;

@WebServlet("/AjaxForContractor")
public class AjaxForContractor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IContractor contractorDao=new  IContractorImpl();
    
    public AjaxForContractor() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  json= null;
		  int contractorId=Integer.parseInt(request.getParameter("contractorId"));
		  Contractor contractorCount=contractorDao.getContractorId(contractorId);
		json= new Gson().toJson(contractorCount);
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
	}

}
