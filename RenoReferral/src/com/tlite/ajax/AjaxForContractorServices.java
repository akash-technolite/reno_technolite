package com.tlite.ajax;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlite.connection.DBConnection;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.pojo.Services;

@WebServlet("/AjaxForContractorServices")
public class AjaxForContractorServices extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IUser userDao=null;
	
	public void init(){
		try{
		
		}catch(Exception se){
			se.printStackTrace();
		}
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		 int contractorId=Integer.parseInt(request.getParameter("contractorId"));
	
		    String  json= null;
		   
		    
		    userDao=new IUserImpl();
		    
		    List<String> serviceNames=new ArrayList<>();
		    
		    List<Services> contractorServices=userDao.getContractorServices(contractorId);
		    
		   for (Services services : contractorServices) {
			   
			serviceNames.add(services.getServiceName());
		   } 
		     json= new Gson().toJson(serviceNames);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		    
		
		    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
