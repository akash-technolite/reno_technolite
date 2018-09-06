package com.tlite.controller.contractor;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tlite.dao.contractor.IPromotion;
import com.tlite.dao.contractor.IPromotionImpl;
import com.tlite.pojo.Promotion;
import java.sql.Timestamp;

@WebServlet("/PromotionAction")
public class PromotionAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   String PATH=null;
   RequestDispatcher rd=null;
   IPromotion promtionDao=new IPromotionImpl();
   HttpSession session;
   String result="";
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 session=request.getSession(false);
		   
		
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("add"))
		{
			
			PATH="createpromotion.jsp";
		}
		
		else if(action.equalsIgnoreCase("view"))
		{
			int contractorId=(int) session.getAttribute("userId");
			request.setAttribute("allPromotion", promtionDao.getAllPromotion(contractorId));
			PATH="showPromotion.jsp";
		}
		rd=request.getRequestDispatcher(PATH);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		
		String action=request.getParameter("button");
		if(action.equalsIgnoreCase("save"))
		{
			
			Promotion p=new Promotion();
			
			p.setDescription(request.getParameter("description"));
			p.setDiscount_amount(Double.parseDouble(request.getParameter("discount_amount")));
			p.setType(request.getParameter("type"));
			p.setPromotion_name(request.getParameter("promotion_name"));
			p.setContractorId(contractorId);
		    p.setExpiry_date(request.getParameter("expiry_date"));
          
			if(request.getParameter("promotion_id")==""){
			
			result=promtionDao.addPromotion(p);
				
				/*if(result.equals("success")){
			    	
			   	request.setAttribute("SuccessMessage", "Promotion Added Successfully");
			    	PATH="PromotionAction?action=view";
			    }
			    else{
			    	
			    request.setAttribute("ErrorMessage", "promtion Not Added ");
			  	PATH="PromotionAction?action=view";
			    	 
			    }*/
			}
			PATH="PromotionAction?action=view";
		}
		response.sendRedirect(PATH);
	}

}
