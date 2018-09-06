package com.tlite.ajax;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.DbUtils;

import com.google.gson.Gson;
import com.tlite.connection.DBConnection;
import com.tlite.dao.contractor.IInvoice;
import com.tlite.dao.contractor.IInvoiceImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.pojo.LeadInvoice;
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;


@WebServlet("/AjaxForLocations")
public class AjaxForLocations extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ILead leaddao=new ILeadImpl();
    public AjaxForLocations() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		   System.out.println("inside ajax");
		
		   String cityName=request.getParameter("cityName");
		   
		
		   List<Locations> LocationList=leaddao.getPincodesByCity(cityName);
			
			
		
		    String  json= new Gson().toJson(LocationList);
		    System.err.println(json);
		    response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
		
	}

}
