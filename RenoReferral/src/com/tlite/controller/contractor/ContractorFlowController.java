package com.tlite.controller.contractor;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.estimator.IEstimator;
import com.dao.estimator.IEstimatorImpl;
import com.dao.installer.IInstaller;
import com.dao.installer.IInstallerImpl;
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
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.Employee;
import com.tlite.pojo.FinalWorkReport;
import com.tlite.pojo.Subscriptions;


@WebServlet("/ContractorFlowController")
public class ContractorFlowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IContractor contractorDao=new IContractorImpl();
	RequestDispatcher rd=null;
	String PATH=null;
	String result="";
	ISubscriptions subDao=new ISubscriptionsImpl();
	ILead leaddao=new ILeadImpl();
	IEstimation estDao=new IEstimationImpl(); 
	IPromotion promoDao=new IPromotionImpl();
	IInvoice invDao=new IInvoiceImpl();
	IEstimator estimatorDao=new IEstimatorImpl();
	IInstaller instDao= new IInstallerImpl();
	int res=0;
    public ContractorFlowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		
		String action=request.getParameter("action");
		
		
		     if(action!=null){
			if(action.equalsIgnoreCase("show"))
			{
				 
		    	if(request.getParameter("result")!=null){
				if(request.getParameter("result").equals("moveSuccess")){
					request.setAttribute("SuccessMessage", "Moving Successful");
				}else if(request.getParameter("result").equals("moveError")){
					request.setAttribute("ErrorMessage", "Moving Failed");
				}else if(request.getParameter("result").equals("followSuccess")){
					request.setAttribute("SuccessMessage", "Follow Up Added");
				}else if(request.getParameter("result").equals("followFailed")){
					request.setAttribute("ErrorMessage", "Follow Not Added");
				}else if(request.getParameter("result").equals("moveToConsultSuccess")){
					request.setAttribute("SuccessMessage", "Lead Moved To Consulted");
				}else if(request.getParameter("result").equals("moveToConsultFailed")){
					request.setAttribute("ErrorMessage", "Lead Not Moved To Consulted");
				}else if(request.getParameter("result").equals("leadAlreadySold")){
					request.setAttribute("ErrorMessage", "Lead already sold");
				}
				}
		    	
		      String user=(String) request.getSession(false).getAttribute("user");
				
				System.out.println("user=="+request.getSession(false).getAttribute("user"));
				
				if(user.equals("contractor")){
	
					
			    	request.setAttribute("newList", contractorDao.getLeadsByContractor(contractorId));
					request.setAttribute("estimatorList", contractorDao.getAllEstimators(contractorId));
					/*List<Employee> estimatorList=contractorDao.getAllEstimators(contractorId);*/
					request.setAttribute("installerList", contractorDao.getAllInstaller(contractorId));
					List<Contractor> contractorList=contractorDao.getContractorDetails(contractorId);
					request.setAttribute("FollowUpCount", contractorDao.getFollowUpCount(contractorId));
					request.setAttribute("AllInvoiceList", invDao.getAllInvoiceByContractor(contractorId));
					request.setAttribute("appliedList", contractorDao.getContractorAppliedLeads(contractorId));
					request.setAttribute("asssignedList", contractorDao.getContractorAssignedLeads(contractorId));
					request.setAttribute("consultedList", contractorDao.getConsultedLeadList(contractorId));
					request.setAttribute("quotedList", contractorDao.getQuotedLeadList(contractorId));
					request.setAttribute("soldLeads", contractorDao.getContractorSoldLeads(contractorId));
					request.setAttribute("workStartedLeads", contractorDao.getContractorWorkStartedLeads(contractorId));
					request.setAttribute("workCompledLeads", contractorDao.getContractorWorkCompletedLeads(contractorId));
					request.setAttribute("invoicedLeads", contractorDao.getContractorInvoicedLeads(contractorId));
					request.setAttribute("closedLeads", contractorDao.getContractorClosedLeads(contractorId));
					request.setAttribute("cancledLeads", contractorDao.getContractorCancledLeads(contractorId));
					
					int subscriptionId=0;
					
					for (Contractor con : contractorList) {
						
						subscriptionId=con.getSubscriptionId();
						
					}
					
					Subscriptions subscriptions= subDao.getSubscriptionById(subscriptionId);
					
					request.setAttribute("subscriptions", subscriptions);
					rd=request.getRequestDispatcher("contractorLeads.jsp");
					rd.forward(request, response);
					
				}else if(user.equals("estimator")){
					
				    Employee emp=(Employee)request.getSession(false).getAttribute("emp");
					int contractor_id=emp.getContractor_id();
					int employee_id=emp.getEmployee_id();
					
					    request.setAttribute("asssignedList", estimatorDao.getLeadsByEstimator(contractor_id,employee_id));
					    request.setAttribute("consultedList", estimatorDao.getConsultedLeadList(contractor_id,employee_id));
						request.setAttribute("quotedList", estimatorDao.getQuotedLeadList(contractor_id,employee_id));
						request.setAttribute("soldLeads", estimatorDao.getContractorSoldLeads(contractor_id,employee_id));
						request.setAttribute("workStartedLeads", estimatorDao.getEstimatorWorkStartedLeads(contractor_id,employee_id));
						request.setAttribute("workCompledLeads", estimatorDao.getEstimatorWorkCompletedLeads(contractor_id,employee_id));
					    request.setAttribute("invoicedLeads", estimatorDao.getEstimatorInvoicedLeads(contractor_id,employee_id));
						request.setAttribute("closedLeads", estimatorDao.getEstimatorClosedLeads(contractor_id,employee_id));
						request.setAttribute("cancledLeads", estimatorDao.getEstimatorCancledLeads(contractor_id,employee_id));
					
					
					
					rd=request.getRequestDispatcher("estimatorLeads.jsp");
					rd.forward(request, response);
		
					
				}else{
					
					 Employee emp=(Employee)request.getSession(false).getAttribute("emp");
						int contractor_id=emp.getContractor_id();
						int employee_id=emp.getEmployee_id();
						
					 request.setAttribute("workStartedLeads", instDao.getInstallerWorkStartedLeads(contractor_id,employee_id));
						request.setAttribute("workCompledLeads", instDao.getInstallerWorkCompletedLeads(contractor_id,employee_id));
						
						
					    rd=request.getRequestDispatcher("installerLeads.jsp");
							
							rd.forward(request, response);
					
				}
		          
			}else if(action.equalsIgnoreCase("leadNotes"))
				{
				  
				
				     if(request.getParameter("result")!=null){
				    	 
					if(request.getParameter("result").equals("noteDeleted")){
						request.setAttribute("SuccessMessage", "Note Deleted");
					}else if(request.getParameter("result").equals("noteNotDeleted")){
						request.setAttribute("ErrorMessage", "Delete Failed");
					}else if(request.getParameter("result").equals("noteCreated")){
						request.setAttribute("SuccessMessage", "Note Created");
					}else if(request.getParameter("result").equals("noteNotCreated")){
						request.setAttribute("ErrorMessage", "Note Creation Failed");
					}else if(request.getParameter("result").equals("noteShared")){
						request.setAttribute("SuccessMessage", "Sharing Status Changed ");
					}else if(request.getParameter("result").equals("noteNotShared")){
						request.setAttribute("ErrorMessage", "Status Changing Failed");
					}
					}
				     
					int leadId=Integer.parseInt(request.getParameter("lead_id"));
					
					request.setAttribute("contractor_id",contractorId);
					
					request.setAttribute("lead",leaddao.getLeadDetails(leadId));
					request.setAttribute("notesList",contractorDao.getLeadNotesById(leadId,contractorId));
				
					PATH="contractorLeadNotes.jsp";
					
					rd=request.getRequestDispatcher(PATH);
					rd.forward(request, response);
					
				
				     
				}else if(action.equalsIgnoreCase("showConInvoices"))
				{
					
					request.setAttribute("invoiceList",invDao.getAllContractorInvoice(contractorId));
				
					PATH="contractorSales.jsp";
					
					rd=request.getRequestDispatcher(PATH);
					rd.forward(request, response);
					
				
				     
				}else{
			
			
		    request.setAttribute("newList", contractorDao.getLeadsByContractor(contractorId));
			request.setAttribute("estimatorList", contractorDao.getAllEstimators(contractorId));
			/*List<Employee> estimatorList=contractorDao.getAllEstimators(contractorId);*/
			request.setAttribute("installerList", contractorDao.getAllInstaller(contractorId));
			List<Contractor> contractorList=contractorDao.getContractorDetails(contractorId);
			request.setAttribute("FollowUpCount", contractorDao.getFollowUpCount(contractorId));
			request.setAttribute("AllInvoiceList", invDao.getAllInvoiceByContractor(contractorId));
			request.setAttribute("appliedList", contractorDao.getContractorAppliedLeads(contractorId));
			request.setAttribute("asssignedList", contractorDao.getContractorAssignedLeads(contractorId));
			request.setAttribute("consultedList", contractorDao.getConsultedLeadList(contractorId));
			request.setAttribute("quotedList", contractorDao.getQuotedLeadList(contractorId));
			request.setAttribute("soldLeads", contractorDao.getContractorSoldLeads(contractorId));
			request.setAttribute("workStartedLeads", contractorDao.getContractorWorkStartedLeads(contractorId));
			request.setAttribute("workCompledLeads", contractorDao.getContractorWorkCompletedLeads(contractorId));
			request.setAttribute("invoicedLeads", contractorDao.getContractorInvoicedLeads(contractorId));
			request.setAttribute("closedLeads", contractorDao.getContractorClosedLeads(contractorId));
			request.setAttribute("cancledLeads", contractorDao.getContractorCancledLeads(contractorId));
			
			int subscriptionId=0;
			
			for (Contractor con : contractorList) {
				
				subscriptionId=con.getSubscriptionId();
				
			}
			
			Subscriptions subscriptions= subDao.getSubscriptionById(subscriptionId);
			
			request.setAttribute("subscriptions", subscriptions);
			
			rd=request.getRequestDispatcher("contractorLeads.jsp");
			rd.forward(request, response);
			
		}
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String action=request.getParameter("action");
	
	System.out.println("action="+action);
	
	HttpSession session=request.getSession(false);
	int contractorId=(int) session.getAttribute("userId");
	
	
		if(action.equalsIgnoreCase("moveToQuoted")){
			 int leadId=Integer.parseInt(request.getParameter("lead_id"));
			 result=contractorDao.deleteContractorLead("contractor_consulted_leads", leadId, contractorId);
			 if(result.equalsIgnoreCase("success")){
				 result=contractorDao.moveContractorLead("contractor_quoted_leads", leadId, contractorId); 
				 
				 if(result.equalsIgnoreCase("success")){
					 
					 response.sendRedirect("ContractorFlowController?action=show&result=moveSuccess");
					 
					}else{
					 
						response.sendRedirect("ContractorFlowController?action=show&result=moveError"); 
				 }
				}else{
				 
				 response.sendRedirect("ContractorFlowController?action=show&result=moveError");
			 }
			}else if(action.equalsIgnoreCase("newInvoice")){
				
			int leadId=Integer.parseInt(request.getParameter("lead_id"));
			request.setAttribute("lead",leaddao.getLeadDetails(leadId));
			request.setAttribute("notesList",contractorDao.getLeadNotesById(leadId,contractorId));
			request.setAttribute("estimationList",estDao.getAllEstimationById(leadId, contractorId));
			request.setAttribute("promotions",promoDao.getAllActivePromotion(contractorId));
			request.setAttribute("oldDueAmount",invDao.getOldDueAmount(leadId, contractorId));
			request.setAttribute("tax",contractorDao.getContractorTax(contractorId));
			  PATH="createInvoice.jsp";
			 
			    rd=request.getRequestDispatcher(PATH);
				rd.forward(request, response);
	    	}else if(action.equalsIgnoreCase("showAllInvoices")){
			
			
			int leadId=Integer.parseInt(request.getParameter("lead_id"));
			 if(contractorDao.validateContractorLead(leadId,contractorId)){
			request.setAttribute("lead",leaddao.getLeadDetails(leadId));
			request.setAttribute("invoiceList",invDao.getAllInvoiceById(leadId, contractorId));
			
			PATH="contractorInvoices.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
			 }else{
					
				   request.setAttribute("ErrorMessage", "Please enter valid referrence number");
		    		rd=request.getRequestDispatcher("contractorSales.jsp");
					rd.forward(request, response);	
			}
			 
		}else if(action.equalsIgnoreCase("cancleLead")){
			
			 int leadId=Integer.parseInt(request.getParameter("lead_id"));
			 
			result=contractorDao.deleteContractorLead("contractor_consulted_leads", leadId, contractorId);
			 if(result.equalsIgnoreCase("success")){
				 
				 result=contractorDao.moveContractorLead("contractor_cancled_leads", leadId, contractorId);
				 if(result.equalsIgnoreCase("success")){
					 
					 response.sendRedirect("ContractorFlowController?action=show&result=cancleSuccess");
				 
				 }else{
					 response.sendRedirect("ContractorFlowController?action=show&result=cancleFailed");
				 }
			 }else{
				 response.sendRedirect("ContractorFlowController?action=show&result=cancleFailed");
			 }
			
			 	 
		}else if(action.equalsIgnoreCase("moveToSold")){
			
			  int leadId=Integer.parseInt(request.getParameter("lead_id"));
			
			  
			  if(leaddao.checkIfSold(leadId)){
				  
				  response.sendRedirect("ContractorFlowController?action=show&result=leadAlreadySold");  
				  
			  }else{
				  
			 result=contractorDao.deleteContractorLead("contractor_quoted_leads", leadId, contractorId);
			 
			 if(result.equalsIgnoreCase("success")){
				 
				 leaddao.updateLeadStatus("sold", leadId);
				 
			  result=contractorDao.moveContractorLead("contractor_sold_leads", leadId, contractorId);
			 
			 if(result.equalsIgnoreCase("success")){
				 
				 response.sendRedirect("ContractorFlowController?action=show&result=moveSuccess");
			 
			 }else{
				 response.sendRedirect("ContractorFlowController?action=show&result=moveFailed");
			 }
		 }else{
			 response.sendRedirect("ContractorFlowController?action=show&result=moveFailed");
		 }
		}
			 
		}else if(action.equalsIgnoreCase("moveToWorkStarted")){
			
			 int leadId=Integer.parseInt(request.getParameter("lead_id"));
			
			 result=contractorDao.deleteContractorLead("contractor_sold_leads", leadId, contractorId);
			 
			 if(result.equalsIgnoreCase("success")){
				 
		      result=contractorDao.moveContractorLead("contractor_work_started_leads", leadId, contractorId);
			 
		      if(result.equalsIgnoreCase("success")){
				 
				 response.sendRedirect("ContractorFlowController?action=show&result=moveSuccess");
			 
			 }else{
				 response.sendRedirect("ContractorFlowController?action=show&result=moveFailed");
			 }
		 }else{
			 response.sendRedirect("ContractorFlowController?action=show&result=moveFailed");
		 }
			 
		}else if(action.equalsIgnoreCase("moveWorkCompleted")){
			
			int leadId=Integer.parseInt(request.getParameter("lead_id"));
			 result=contractorDao.deleteContractorLead("contractor_work_started_leads", leadId, contractorId);
			
			 if(result.equalsIgnoreCase("success")){
				 
				 result=contractorDao.moveContractorLead("contractor_work_completed_leads", leadId, contractorId);
				 
               if(result.equalsIgnoreCase("success")){
            	   
				  response.sendRedirect("ContractorFlowController?action=show&result=moveSuccess");
				  
			 }else{
				 response.sendRedirect("ContractorFlowController?action=show&result=moveFailed");
			 }
		 }else{
			 response.sendRedirect("ContractorFlowController?action=show&result=moveFailed");
		 }
			
		 }else if(action.equalsIgnoreCase("moveToClosed"))
		{
			int leadId=Integer.parseInt(request.getParameter("lead_id"));
			
			 result=contractorDao.deleteContractorLead("contractor_invoiced_leads", leadId, contractorId);
			 
			 
               if(result.equalsIgnoreCase("success")){
				 
            	   result=contractorDao.moveContractorLead("contractor_closed_leads", leadId, contractorId);
				 
               if(result.equalsIgnoreCase("success")){
            	   
				  response.sendRedirect("ContractorFlowController?action=show&result=moveSuccess");
				  
			 }else{
				 
				 response.sendRedirect("ContractorFlowController?action=show&result=moveFailed");
			 
			 }
		 }else{
			 
			 response.sendRedirect("ContractorFlowController?action=show&result=moveFailed");
		 
		 }
			
		}else if(action.equalsIgnoreCase("showAllPaidInvoices")){
			
			int leadId=Integer.parseInt(request.getParameter("lead_id"));
			
			System.out.println("leadId check="+leadId);
			System.out.println("contractorId="+contractorId);
			
			
			    if(contractorDao.validateContractorLead(leadId,contractorId)){
			    	
			      request.setAttribute("lead",leaddao.getLeadDetails(leadId));	 
				 /* request.setAttribute("invoiceList",invDao.getAllInvoiceById(leadId, contractorId));*/
				  request.setAttribute("invoiceList",invDao.getAllPaidInvoiceById(leadId, contractorId));
				    rd=request.getRequestDispatcher("contractorPaidInvoices.jsp");
					rd.forward(request, response);	  
				  
		    	}else{
				
				   request.setAttribute("ErrorMessage", "Please enter valid referrence number");
		    		rd=request.getRequestDispatcher("contractorSales.jsp");
					rd.forward(request, response);	
			}
			
			
			
			 
		}else if(action.equalsIgnoreCase("leadNotes"))
		{
			int leadId=Integer.parseInt(request.getParameter("lead_id"));
			request.setAttribute("contractor_id",contractorId);
			request.setAttribute("lead",leaddao.getLeadDetails(leadId));
			request.setAttribute("notesList",contractorDao.getLeadNotesById(leadId,contractorId));
			
			PATH="contractorLeadNotes.jsp";
			
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
			
		}else if(action.equalsIgnoreCase("loadEstimation"))
		{
			int estimation_id=Integer.parseInt(request.getParameter("estimation_id"));
			
			 System.out.println("estimation_id:"+estimation_id);
			
			 
		}else if(action.equalsIgnoreCase("deleteNote"))
		{
			int notes_id=Integer.parseInt(request.getParameter("notes_id"));
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			String employee_id=request.getParameter("employee_id");
			
			res=contractorDao.deleteLeadNote(notes_id);
			
			 if(employee_id != null && !employee_id.isEmpty()){
	        	
				 if(res>0){
						
						response.sendRedirect("EstimatorController?action=estimatorleadNotes&lead_id="+lead_id+"&employee_id="+employee_id+"&result=noteDeleted");
					}
					
					else{
					
						response.sendRedirect("EstimatorController?action=estimatorleadNotes&lead_id="+lead_id+"&employee_id="+employee_id+"&result=noteNotDeleted");	
					}
				
				
				}else{
					
					if(res>0){
						
						response.sendRedirect("ContractorFlowController?action=leadNotes&lead_id="+lead_id+"&result=noteDeleted");
					}
					
					else{
					
						response.sendRedirect("ContractorFlowController?action=leadNotes&lead_id="+lead_id+"&result=noteNotDeleted");	
					}
						
					
				}
			
		}else if(action.equalsIgnoreCase("moveToInvoice"))
		{
			int leadId=Integer.parseInt(request.getParameter("lead_id"));
			
			 result=contractorDao.deleteContractorLead("contractor_work_completed_leads", leadId, contractorId);
			 
			 
               if(result.equalsIgnoreCase("success")){
				 
            	   result=contractorDao.moveContractorLead("contractor_invoiced_leads", leadId, contractorId);
				 
               if(result.equalsIgnoreCase("success")){
            	   
				  response.sendRedirect("ContractorFlowController?action=show&result=moveSuccess");
				  
			 }else{
				 response.sendRedirect("ContractorFlowController?action=show&result=moveFailed");
			 }
		 }else{
			 response.sendRedirect("ContractorFlowController?action=show&result=moveFailed");
		 }
			
		}else if(action.equalsIgnoreCase("cancleLeadDynamic")){
			
			 int leadId=Integer.parseInt(request.getParameter("lead_id"));
			 
			 String table_name=request.getParameter("table_name");
			 
			   result=contractorDao.deleteContractorLead(table_name, leadId, contractorId);
			   
			   if(result.equalsIgnoreCase("success")){
				 
				 result=contractorDao.moveContractorLead("contractor_cancled_leads", leadId, contractorId);
				 
				 if(result.equalsIgnoreCase("success")){
					 
					 response.sendRedirect("ContractorFlowController?action=show&result=cancleSuccess");
				 
				 }else{
					 response.sendRedirect("ContractorFlowController?action=show&result=cancleFailed");
				 }
			 }else{
				 response.sendRedirect("ContractorFlowController?action=show&result=cancleFailed");
			 }
			
			 	 
		     }else if(action.equalsIgnoreCase("finalReport")){
			
			    int leadId=Integer.parseInt(request.getParameter("lead_id"));
			 
			    request.setAttribute("lead",leaddao.getLeadDetails(leadId));
			   
			    FinalWorkReport report=contractorDao.getFinalReport(leadId, contractorId);
				
			   
			    
			    report.setFiles(contractorDao.getFinalReportFiles(report.getReport_id()));
			    
			    request.setAttribute("report",report);
				PATH="contractorFinalWorkReport.jsp";
				
				rd=request.getRequestDispatcher(PATH);
				rd.forward(request, response);
				
		}else if(action.equalsIgnoreCase("shareNote")){
			
			int notes_id=Integer.parseInt(request.getParameter("notes_id"));
			int lead_id=Integer.parseInt(request.getParameter("lead_id"));
			/*String employee_id=request.getParameter("employee_id");*/
			
			int status;
			
			String formStatus=request.getParameter("shareStatus");
			
			if(formStatus==null){
				
				status=0;
				
			}else{
				
				status=1;	
			}
			 
			
			
			res=contractorDao.shareNote(notes_id,status);
			
		/*	 if(employee_id != null && !employee_id.isEmpty()){*/
	        	
				/* if(res>0){
						
						response.sendRedirect("EstimatorController?action=estimatorleadNotes&lead_id="+lead_id+"&employee_id="+employee_id+"&result=noteShared");
					}
					
					else{
					
						response.sendRedirect("EstimatorController?action=estimatorleadNotes&lead_id="+lead_id+"&employee_id="+employee_id+"&result=noteNotShared");	
					
					}*/
				 
			/* }else{*/
						
						if(res>0){
							
							response.sendRedirect("ContractorFlowController?action=leadNotes&lead_id="+lead_id+"&result=noteShared");
						}
						
						else{
						
							response.sendRedirect("ContractorFlowController?action=leadNotes&lead_id="+lead_id+"&result=noteNotShared");	
						}
							
						
				/*	}*/
	
		
		
	}
	
	
	}
}
