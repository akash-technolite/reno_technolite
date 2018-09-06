package com.tlite.controller.contractor;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import com.tlite.dao.contractor.IInvoice;
import com.tlite.dao.contractor.IInvoiceImpl;
import com.tlite.dao.contractor.IPromotion;
import com.tlite.dao.contractor.IPromotionImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.mail.AttachmentMail;
import com.tlite.pojo.EmailFormat;
import com.tlite.pojo.LeadEstimationElement;
import com.tlite.pojo.LeadInvoice;
import com.tlite.pojo.LeadInvoiceElement;

@WebServlet("/InvoiceController")
public class InvoiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IInvoice invDao=new IInvoiceImpl();
	String result=null;
	ILead leaddao=new ILeadImpl();
	IContractor contractorDao=new IContractorImpl();
	IEstimation estDao=new IEstimationImpl();
	IPromotion promoDao=new IPromotionImpl();
	String PATH="";
	
	RequestDispatcher rd=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		
		String action=request.getParameter("action");
		
		
		int contractorId=(int) session.getAttribute("userId");	
		
		
		//Create invoice
		if(action.equalsIgnoreCase("createInvoice")){
		
			
		int lead_id=Integer.parseInt(request.getParameter("lead_id"));
		String form_invoice_id=request.getParameter("invoice_id");
		String estimation_id=request.getParameter("estimation_id");
		
		
		     if(form_invoice_id.equals("")){
				
				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
			    Date date = new Date();  
			  String invoice_date=formatter.format(date);  
				
				
			  
				LeadInvoice invoice=new LeadInvoice();
				
				invoice.setEstimation_id(0);
				invoice.setInvoice_title("");
				invoice.setLeadId(lead_id);
				invoice.setInvoice_date(invoice_date);
				invoice.setContractorId(contractorId);
				invoice.setSubTotal(0.0);
				
				invDao.addInvoice(invoice);
				
			    }
		


		int invoice_id=invDao.getNextInvoiceId();
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
		        
		
		
		int item_code=invDao.getNextItemCode(invoice_id);
		
		
		LeadInvoiceElement invoiceElement=new LeadInvoiceElement();
		
		invoiceElement.setInvoice_id(invoice_id);
		invoiceElement.setService_date(date);
		invoiceElement.setItem_code(item_code);
		invoiceElement.setService_description(service_description);
		invoiceElement.setQuantity(quantity);
		invoiceElement.setPrice(price);
		/*invoiceElement.setTax(tax);*/
		invoiceElement.setAmount(amount);
		
		invDao.updateInvoiceTotal(newTotal, invoice_id);
		
		result=invDao.addInvoiceElement(invoiceElement);
		
		
		
		if(result.equalsIgnoreCase("success")){
			
	        response.sendRedirect("InvoiceController?"
			+ "action=itemAdded&invoice_id="+invoice_id+""
					+ "&estimation_id="+estimation_id+"&lead_id="+lead_id);
					}else{
						
						response.sendRedirect("InvoiceController?action=newInvoice&leadId="+lead_id);
					}
		
		
	    	}
		
		
		
		
		
		//delete invoice Element
		if(action.equalsIgnoreCase("deleteElement")){
			
			String invoice_title=request.getParameter("invoice_title");
			String estimation_id=request.getParameter("estimation_id");
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			int invoice_id=Integer.parseInt(request.getParameter("invoice_id"));
			int item_code=Integer.parseInt(request.getParameter("item_code"));
			Double element_total=Double.parseDouble(request.getParameter("element_total"));
			
			LeadInvoice invoice=invDao.getinvoiceById(invoice_id);
			
			Double total=invoice.getSubTotal();
			
			Double newTotal=total-element_total;
			
			System.out.println("newTotal"+newTotal);
			
			invDao.updateInvoiceTotal(newTotal, invoice_id);
			
			/*System.out.println("item_code"+item_code);
			System.out.println("invoice_id"+invoice_id);*/
			
			result=invDao.deleteInvoiceElement(item_code, invoice_id);
			
			
			
			if(result.equalsIgnoreCase("success")){
				
		        response.sendRedirect("InvoiceController?"
				+ "action=itemAdded&invoice_id="+invoice_id+""
						+ "&estimation_id="+estimation_id+"&lead_id="+lead_id);
						}else{
							
							response.sendRedirect("InvoiceController?action=newInvoice&leadId="+lead_id);
						}
			
			
			
			
			
			/*request.setAttribute("estimation_id",estimation_id);
			request.setAttribute("promotions",promoDao.getAllActivePromotion(contractorId));
			request.setAttribute("elementList",invDao.getInvoiceElementById(invoice_id));
			request.setAttribute("invoice",invDao.getinvoiceById(invoice_id));
			request.setAttribute("lead",leaddao.getLeadDetails(invoice.getLeadId()));
			request.setAttribute("notesList",contractorDao.getLeadNotesById(invoice.getLeadId(),invoice.getContractorId()));
			request.setAttribute("oldDueAmount",request.getParameter("oldDueAmount"));
			PATH="createInvoice.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			
			rd.forward(request, response);*/
		}
		
		
		
		
		
		//LOAD ESTIMATION TO INVOICE
		
		
		if(action.equalsIgnoreCase("loadEstimation")){
			
			String invoice_title=request.getParameter("invoice_title");
			int estimation_id=Integer.parseInt(request.getParameter("estimation_id"));
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			
				
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
			 Date date = new Date();  
			  
		     String invoice_date=formatter.format(date);  
				
				
			  
				LeadInvoice invoice=new LeadInvoice();
				
				invoice.setEstimation_id(estimation_id);
				invoice.setInvoice_title(invoice_title);
				invoice.setLeadId(lead_id);
				invoice.setInvoice_date(invoice_date);
				invoice.setContractorId(contractorId);
				invoice.setSubTotal(0.0);
				
				invDao.addInvoice(invoice);
			
				
	    	
	        int Curr_invoice_id=invDao.getNextInvoiceId();
	        
	        Double newTotal=0.0;
			
	        List<LeadEstimationElement> estElements=estDao.getEstimationElementById(estimation_id);
	        
	        
		    for (LeadEstimationElement estElement : estElements) {
				
		    LeadInvoiceElement invoiceElement=new LeadInvoiceElement();
		    
		    int item_code=invDao.getNextItemCode(Curr_invoice_id);
		    
		    
			invoiceElement.setInvoice_id(Curr_invoice_id);
			invoiceElement.setService_date(estElement.getDate());
			invoiceElement.setItem_code(item_code);
			invoiceElement.setService_description(estElement.getService_description());
			invoiceElement.setQuantity(estElement.getQuantity());
			invoiceElement.setPrice(estElement.getPrice());
			/*invoiceElement.setTax(tax);*/
			
			Double amount=estElement.getAmount();
			invoiceElement.setAmount(amount);
			
			newTotal=newTotal+amount;
			
			
			result=invDao.addInvoiceElement(invoiceElement);
			
		    } 
			
		    
		    result=invDao.updateInvoiceTotal(newTotal, Curr_invoice_id);
		    
		   /* request.setAttribute("estimation_id",estimation_id);
			request.setAttribute("invoice_title",invoice_title);
			request.setAttribute("promotions",promoDao.getAllActivePromotion(contractorId));
			request.setAttribute("elementList",invDao.getInvoiceElementById(Curr_invoice_id));
			request.setAttribute("invoice",invDao.getinvoiceById(Curr_invoice_id));
			request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
			request.setAttribute("notesList",contractorDao.getLeadNotesById(lead_id,contractorId));
			request.setAttribute("oldDueAmount",request.getParameter("oldDueAmount"));
			PATH="createInvoice.jsp";
			rd=request.getRequestDispatcher(PATH);
			
			rd.forward(request, response);*/
			
			     if(result.equalsIgnoreCase("success")){
				
		        response.sendRedirect("InvoiceController?"
				+ "action=itemAdded&invoice_id="+Curr_invoice_id+""
						+ "&estimation_id="+estimation_id+"&lead_id="+lead_id);
						}else{
							
							response.sendRedirect("InvoiceController?action=newInvoice&leadId="+lead_id);
						}
		}
		
		
		if(action.equalsIgnoreCase("saveFinal")){
		
			String invoice_title=request.getParameter("invoice_title");
			String est_id=request.getParameter("estimation_id");
			if(est_id.isEmpty()){
				
				est_id="0";
			}
			
		    int estimation_id=Integer.parseInt(est_id);
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			int invoice_id=Integer.parseInt(request.getParameter("invoice_id"));
			LeadInvoice invoice=new LeadInvoice();
			
			/*System.out.println(invoice_id);
			System.out.println(request.getParameter("subTotal"));
			System.out.println(request.getParameter("taxRate"));
			System.out.println(request.getParameter("taxDueAmount"));
			System.out.println(request.getParameter("tax_due_date"));
			System.out.println(request.getParameter("promoDiscount"));
			System.out.println(request.getParameter("grossTotal"));
			System.out.println(request.getParameter("paymentAmount"));
			System.out.println(request.getParameter("dueAmount"));*/
			
			invoice.setInvoice_title(invoice_title);
			invoice.setInvoice_id(invoice_id);
			invoice.setSubTotal(Double.parseDouble(request.getParameter("subTotal")));
			invoice.setTaxRate(request.getParameter("taxRate"));
			invoice.setTaxDueAmount(Double.parseDouble(request.getParameter("taxDueAmount")));
			invoice.setTax_due_date(request.getParameter("tax_due_date"));;
			invoice.setPromoDiscount(request.getParameter("promoDiscount"));
			invoice.setGrossTotal(Double.parseDouble(request.getParameter("grossTotal")));
			invoice.setPaymentAmount(Double.parseDouble(request.getParameter("paymentAmount")));
			invoice.setDueAmount(Double.parseDouble(request.getParameter("dueAmount")));
			invoice.setOldDueAmount(Double.parseDouble(request.getParameter("oldDueAmount")));
			request.setAttribute("tax",contractorDao.getContractorTax(contractorId));
			invoice.setInvoice_status("New");
			
			result=invDao.updateInvoice(invoice);
			
			
			  if(result.equalsIgnoreCase("success")){
				  
				  
				 /* response.sendRedirect("InvoiceController?"
							+ "action=savePrint&invoice_id="+invoice_id);*/
				  
				  
					/*if(!invDao.checkInvoiceAvaibility(lead_id, contractorId)){
					result=contractorDao.moveContractorLead("contractor_invoiced_leads", lead_id, contractorId);
					}
			*/
			
                 if(result.equalsIgnoreCase("success")){
				
		        response.sendRedirect("InvoiceController?"
				+ "action=finalCheckout&invoice_id="+invoice_id+""
						+ "&estimation_id="+estimation_id+"&lead_id="+lead_id);
						}else{
							
							response.sendRedirect("InvoiceController?action=newInvoice&leadId="+lead_id);
						}
			}else{
					
					response.sendRedirect("InvoiceController?action=newInvoice&leadId="+lead_id);
				}
			
			
		    /*request.setAttribute("estimation_id",estimation_id);
			request.setAttribute("invoice_title",invoice_title);
			request.setAttribute("promotions",promoDao.getAllActivePromotion(contractorId));
			request.setAttribute("elementList",invDao.getInvoiceElementById(invoice_id));
			request.setAttribute("invoice",invDao.getinvoiceById(invoice_id));
			request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
			request.setAttribute("notesList",contractorDao.getLeadNotesById(lead_id,contractorId));
			request.setAttribute("oldDueAmount",request.getParameter("oldDueAmount"));
			
			PATH="invoiceCheckout.jsp";
			rd=request.getRequestDispatcher(PATH);
			
			rd.forward(request, response);*/
		}
		
		
		if(action.equalsIgnoreCase("changeStatus")){
		
			  int invoice_id=Integer.parseInt(request.getParameter("invoice_id"));
			  int leadId=Integer.parseInt(request.getParameter("lead_id"));
			
			String invoice_status=request.getParameter("invoice_status");
			
			if(invoice_status.equalsIgnoreCase("Paid")){
				
			invDao.updateInvoiceStatus(invoice_status, invoice_id);
			invDao.trashOldInvoices();
			}else{
				
			invDao.updateInvoiceStatus(invoice_status, invoice_id);	
				
			}
			
			
			request.setAttribute("lead",leaddao.getLeadDetails(leadId));
			request.setAttribute("invoiceList",invDao.getAllInvoiceById(leadId, contractorId));
			
			PATH="contractorInvoices.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			
			rd.forward(request, response);
		}
		
		if(action.equalsIgnoreCase("payDue")){
			
			int invoice_id=Integer.parseInt(request.getParameter("mInvoiceId"));
			
			double oldDueAmt=Double.parseDouble(request.getParameter("mOldDueAmt"));
			
			System.out.println("oldDueAmt:"+oldDueAmt);
			double newPayAmt=Double.parseDouble(request.getParameter("mNewPayAmt"));
			
			double newDueAmt=Double.parseDouble(request.getParameter("mNewDueAmt"));
			
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			
			
			LeadInvoice invoice=new LeadInvoice();
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String invoice_date=dateFormat.format(date);
			
			invoice.setInvoice_title("Due Payment Of Invoice "+invoice_id);
			invoice.setInvoice_date(invoice_date);
			invoice.setEstimation_id(0);
			invoice.setLeadId(lead_id);
			invoice.setContractorId(contractorId);
		    invoice.setSubTotal(newPayAmt);
			invoice.setTaxRate("0");
			invoice.setTaxDueAmount(0.0);
			invoice.setTax_due_date("");;
			invoice.setPromoDiscount("0");
			invoice.setGrossTotal(newPayAmt);
			invoice.setPaymentAmount(newPayAmt);
			invoice.setDueAmount(newDueAmt);
			invoice.setOldDueAmount(oldDueAmt);
			invoice.setInvoice_status("Paid");
			
			invDao.addInvoice(invoice);
			
			
			int current_invoice_id=invDao.getNextInvoiceId();
			LeadInvoiceElement invoiceElement=new LeadInvoiceElement();
			 
			invoiceElement.setInvoice_id(current_invoice_id);
			
			
			
			
			
			invoiceElement.setService_date(invoice_date);
			invoiceElement.setItem_code(1);
			invoiceElement.setService_description("Due Payment Of Invoice "+invoice_id);
			invoiceElement.setQuantity(1);
			invoiceElement.setPrice(newPayAmt);
			invoiceElement.setAmount(newPayAmt);
			
			
			result=invDao.addInvoiceElement(invoiceElement);
			
			if(result.equalsIgnoreCase("success")){
			
			result=invDao.updateInvoiceDueStatus(1,invoice_id);
			
			
			
                if(result.equalsIgnoreCase("success")){
				
		        response.sendRedirect("InvoiceController?"
				+ "action=duePayment&current_invoice_id="+current_invoice_id+""
						+ "&invoice_id="+invoice_id+"&lead_id="+lead_id);
						}else{
							
							response.sendRedirect("InvoiceController?action=newInvoice&leadId="+lead_id);
						}
			}else{
					
					response.sendRedirect("InvoiceController?action=newInvoice&leadId="+lead_id);
				}
			
	        }else if(action.equalsIgnoreCase("showInvoice")){
			 
            int invoice_id=Integer.parseInt(request.getParameter("invoice_id"));
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			
			
			request.setAttribute("elementList",invDao.getInvoiceElementById(invoice_id));
			request.setAttribute("invoice",invDao.getinvoiceById(invoice_id));
			request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
			
			PATH="invoiceCheckout.jsp";
			rd=request.getRequestDispatcher(PATH);
			
			rd.forward(request, response);
			
		}else if(action.equalsIgnoreCase("sendMail")){
			 
			int invoice_id=Integer.parseInt(request.getParameter("invoice_id"));
			  int leadId=Integer.parseInt(request.getParameter("lead_id"));
			
			  String lead_email=leaddao.getLeadEmail(leadId);
			  String invocie_real_path=invDao.getInvocieRealPath(invoice_id);
			  
			  EmailFormat emailformat= new EmailFormat();
            
            emailformat.setTo(lead_email);
            emailformat.setSubject("RenoReferral:Invoice");
            emailformat.setMessage("Sir/Mam,\n This is invoice of the work done,please check attached invocie pdf and send us your valuable response");
            emailformat.setCompanyName("RenoReferral");
            emailformat.setClientName("Reno Referral Client");
            emailformat.setUsername("sarjine.tlss@gmail.com");
            emailformat.setPassword("Akash1612");
			  
            emailformat.setAttachment(invocie_real_path);
            
            
            AttachmentMail newMail=new AttachmentMail();
            
            newMail.sendEmail(emailformat);
			
			result=invDao.updateInvoiceStatus("Sent", invoice_id);
			
			
			
			if(result.equalsIgnoreCase("success")){
				
				response.sendRedirect("InvoiceController?action=showAllInvoices&leadId="+leadId+"&result=mailSent");
			}
			
			else{
				
				response.sendRedirect("InvoiceController?action=showAllInvoices&leadId="+leadId+"&result=mailNotSent");
				
			
			 }
		}
			
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
           HttpSession session=request.getSession(false);
		
		   String action=request.getParameter("action");
		
		
		int contractorId=(int) session.getAttribute("userId");	
		
		
		if(action.equalsIgnoreCase("newInvoice")){
			
			int leadId=Integer.parseInt(request.getParameter("lead_id"));
			request.setAttribute("lead",leaddao.getLeadDetails(leadId));
			request.setAttribute("notesList",contractorDao.getLeadNotesById(leadId,contractorId));
			request.setAttribute("estimationList",estDao.getAllEstimationById(leadId, contractorId));
			request.setAttribute("promotions",promoDao.getAllActivePromotion(contractorId));
			request.setAttribute("oldDueAmount",invDao.getOldDueAmount(leadId,contractorId));
			request.setAttribute("tax",contractorDao.getContractorTax(contractorId));
			
			  PATH="createInvoice.jsp";
			 
			    rd=request.getRequestDispatcher(PATH);
				rd.forward(request, response);
	    	}else if(action.equalsIgnoreCase("itemAdded")){
		
			String estimation_id=request.getParameter("estimation_id");
			int invoice_id=Integer.parseInt(request.getParameter("invoice_id"));
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			
			request.setAttribute("estimation_id",estimation_id);
			request.setAttribute("promotions",promoDao.getAllActivePromotion(contractorId));
			request.setAttribute("elementList",invDao.getInvoiceElementById(invoice_id));
			request.setAttribute("invoice",invDao.getinvoiceById(invoice_id));
			request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
			request.setAttribute("notesList",contractorDao.getLeadNotesById(lead_id,contractorId));
			request.setAttribute("oldDueAmount",invDao.getOldDueAmount(lead_id,contractorId));
			request.setAttribute("tax",contractorDao.getContractorTax(contractorId));
			PATH="createInvoice.jsp";
			rd=request.getRequestDispatcher(PATH);
			
			rd.forward(request, response);
		}else if(action.equalsIgnoreCase("finalCheckout")){
			
			String estimation_id=request.getParameter("estimation_id");
			int invoice_id=Integer.parseInt(request.getParameter("invoice_id"));
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			
			request.setAttribute("estimation_id",estimation_id);
			request.setAttribute("promotions",promoDao.getAllActivePromotion(contractorId));
			request.setAttribute("elementList",invDao.getInvoiceElementById(invoice_id));
			request.setAttribute("invoice",invDao.getinvoiceById(invoice_id));
			request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
			request.setAttribute("notesList",contractorDao.getLeadNotesById(lead_id,contractorId));
			request.setAttribute("oldDueAmount",invDao.getOldDueAmount(lead_id,contractorId));
			request.setAttribute("tax",contractorDao.getContractorTax(contractorId));
			
			PATH="invoiceCheckout.jsp";
			rd=request.getRequestDispatcher(PATH);
			
			rd.forward(request, response);
			
		}else if(action.equalsIgnoreCase("duePayment")){
			
			int current_invoice_id=Integer.parseInt(request.getParameter("current_invoice_id"));
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			int invoice_id=Integer.parseInt(request.getParameter("invoice_id"));
			
			request.setAttribute("invoice_title","Due Payment Of Invoice "+invoice_id);
			request.setAttribute("elementList",invDao.getInvoiceElementById(current_invoice_id));
			request.setAttribute("invoice",invDao.getinvoiceById(current_invoice_id));
			request.setAttribute("lead",leaddao.getLeadDetails(lead_id));
			
			
			
			PATH="invoiceCheckout.jsp";
			rd=request.getRequestDispatcher(PATH);
			
			rd.forward(request, response);
			
		}else if(action.equalsIgnoreCase("savePrint")){
			
			
			
			int invoice_id=Integer.parseInt(request.getParameter("invoice_id"));
			request.setAttribute("invoice_id",invoice_id );
			
			rd=request.getRequestDispatcher("PrintInvoice");
			
			rd.forward(request, response);
			
		}else if(action.equalsIgnoreCase("showAllInvoices")){
			
			if(request.getParameter("result")!=null){
	    		
				if(request.getParameter("result").equals("mailSent")){
					request.setAttribute("SuccessMessage", "Mail Sent Successfully");
				}else if(request.getParameter("result").equals("mailNotSent")){
					request.setAttribute("ErrorMessage", "Mail Sending Failed");
				}
		  }
			
			
			int leadId=Integer.parseInt(request.getParameter("leadId"));
			
			request.setAttribute("lead",leaddao.getLeadDetails(leadId));
			request.setAttribute("invoiceList",invDao.getAllInvoiceById(leadId, contractorId));
			
			PATH="contractorInvoices.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
			 
		}
		
		
		
		
	}
	
}
