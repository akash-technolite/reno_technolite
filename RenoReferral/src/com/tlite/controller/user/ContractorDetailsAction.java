package com.tlite.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;

@WebServlet("/ContractorDetailsAction")
public class ContractorDetailsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       RequestDispatcher rd=null;
	IContractor conDao=null;
    public ContractorDetailsAction() {
       
    	conDao=new IContractorImpl();
    	
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		int id=Integer.parseInt(request.getParameter("contractorId"));
		System.out.println(id+"---------uuuuuiiu");
	request.setAttribute("con",conDao.getContractorById(id));
	
	rd=request.getRequestDispatcher("contractorDetails.jsp");
	rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("in post");
		doGet(request, response);
	}

}
