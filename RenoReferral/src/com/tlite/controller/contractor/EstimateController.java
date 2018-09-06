package com.tlite.controller.contractor;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.contractor.IEstimation;
import com.tlite.dao.contractor.IEstimationImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.mail.AttachmentMail;
import com.tlite.pojo.EmailFormat;
import com.tlite.pojo.LeadEstimation;
import com.tlite.pojo.LeadEstimationElement;

@WebServlet("/EstimateController")
public class EstimateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IEstimation estDao=new IEstimationImpl();
	String result=null;
	ILead leaddao=new ILeadImpl();
	IContractor contractorDao=new IContractorImpl();
	
	String PATH="";
	
	RequestDispatcher rd=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		String action=request.getParameter("action");
		String estimation_title=request.getParameter("estimation_title");
		
		
		
		
		//Create Estimation
	   if(action.equalsIgnoreCase("createEstimation")){
			
		int lead_id=Integer.parseInt(request.getParameter("lead_id"));
		int contractorId=(int) session.getAttribute("userId");
		
		
		String invoice_id=request.getParameter("invoice_id");
		
		
		if(invoice_id.equals("")){
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date = new Date();  
		    String estimation_date=formatter.format(date);  
			
			
			LeadEstimation estimation=new LeadEstimation();
			
			estimation.setEstimation_title(estimation_title);
			estimation.setLeadId(lead_id);
			estimation.setEstimation_date(estimation_date);
			estimation.setContractorId(contractorId);
			estimation.setTotal(0.0);
			
			result=estDao.addEstimation(estimation);
			
		    }
		
		
		
		int estimation_id=estDao.getNextEstimationId();
		String date=request.getParameter("date");
		String serviceNotes=request.getParameter("serviceNotes");
		String service_description=request.getParameter("serviceDescription");
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		Double price=Double.parseDouble(request.getParameter("price"));
	/*	Double tax=Double.parseDouble(request.getParameter("tax"));*/
		Double amount=Double.parseDouble(request.getParameter("amount"));
		
		String tot=request.getParameter("total");
		
		if(tot.equals("")){
			
			tot="0";
			
		}
		
		Double total=Double.parseDouble(tot);
				
		
		
		Double newTotal=total+amount;
		        
		
		
		int item_code=estDao.getNextItemCode(estimation_id);
		
		
		LeadEstimationElement estimationElement=new LeadEstimationElement();
		
		estimationElement.setEstimation_id(estimation_id);
		estimationElement.setDate(date);
		estimationElement.setItem_code(item_code);
		estimationElement.setService_description(service_description);
		estimationElement.setQuantity(quantity);
		estimationElement.setPrice(price);
		/*estimationElement.setTax(tax);*/
		estimationElement.setAmount(amount);
		
		estDao.updateEstimationTotal(newTotal, estimation_id);
		
		result=estDao.addEstimationElement(estimationElement);
		
		
		if(result.equalsIgnoreCase("success")){
		
			        response.sendRedirect("EstimateController?"
					+ "action=itemAdded&estimation_title="+estimation_title+""
							+ "&estimation_id="+estimation_id+"&lead_id="+lead_id);
		}else{
			
			response.sendRedirect("EstimateController?action=createEstimate&leadId="+lead_id);
		}
		
		/*PATH="createEstimation.jsp";
		rd=request.getRequestDispatcher(PATH);
		
		rd.forward(request, response);*/
		
		}
		
		
		//delete Estimation Element
		if(action.equalsIgnoreCase("deleteElement")){
			
			int estimation_id=Integer.parseInt(request.getParameter("estimation_id"));
			int item_code=Integer.parseInt(request.getParameter("item_code"));
			Double element_total=Double.parseDouble(request.getParameter("element_total"));
			
			LeadEstimation estimation=estDao.getEstimationById(estimation_id);
			
			Double total=estimation.getTotal();
			
			Double newTotal=total-element_total;
			
			System.out.println("newTotal"+newTotal);
			
			estDao.updateEstimationTotal(newTotal, estimation_id);
			
			/*System.out.println("item_code"+item_code);
			System.out.println("estimation_id"+estimation_id);*/
			
			result=estDao.deleteEstimationElement(item_code, estimation_id);
			
			
			
			
			if(result.equalsIgnoreCase("success")){
				
		        response.sendRedirect("EstimateController?"
				+ "action=itemAdded&estimation_title="+estimation_title+""
						+ "&estimation_id="+estimation_id+"&lead_id="+estimation.getLeadId());
	       }else{
		
	    	   response.sendRedirect("EstimateController?action=createEstimate&leadId="+estimation.getLeadId());
	         }
			
			/*request.setAttribute("estimation_title",estimation_title);
			request.setAttribute("elementList",estDao.getEstimationElementById(estimation_id));
			request.setAttribute("estimation",estDao.getEstimationById(estimation_id));
			request.setAttribute("lead",leaddao.getLeadDetails(estimation.getLeadId()));
			request.setAttribute("notesList",contractorDao.getLeadNotesById(estimation.getLeadId(),estimation.getContractorId()));
		
			PATH="createEstimation.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			
			rd.forward(request, response);*/
		}
		
		if(action.equalsIgnoreCase("changeStatus")){
		
			int estimation_id=Integer.parseInt(request.getParameter("estimation_id"));
			  int leadId=Integer.parseInt(request.getParameter("lead_id"));
			
			String estimation_status=request.getParameter("estimation_status");
			
			
			result=estDao.updateEstimationStatus(estimation_status, estimation_id);
			
			
			
			if(result.equalsIgnoreCase("success")){
				
				response.sendRedirect("EstimateController?action=statusUpdate&leadId="+leadId+"&result=success");
			}
			
			else{
				
				response.sendRedirect("EstimateController?action=statusUpdate&leadId="+leadId+"&result=success");
				/*response.sendRedirect("ContractorController?action=estimate&leadId="+leadId);*/
			
			 }
		}
		
		if(action.equalsIgnoreCase("sendMail")){
		
			int estimation_id=Integer.parseInt(request.getParameter("estimation_id"));
			  int leadId=Integer.parseInt(request.getParameter("lead_id"));
			
			  String lead_email=leaddao.getLeadEmail(leadId);
			  String estimation_real_path=estDao.getEstimationRealPath(estimation_id);
			  
			  EmailFormat emailformat= new EmailFormat();
              
              emailformat.setTo(lead_email);
              emailformat.setSubject("RenoReferral:Estimation");
              emailformat.setMessage("Sir/Mam,\n We have processed on your information given you and formed an estimation as per your requirements.\n We have attached the document to this mail,please go through it and send your valuable response ");
              emailformat.setCompanyName("RenoReferral");
              emailformat.setClientName("Reno Referral Client");
              emailformat.setUsername("sarjine.tlss@gmail.com");
              emailformat.setPassword("Akash1612");
			  
              emailformat.setAttachment(estimation_real_path);
              
              
              AttachmentMail newMail=new AttachmentMail();
              
              newMail.sendEmail(emailformat);
			
			result=estDao.updateEstimationStatus("Sent", estimation_id);
			
			
			
			if(result.equalsIgnoreCase("success")){
				
				response.sendRedirect("EstimateController?action=statusUpdate&leadId="+leadId+"&result=mailSent");
			}
			
			else{
				
				response.sendRedirect("EstimateController?action=statusUpdate&leadId="+leadId+"&result=mailNotSent");
				/*response.sendRedirect("ContractorController?action=estimate&leadId="+leadId);*/
			
			 }
		}
		
		
			
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		
		String action=request.getParameter("action");
		String result=request.getParameter("result");
		
		 if(action.equalsIgnoreCase("createEstimate")){
				
				int leadId=Integer.parseInt(request.getParameter("leadId"));
				request.setAttribute("lead",leaddao.getLeadDetails(leadId));
				request.setAttribute("notesList",contractorDao.getLeadNotesById(leadId,contractorId));
			
				PATH="createEstimation.jsp";
				
				rd=request.getRequestDispatcher(PATH);
				rd.forward(request, response);
			
			
		  }else if(action.equalsIgnoreCase("itemAdded")){
			  
			    String estimation_title=request.getParameter("estimation_title");
			    int estimation_id=Integer.parseInt(request.getParameter("estimation_id"));
			    int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			  
			    request.setAttribute("estimation_title",estimation_title);
				request.setAttribute("elementList",estDao.getEstimationElementById(estimation_id));
				request.setAttribute("estimation",estDao.getEstimationById(estimation_id));
				request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
				request.setAttribute("notesList",contractorDao.getLeadNotesById(lead_id,contractorId));
				
			  
				
				rd=request.getRequestDispatcher("createEstimation.jsp");
				
				rd.forward(request, response);
			  
		  }else if(action.equalsIgnoreCase("statusUpdate")){
			  
			  
			  if(request.getParameter("result")!=null){
		    		
					if(request.getParameter("result").equals("mailSent")){
						request.setAttribute("SuccessMessage", "Mail Sent Successfully");
					}else if(request.getParameter("result").equals("mailNotSent")){
						request.setAttribute("ErrorMessage", "Mail Sending Failed");
					}
			  }
			  
			  int leadId=Integer.parseInt(request.getParameter("leadId"));
			  
			  
			    request.setAttribute("lead",leaddao.getLeadDetails(leadId));
				request.setAttribute("estimationList",estDao.getAllEstimationById(leadId, contractorId));
						
					PATH="contractorLeadEstimations.jsp";
					
					rd=request.getRequestDispatcher(PATH);
					rd.forward(request, response);
			  
		  }
		 
		 
		 
		 
	}
	
}
