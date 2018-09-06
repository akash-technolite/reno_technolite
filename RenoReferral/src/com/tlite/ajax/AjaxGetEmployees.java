package com.tlite.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.pojo.Employee;

@WebServlet("/AjaxGetEmployees")
public class AjaxGetEmployees extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IContractor contractorDao=new IContractorImpl();
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		 String  json= null;
		 
		/* System.out.println("Inside Ajax");*/
    	List<Employee> employeeList=contractorDao.getAllEmployee(contractorId);
		
		   
	    json= new Gson().toJson(employeeList);
	   /* System.out.println(json);*/
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
			
	}

}
