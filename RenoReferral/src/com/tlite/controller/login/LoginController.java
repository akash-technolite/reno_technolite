package com.tlite.controller.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.login.ILogin;
import com.dao.login.LoginImpl;
import com.tlite.pojo.Login;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userType=request.getParameter("UserType");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		ILogin login=new LoginImpl();
		RequestDispatcher rd = null;
		Login user=new Login();
		HttpSession session =request.getSession();
		
		
		 user.setEmail(email);
		 user.setPassword(password);
		 user.setUserType(userType);
		 
		String result =login.ValidateUser(user); 
		
		if (result.isEmpty()){
			
			result="  ";
			
		}
		
		if (result.equals("success")) {
			
			session.setAttribute("user", "admin");
			
			/*request.setAttribute("user", user);
			request.setAttribute("action", "dashboard");
			
			rd = request.getRequestDispatcher("Admin");
			
			rd.forward(request, response);*/
			
			response.sendRedirect("Admin?action=dashboard");
			
		} else {
			
			request.setAttribute("msg", "Invalid Username or Password");
			rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
		}
		
		
		
	}

}
