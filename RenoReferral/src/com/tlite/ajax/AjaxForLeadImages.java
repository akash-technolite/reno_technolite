package com.tlite.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.user.IUserImpl;
import com.tlite.pojo.Locations;


@WebServlet("/AjaxForLeadImages")
public class AjaxForLeadImages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AjaxForLeadImages() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		 int leadId=Integer.parseInt(request.getParameter("leadId"));
	         
		    String  json= null;
		    ILead leaddao=new ILeadImpl();
		    
		    List<String> imagepaths=leaddao.getImagePaths(leadId);
		    
		   /* for (String string : imagepaths) {
				
		    	System.out.println(string);
			}
		    */
		    
		    json= new Gson().toJson(imagepaths);
		    
		 
		    
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
