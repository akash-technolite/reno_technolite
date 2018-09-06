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
import com.tlite.mail.Mailer2;


@WebServlet("/AjaxSendMail")
public class AjaxSendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 String  json= null;
		
    	 
		    String to=request.getParameter("email");
			String subject=request.getParameter("subject");
			String msg=request.getParameter("text");
			
			 System.out.println(to);
			 System.out.println(subject);
			 System.out.println(msg);
			
			Mailer2.send(to, subject, msg);
		
		   
	    json= new Gson().toJson("success");
	  
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
			
	}

}
