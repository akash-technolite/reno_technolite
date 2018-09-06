package com.tlite.controller.setting;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.setting.ISetting;
import com.dao.setting.ISettingImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.pojo.BudgetRanges;
import com.tlite.pojo.Taxation;


@WebServlet("/Setting")
public class Setting extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ISetting settingDao=new ISettingImpl();
	ILead leaddao=new ILeadImpl();
	  RequestDispatcher rd=null;
	    int res=0;
    
    public Setting() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");*/
		
		String action=request.getParameter("action");
     	String result=request.getParameter("result");
		
     	 
     	
     	    
     	     if(action!=null){
     	    	 
     		   if(result!=null){
          		
     			if(result.equals("serviceAdded")){
     				
     				request.setAttribute("SuccessMessage", "Service Added");
     				
     			}else if(result.equals("serviceNotAdded")){
     				
     				request.setAttribute("ErrorMessage", "Service Not Added");
     				
     			}else if(result.equals("serviceAvailable")){
     				
     				request.setAttribute("ErrorMessage", "Service Already Exists");
     				
     			}else if(result.equals("rangeAdded")){
     				
     				request.setAttribute("SuccessMessage", "Budget Range Added");
     				
     			}else if(result.equals("rangeNotAdded")){
     				
     				request.setAttribute("ErrorMessage", "Budget Range Added");
     				
     			}else if(result.equals("rangeAvailable")){
     				
     				request.setAttribute("ErrorMessage", "Budget Range Already Exists");
     				
     			}else if(result.equals("serviceDeleted")){
     				
     				request.setAttribute("SuccessMessage", "Service Deleted");
     				
     			}else if(result.equals("serviceNotDeleted")){
     				
     				request.setAttribute("ErrorMessage", "Service Not Deleted");
     				
     			}else if(result.equals("rangeDeleted")){
     				
     				request.setAttribute("SuccessMessage", "Budget Range Deleted");
     				
     			}else if(result.equals("rangeNotDeleted")){
     				
     				request.setAttribute("ErrorMessage", "Budget Range Not Deleted");
     				
     			}else if(result.equals("priceUpdated")){
     				
     				request.setAttribute("SuccessMessage", "Lead Price Updated");
     				
     			}else if(result.equals("priceNotUpdated")){
     				
     				request.setAttribute("ErrorMessage", "Lead Price Not Updated");
     				
     			}else if(result.equals("taxUpdated")){
     				
     				request.setAttribute("SuccessMessage", "Tax Updated");
     				
     			}else if(result.equals("taxNotUpdated")){
     				
     				request.setAttribute("ErrorMessage", "Tax Not Updated");
     				
     			}
     			
     		   }
     		  
     		   
     		if(action.equalsIgnoreCase("showSetting")){
     			
     			
     			request.setAttribute("serviceList", leaddao.getAllServices());
    			request.setAttribute("budgetRanges", leaddao.getBudgetRanges());
    			request.setAttribute("leadPrice", leaddao.getDefaultLeadPrice());
    			request.setAttribute("taxation", leaddao.getTaxation());
     			rd=request.getRequestDispatcher("adminSetting.jsp");
     			
     			rd.forward(request, response);
     			
     		}
     		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("addService")){
			
			String service_name=request.getParameter("service_name");
			
			service_name=service_name.trim();
			
			service_name=service_name.substring(0,1).toUpperCase() + service_name.substring(1).toLowerCase();
			
		    res=settingDao.addService(service_name);
			
			if(res==1){
			
				response.sendRedirect("Setting?action=showSetting&result=serviceAdded");
				
			}else if(res==2){
				
				response.sendRedirect("Setting?action=showSetting&result=serviceAvailable");
			}else{
				
				response.sendRedirect("Setting?action=showSetting&result=serviceNotAdded");
			}
			
		}else if(action.equalsIgnoreCase("addBudgetRange")){
			
			int min_value=Integer.parseInt(request.getParameter("min_value"));
			int max_value=Integer.parseInt(request.getParameter("max_value"));
			
			BudgetRanges range=new BudgetRanges();
			
			range.setMin_value(min_value);
			range.setMax_value(max_value);
			
			res=settingDao.addBudgetRange(range);
			
			if(res==1){
				
				response.sendRedirect("Setting?action=showSetting&result=rangeAdded");
				
			}else if(res==2){
				
				response.sendRedirect("Setting?action=showSetting&result=rangeAvailable");
			}else{
				
				response.sendRedirect("Setting?action=showSetting&result=rangeNotAdded");
			}
			
		}else if(action.equalsIgnoreCase("deleteService")){
			
			int service_id=Integer.parseInt(request.getParameter("service_id"));
			
			res=settingDao.deleteService(service_id);
			
             if(res>0){
				
				response.sendRedirect("Setting?action=showSetting&result=serviceDeleted");
				
			}else{
				
				response.sendRedirect("Setting?action=showSetting&result=serviceNotDeleted");
			}
			
		}else if(action.equalsIgnoreCase("deleteRange")){
			
			int ranges_id=Integer.parseInt(request.getParameter("ranges_id"));
			
			System.out.println("Range Id="+ranges_id);
			
			res=settingDao.deleteBudgetRange(ranges_id);
			
             if(res>0){
				
				response.sendRedirect("Setting?action=showSetting&result=rangeDeleted");
				
			}else{
				
				response.sendRedirect("Setting?action=showSetting&result=rangeNotDeleted");
			}
		
	}else if(action.equalsIgnoreCase("newleadPrice")){
		
		double priceDollar=Double.parseDouble(request.getParameter("price"));
		
		double priceCents=priceDollar*100;
		
		res=settingDao.updateLeadPrice(priceCents);
		
         if(res>0){
			
			response.sendRedirect("Setting?action=showSetting&result=priceUpdated");
			
		}else{
			
			response.sendRedirect("Setting?action=showSetting&result=priceNotUpdated");
		}
	
	}else if(action.equalsIgnoreCase("updateTaxation")){
	
		/*tProvince*/
		
			Taxation tax =new Taxation();
			
			tax.setTax_id(Integer.parseInt(request.getParameter("tTax_id")));
			tax.setGst(Double.parseDouble(request.getParameter("tGst")));
			tax.setHst(Double.parseDouble(request.getParameter("tHst")));
			tax.setPst(Double.parseDouble(request.getParameter("tPst")));
			tax.setQst(Double.parseDouble(request.getParameter("tQst")));
		
			res=leaddao.updateTaxation(tax);
		
          if(res>0){
			
			response.sendRedirect("Setting?action=showSetting&result=taxUpdated");
			
		}else{
			
			response.sendRedirect("Setting?action=showSetting&result=taxNotUpdated");
		}
	}
			
  }
}
