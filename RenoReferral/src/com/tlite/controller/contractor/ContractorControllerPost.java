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
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.pojo.Assign;


@WebServlet("/ContractorControllerPost")
public class ContractorControllerPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IContractor contractorDao=new IContractorImpl();
	RequestDispatcher rd=null;  
	ILead leaddao=new ILeadImpl();
	String PATH=null;
	String result=null;
    public ContractorControllerPost() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("ContractorController?action=show");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		
		System.out.println("action="+action);
		
		HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		
          if(action.equalsIgnoreCase("applyLead")){
        	
            int leadId=Integer.parseInt(request.getParameter("lead_id"));
			Assign assign=new Assign();
			
			
			assign.setContractorId(contractorId);
			
			
	    	/*a.setEstimator_id(0);
			
			
			a.setInstaller_id(null);
			*/
			
			assign.setLeadID(leadId);
			
			
			
			  contractorDao.deleteContractorLead("contractor_newreno_leads", leadId, contractorId);
			
		      contractorDao.applyLead(assign);
		      
		      leaddao.addApplyBuyLead(leadId,contractorId);
		      
		      leaddao.updateLeadStatus("applied", leadId);
			
			int lead_sell_count=leaddao.getLeadSellCount(leadId);
			
			int new_count=lead_sell_count+1;
			
			result=leaddao.updateLeadSellCount(new_count,leadId);
			
			
			if(result.equals("success")){
		    	
		    	request.setAttribute("SuccessMessage", "Lead Applied Successfully");
		    	
		    }
		    else{
		    	
		    	request.setAttribute("ErrorMessage", "Lead Not Applied");
		    	
		    }
			
			PATH="ContractorController?action=show";
			
        }
          
          
        rd=request.getRequestDispatcher(PATH);
  		rd.forward(request, response);
  			
            
	}

}
