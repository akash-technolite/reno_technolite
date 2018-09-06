package com.tlite.controller.contractor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.mail.Mailer2;
import com.tlite.pojo.Employee;


@WebServlet("/EmployeeController")
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      String action=""; 
    
     Employee employee;
     String result="";
     IContractor contractorDao=null;
     String PATH="";
     RequestDispatcher rd=null;
     IUser userDao=new IUserImpl(); 
    public EmployeeController() {
        employee=new Employee();
        contractorDao=new IContractorImpl();
    }
     String employee_email=null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session=request.getSession(false);  
	
		   int contractorId=(int) session.getAttribute("userId");
		   
		   String result=request.getParameter("result");
		   
		   if(result!=null){
			   
			   if(result.equals("EmployeeAdded")){
				   
				   request.setAttribute("SuccessMessage", "Employee Added Successfully");
		    	  
			   }else if(result.equals("EmployeeNotAdded")){
				   
				  request.setAttribute("ErrorMessage", "Employee Not Added "); 
			   }
		   }
		   
		   
		   
		     session.setAttribute("conSub",contractorDao.getContractorSubscription(contractorId));
			session.setAttribute("conLimit",contractorDao.getContractorLimits(contractorId));
		   
		   
		   System.out.println(contractorId);
		    request.setAttribute("employeeList",contractorDao.getAllEmployee(contractorId) );
		
			rd=request.getRequestDispatcher("contractorEmployee.jsp");
			rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		action=request.getParameter("action");
		System.out.println(action);
		int contractorId=(int) session.getAttribute("userId");
		
	
		 if(action.equalsIgnoreCase("createEstimator")){
			 
			 employee_email=request.getParameter("employeeEmail").trim().toLowerCase();
			 
			String employeePassword=request.getParameter("employeePassword");
			
			
			
			
			if(userDao.validateContractorEmail(employee_email)){
				
			
			if(contractorDao.validateEmployeeEmail(employee_email,contractorId)){
				
				request.setAttribute("ErrorMessage","Employee Email Already Exist");
				rd=request.getRequestDispatcher("createEstimator.jsp");
				rd.forward(request, response);
			
		     }else{
			
			employee.setEmployee_email(employee_email); 
			employee.setContractor_id(contractorId);
			employee.setEmployee_name(request.getParameter("employeeName"));
			employee.setEmployee_password(request.getParameter("employeePassword"));
			employee.setEmployee_mobile(Long.parseLong(request.getParameter("employeeMobileNumber")));
			employee.setEmployee_type(request.getParameter("employeeType"));
			
			result=contractorDao.addEmployee(employee);
			
			if(result.equals("success")){
		    	
				int res=userDao.updateContractorLimit("createEmployeeLimit",1,contractorId);
				
				if(res>0){
					
					String to=employee_email;
					String subject="RenoReferral:Registration Success";
					String msg="Welcome to RenoReferral.\n Thank You for registering with us.\nYour username is:"+ employee_email+"\nYour password is:"+employeePassword;
							
					Mailer2.send(to, subject, msg);
					
					session.removeAttribute("conLimit");
					session.setAttribute("conLimit",contractorDao.getContractorLimits(contractorId));
		    	    response.sendRedirect("EmployeeController?result=EmployeeAdded");
				
				
				}else{
			    	
					 response.sendRedirect("EmployeeController?result=EmployeeNotAdded");
			      }
		    	
		    }
		    else{
		    	
		    	response.sendRedirect("EmployeeController?result=EmployeeNotAdded");
		    
		    	
		    }
			
			 
		 }}else{
				request.setAttribute("ErrorMessage","Email Already Registered with us");
				rd=request.getRequestDispatcher("createEstimator.jsp");
				rd.forward(request, response);	
				
			}
	
		 }
		
		
		
	}		
		
		

}
