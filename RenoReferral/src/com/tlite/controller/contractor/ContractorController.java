package com.tlite.controller.contractor;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
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
import com.tlite.dao.contractor.IContractorComplaints;
import com.tlite.dao.contractor.IContractorComplaintsImpl;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.contractor.IEstimation;
import com.tlite.dao.contractor.IEstimationImpl;
import com.tlite.dao.contractor.IInvoice;
import com.tlite.dao.contractor.IInvoiceImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.pojo.Assign;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.ContractorLeadEmployeeDetails;
import com.tlite.pojo.ContractorLimits;
import com.tlite.pojo.Employee;
import com.tlite.pojo.FollowUp;
import com.tlite.pojo.LeadEstimation;
import com.tlite.pojo.LeadEstimationElement;
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;
import com.tlite.pojo.Subscriptions;


@WebServlet("/ContractorController")

public class ContractorController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	IContractor contractorDao=new IContractorImpl();
	RequestDispatcher rd=null;
	String PATH=null;
	IContractor idao=null;
	String result="";
	ISubscriptions subDao=new ISubscriptionsImpl();
	ILead leaddao=new ILeadImpl();
	IEstimation estDao=new IEstimationImpl();
	IInvoice invDao=new IInvoiceImpl();   
	IUser userDao=new IUserImpl();
	IEstimator estimatorDao=new IEstimatorImpl();
	IInstaller instDao= new IInstallerImpl();
	int res=0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		
		
		String action=request.getParameter("action");
		
		 	
		if(action!=null){
		if(action.equalsIgnoreCase("show"))
		{
			 System.out.println("result="+result);
	    	if(request.getParameter("result")!=null){
	    		
			if(request.getParameter("result").equals("assignSuccess")){
				request.setAttribute("SuccessMessage", "Lead Assigned Successfully");
			}else if(request.getParameter("result").equals("assignFailed")){
				request.setAttribute("ErrorMessage", "Lead Not Assigned");
			}else if(request.getParameter("result").equals("followSuccess")){
				request.setAttribute("SuccessMessage", "Follow Up Added");
			}else if(request.getParameter("result").equals("followFailed")){
				request.setAttribute("ErrorMessage", "Follow Not Added");
			}else if(request.getParameter("result").equals("moveToConsultSuccess")){
				request.setAttribute("SuccessMessage", "Lead Moved To Consulted");
			}else if(request.getParameter("result").equals("moveToConsultFailed")){
				request.setAttribute("ErrorMessage", "Lead Not Moved To Consulted");
			}else if(request.getParameter("result").equals("applySuccess")){
				request.setAttribute("SuccessMessage", "Lead Applied Successfully");
			}else if(request.getParameter("result").equals("applyFailed")){
				request.setAttribute("ErrorMessage", "Lead Not Applied");
			}else if(request.getParameter("result").equals("leadCreateSuccess")){
				request.setAttribute("SuccessMessage", "Lead Created Successfully");
			}else if(request.getParameter("result").equals("leadCreateFailed")){
				request.setAttribute("ErrorMessage", "Lead Not Created");
			}else if(request.getParameter("result").equals("subscriptionRenewalSuccess")){
				request.setAttribute("SuccessMessage", "Congratulation! Subscription Renewed");
			}else if(request.getParameter("result").equals("subscriptionRenewalFailed")){
				request.setAttribute("ErrorMessage", "Subscription Renewal Failed");
			}else if(request.getParameter("result").equals("SavedSentReport")){
				request.setAttribute("SuccessMessage", "Final Work Report Saved and Email Sent Successfully");
			}else if(request.getParameter("result").equals("fileSaveFailed")){
				request.setAttribute("ErrorMessage", "Final Work Report Files Saving Failed");
			}else if(request.getParameter("result").equals("reportSavingFailed")){
				request.setAttribute("ErrorMessage", "Final Work Report Saving Failed");
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
					request.setAttribute("leadPrice", leaddao.getDefaultLeadPrice());
					int subscriptionId=0;
					
					for (Contractor con : contractorList) {
						
						subscriptionId=con.getSubscriptionId();
						
					}
					
					Subscriptions subscriptions= subDao.getSubscriptionById(subscriptionId);
					
					session.setAttribute("conSub",subscriptions);
					session.setAttribute("conLimit",contractorDao.getContractorLimits(contractorId));
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
			
	          
				}else if(action.equalsIgnoreCase("assign")){
			
			
			request.setAttribute("newList", contractorDao.getLeadsByContractor(contractorId));
			request.setAttribute("estimatorList", contractorDao.getAllEstimators(contractorId));
			request.setAttribute("installerList", contractorDao.getAllInstaller(contractorId));
		    
			
			PATH="ContractorController?action=show";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);

		}else if(action.equalsIgnoreCase("profile")){
			
			    if(request.getParameter("result")!=null){
	    		 if(request.getParameter("result").equals("contractorUpdated")){
					request.setAttribute("SuccessMessage", "Contractor Profile Updated");
				}else if(request.getParameter("result").equals("contractorUpdateFailed")){
					request.setAttribute("ErrorMessage", "Contractor Profile Not Updated");
				}else if(request.getParameter("result").equals("pictureUploaded")){
					request.setAttribute("SuccessMessage", "Profile Picture Updated");
				}else if(request.getParameter("result").equals("pictureNotUploaded")){
					request.setAttribute("ErrorMessage", "Profile Picture Not Updated");
				}
				
				 
				} 
			
			    
			List<Contractor> contractorList=contractorDao.getContractorDetails(contractorId);
			
			HashSet<String> contractorServices=new HashSet<String>();  
			
			for (Contractor con : contractorList) {
				
				contractorServices.add(con.getServiceName());
				
			}
			
           HashSet<String> contractorLocations=new HashSet<String>();  
			
			for (Contractor con : contractorList) {
				
				contractorLocations.add(con.getLocationName());
				
			}
			request.setAttribute("conSub",contractorDao.getContractorSubscription(contractorId));
			request.setAttribute("conSubLimit",contractorDao.getContractorLimits(contractorId));
			request.setAttribute("buyCount",contractorDao.getContractorByiedLeadsCount(contractorId));
			request.setAttribute("closeCount",contractorDao.getContractorClosedLeadsCount(contractorId));
			request.setAttribute("contractorList",contractorList );
			request.setAttribute("contractorServices",contractorServices );
			request.setAttribute("contractorLocations",contractorLocations );
			
			PATH="contractorProfile.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
			
		}else if(action.equalsIgnoreCase("createLeadAction")){
			
			/*List<Locations> LocationList=leaddao.getAllLocations();*/
			List<Services> serviceList=leaddao.getAllServices();
			request.setAttribute("budgetRanges", leaddao.getBudgetRanges());
			/*List<Locations> cities=leaddao.getAllCities();
			   request.setAttribute("cities", cities);*/
			request.setAttribute("serviceList", serviceList);
			/*request.setAttribute("LocationList", LocationList);*/
			
			
			
			PATH="contractorCreateLead.jsp";
		
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
		}else if(action.equalsIgnoreCase("contractorSales"))
		{
		/*	
			request.setAttribute("leadList",contractorDao.getContractorInvoicedLeads(contractorId));
			
			
			PATH="contractorSales.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);*/
			 
		}else if(action.equalsIgnoreCase("contractorComplaints"))
		{
			IContractorComplaints comDao=new IContractorComplaintsImpl();
			/*request.setAttribute("leadList",contractorDao.geAllContractorLeads(contractorId));*/
			request.setAttribute("employees",contractorDao.getAllEstimators(contractorId));	
        	request.setAttribute("installers",contractorDao.getAllInstaller(contractorId));	
         	request.setAttribute("newComplaints",comDao.getAllContractorNewComplaints(contractorId));
         	request.setAttribute("assignedComplaints",comDao.getAllContractorAssignedComplaints(contractorId));
         	request.setAttribute("workingComplaints",comDao.getAllContractorWorkingComplaints(contractorId));
         	request.setAttribute("closedComplaints",comDao.getAllContractorClosedComplaints(contractorId));
			
			PATH="contractorComplaints.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
			 
		}else if(action.equalsIgnoreCase("createLeadAction")){
			
			/*List<Locations> LocationList=leaddao.getAllLocations();*/
			List<Services> serviceList=leaddao.getAllServices();
			List<Locations> cities=leaddao.getAllCities();
			   request.setAttribute("cities", cities);
			request.setAttribute("serviceList", serviceList);
			/*request.setAttribute("LocationList", LocationList);*/
			
			
			
			PATH="contractorCreateLead.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
		
		}else if(action.equalsIgnoreCase("showFollowUps")){
		
			request.setAttribute("followUpList",contractorDao.getAllFollowUp(contractorId) );
				
			PATH="showAllFollowUps.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
		
		}else if(action.equalsIgnoreCase("contractorSales")){
			
			request.setAttribute("leadList",contractorDao.getContractorInvoicedLeads(contractorId));
			
			
			PATH="contractorSales.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
			 
		}else if(action.equalsIgnoreCase("contractorComplaints")){
			
			request.setAttribute("leadList",contractorDao.geAllContractorLeads(contractorId));
			
			
			PATH="contractorComplaints.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
			 
		}else if(action.equalsIgnoreCase("dashbord")){
			
			
			
			
			
			
			
			
			
			
			
			
			
			PATH="contractorDashboard.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
			 
		}else if(action.equalsIgnoreCase("contractorSetting")){
			
			     if(request.getParameter("result")!=null){
	    		
				if(request.getParameter("result").equals("doctypeDeleted")){
					request.setAttribute("SuccessMessage", "Document Type Deleted");
				}else if(request.getParameter("result").equals("doctypeNotDeleted")){
					request.setAttribute("ErrorMessage", "Document Type Not Deleted");
				}else if(request.getParameter("result").equals("doctypeAdded")){
					request.setAttribute("SuccessMessage", "Document Type Added");
				}else if(request.getParameter("result").equals("doctypeNotAdded")){
					request.setAttribute("ErrorMessage", "Document Type Not Added");
				}else if(request.getParameter("result").equals("doctypeAlreadyExist")){
					request.setAttribute("ErrorMessage", "Document Type Already Exist");
				}else if(request.getParameter("result").equals("logoUploaded")){
					request.setAttribute("SuccessMessage", "Company Logo Uploaded");
				}else if(request.getParameter("result").equals("logoNotUploaded")){
					request.setAttribute("ErrorMessage", "Company Logo Upload Failed");
				}
				}
			
		     request.setAttribute("companyLogo",contractorDao.getCompanyLogo(contractorId));	     
			        
			 request.setAttribute("documentTypes", contractorDao.getDocumentTypes(contractorId));
			
			 
			PATH="contractorSetting.jsp";
			
			rd=request.getRequestDispatcher(PATH);
			rd.forward(request, response);
			 
		}   
		
		  
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
		
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		
		String action=request.getParameter("action");
		
		
			if(action.equalsIgnoreCase("followUp")){
				
				
				
				int leadId=Integer.parseInt(request.getParameter("follow_lead_id"));
				String timestamp=request.getParameter("followDate");
				String note=request.getParameter("followNote");
				
				
				FollowUp follow=new FollowUp();
				
				follow.setLeadId(leadId);
				follow.setContractorId(contractorId);
				follow.setTimestamp(timestamp);
				follow.setNote(note);
				
				
				result=contractorDao.addFollowUp(follow);
				
				
				
				if(result.equals("success")){
			    	
					response.sendRedirect("ContractorController?action=show&result=followSuccess");
			    	
			    	
			    }
			    else{
			    	
			    	response.sendRedirect("ContractorController?action=show&result=followFailed");
			    	
			    }
			
			//assign Lead to Employies
		}else if(action.equalsIgnoreCase("assignLead")){
				
		    /*	String Installer_id=request.getParameter("installer_id");
				
				
				String LeadID=request.getParameter("lead_id");*/
			System.out.println("conAssignCheckbox="+request.getParameter("conAssignCheckbox"));
			
			 if(request.getParameter("conAssignCheckbox")==null){
				
				ContractorLeadEmployeeDetails conLeadEmp=new ContractorLeadEmployeeDetails();
				
				Assign a=new Assign();
				
				int leadId=Integer.parseInt(request.getParameter("lead_id"));
				
				
				a.setContractorId(Integer.parseInt(request.getParameter("contractorId")));
				
				a.setLeadID(leadId);
				
				
				contractorDao.deleteAppliedLead(a);
				
				result=contractorDao.addAssign(a);
				
				conLeadEmp.setContractorId(Integer.parseInt(request.getParameter("contractorId")));
				
				
				conLeadEmp.setEstimator_id(Integer.parseInt(request.getParameter("estimator_id")));
				
				
				conLeadEmp.setInstaller_id(Integer.parseInt(request.getParameter("installer_id")));
				
				
				conLeadEmp.setLeadID(leadId);
				

				contractorDao.addContractorLeadEmployeeDetails(conLeadEmp);
				
				
				
				
				if(result.equals("success")){
			    	
					
					/*PATH="ContractorController?action=show";*/
					response.sendRedirect("ContractorController?action=show&result=assignSuccess");
			    	/*request.setAttribute("SuccessMessage", "Lead Assigned Successfully");*/
			    	
			    }
			    else{
			    	
			    	response.sendRedirect("ContractorController?action=show&result=assignFailed");
			    	/*request.setAttribute("ErrorMessage", "Lead Not Assigned");*/
			    	
			    }
			}
			 //Assign Lead to controctor himself
			 else{
				 
                ContractorLeadEmployeeDetails conLeadEmp=new ContractorLeadEmployeeDetails();
				
				Assign a=new Assign();
				
				int leadId=Integer.parseInt(request.getParameter("lead_id"));
				
				
				a.setContractorId(Integer.parseInt(request.getParameter("contractorId")));
				
				a.setLeadID(leadId);
				
				
				contractorDao.deleteAppliedLead(a);
				
				result=contractorDao.addAssign(a);
				
				if(result.equals("success")){
					
				
				conLeadEmp.setContractorId(Integer.parseInt(request.getParameter("contractorId")));
				
				
				conLeadEmp.setEstimator_id(0);
				
				
				conLeadEmp.setInstaller_id(0);
				
				
				conLeadEmp.setLeadID(leadId);
				

				contractorDao.addContractorLeadEmployeeDetails(conLeadEmp);
				
				
				
				
				if(result.equals("success")){
			    	
					
					
					response.sendRedirect("ContractorController?action=show&result=assignSuccess");
			    	
			    	
			    }
			    else{
			    	
			    	response.sendRedirect("ContractorController?action=show&result=assignFailed");
			    	
			    	
			    }
				
				}else{
			    	
			    	response.sendRedirect("ContractorController?action=show&result=assignFailed");
			    	
			    	
			    }
			}
				
			}else if(action.equalsIgnoreCase("moveToConsult")){
				
				int leadId=Integer.parseInt(request.getParameter("leadId"));
				
				contractorDao.deleteAssignedLead(leadId, contractorId);
				result=contractorDao.moveToConsulted(leadId, contractorId);
				
                 if(result.equals("success")){
			    	
                	 response.sendRedirect("ContractorController?action=show&result=moveToConsultSuccess");
			    	
			    	
			    }
			    else{
			    	
			    	response.sendRedirect("ContractorController?action=show&result=moveToConsultFailed");
			    	
			    	
			    }
				
				
			
			}else if(action.equalsIgnoreCase("estimate")){
				
				int leadId=Integer.parseInt(request.getParameter("leadId"));
				
				
				request.setAttribute("lead",leaddao.getLeadDetails(leadId));
				request.setAttribute("estimationList",estDao.getAllEstimationById(leadId, contractorId));
						
					PATH="contractorLeadEstimations.jsp";
					
					rd=request.getRequestDispatcher(PATH);
					rd.forward(request, response);
				
				}else if(action.equalsIgnoreCase("createEstimate")){
				
					int leadId=Integer.parseInt(request.getParameter("leadId"));
					request.setAttribute("lead",leaddao.getLeadDetails(leadId));
					request.setAttribute("notesList",contractorDao.getLeadNotesById(leadId,contractorId));
				
					PATH="createEstimation.jsp";
					
					rd=request.getRequestDispatcher(PATH);
					rd.forward(request, response);
				
				
			}else if(action.equalsIgnoreCase("applyLead")){
	        	
	            int leadId=Integer.parseInt(request.getParameter("lead_id"));
	            Assign assign=new Assign();
				assign.setContractorId(contractorId);
				assign.setLeadID(leadId);
				
				 contractorDao.deleteContractorLead("contractor_newreno_leads", leadId, contractorId);
				
			      contractorDao.applyLead(assign);
			      
			      leaddao.addApplyBuyLead(leadId,contractorId);
			      
			      /*leaddao.updateLeadStatus("applied", leadId);*/
				
				int lead_sell_count=leaddao.getLeadSellCount(leadId);
				
				int new_count=lead_sell_count+1;
				
				result=leaddao.updateLeadSellCount(new_count,leadId);
				
				
				if(result.equals("success")){
					
				Subscriptions conSub=(Subscriptions)session.getAttribute("conSub");
				
			    	//decrement renoleadlimit
				   if(conSub!=null){
					   
					if(conSub.getRenoRefLeads().equals("Allowed")){
						
						
					 res=userDao.updateContractorLimit("renoLeadLimit",1,contractorId);
					 
					}else if(conSub.getRenoRefLeads().equals("Not Allowed")){
						
						
						
				     res=userDao.updateContractorLimit("purchaseLeadLimit",1,contractorId);	
				     
					}else{
						
						res=1;
					}
					
				   }
				   
					if(res>0){
						session.setAttribute("conLimit",contractorDao.getContractorLimits(contractorId));
					response.sendRedirect("ContractorController?action=show&result=applySuccess");
					
					}else{
					    	
					   response.sendRedirect("ContractorController?action=show&result=applyFailed");
					    	
					 }
			    }
			    else{
			    	
			    	response.sendRedirect("ContractorController?action=show&result=applyFailed");
			    	
			    }
				
			
				
	        }else if(action.equalsIgnoreCase("buyLead")){
	        	
	            int leadId=Integer.parseInt(request.getParameter("lead_id"));
	            Assign assign=new Assign();
				assign.setContractorId(contractorId);
				assign.setLeadID(leadId);
				
				 contractorDao.deleteContractorLead("contractor_newreno_leads", leadId, contractorId);
				
			      contractorDao.applyLead(assign);
			      
			      leaddao.addApplyBuyLead(leadId,contractorId);
			      
			      /*leaddao.updateLeadStatus("applied", leadId);*/
				
				int lead_sell_count=leaddao.getLeadSellCount(leadId);
				
				int new_count=lead_sell_count+1;
				
				result=leaddao.updateLeadSellCount(new_count,leadId);
				
				
				if(result.equals("success")){
					
			/*	Subscriptions conSub=(Subscriptions)session.getAttribute("conSub");*/
				
			    	//decrement renoleadlimit
				 /*  if(conSub!=null){
					   
					if(conSub.getRenoRefLeads().equals("Allowed")){
						
						
					 res=userDao.updateContractorLimit("renoLeadLimit",1,contractorId);
					 
					}else if(conSub.getRenoRefLeads().equals("Not Allowed")){
						
					*/	
						
				     res=userDao.updateContractorLimit("purchaseLeadLimit",1,contractorId);	
				     
					/*}else{
						
						res=1;
					}
					
				   }*/
				   
					if(res>0){
						session.setAttribute("conLimit",contractorDao.getContractorLimits(contractorId));
					response.sendRedirect("ContractorController?action=show&result=applySuccess");
					
					}else{
					    	
					   response.sendRedirect("ContractorController?action=show&result=applyFailed");
					    	
					 }
			    }
			    else{
			    	
			    	response.sendRedirect("ContractorController?action=show&result=applyFailed");
			    	
			    }
				
			 }else if(action.equalsIgnoreCase("renewSub")){
	        	
	        	
	        	ContractorLimits conLimit=new ContractorLimits();


	        	
		    	Subscriptions sub=(Subscriptions) session.getAttribute("conSub");
		    	
		    	conLimit.setContractorId(contractorId);
		    	
		    	ContractorLimits currrentConLimit=contractorDao.getContractorLimits(contractorId);
		    	
		    	
		    	conLimit.setRenoLeadLimit(Integer.parseInt(sub.getRenoLeadLimit())+currrentConLimit.getRenoLeadLimit());
		    	conLimit.setPurchaseLeadLimit(Integer.parseInt(sub.getPurchaseLeadLimit())+currrentConLimit.getPurchaseLeadLimit());
		    	conLimit.setCreateLeadLimit(Integer.parseInt(sub.getCreateLeadLimit())+currrentConLimit.getCreateLeadLimit());
		    	conLimit.setCreateEmployeeLimit(Integer.parseInt(sub.getCreateEmployeeLimit())+currrentConLimit.getCreateEmployeeLimit());
		    	conLimit.setCreateSubConLimit(Integer.parseInt(sub.getCreateSubConLimit())+currrentConLimit.getCreateSubConLimit());
		    	
		    	res=userDao.renewSubscription(conLimit);
		    	
	        	
		    	   if(res>0){
					
		    		   session.removeAttribute("subExpired");
		    		   
					response.sendRedirect("ContractorController?action=dashbord&result=subscriptionRenewalSuccess");
					
					
					
					}else{
					    	
					   response.sendRedirect("ContractorController?action=dashbord&result=subscriptionRenewalFailed");
					    	
					 }
	        	
		    	  
	        	
	        }else if(action.equalsIgnoreCase("editProfile")){
	        	
	        	int contractor_id=Integer.parseInt(request.getParameter("contractorId"));
	        	
	        	
				
				request.setAttribute("serviceList", leaddao.getAllServices());
	        	request.setAttribute("contractor", contractorDao.getContractorById(contractor_id));
	        	request.setAttribute("contractorServices",contractorDao.getContractorServices(contractor_id));
	        	request.setAttribute("contractorLocations",contractorDao.getContractorLocations(contractor_id));
	        	
	        	rd=request.getRequestDispatcher("contractorEditProfile.jsp");
				rd.forward(request, response);
				
	        }else if(action.equalsIgnoreCase("updateProfile")){
	        	
	        	int contractor_id=Integer.parseInt(request.getParameter("contractorId"));
	        	
	        	Contractor contractor=new Contractor();
	        	
	        	    contractor.setContractorId(contractor_id);	
					contractor.setContractorName(request.getParameter("contractorName"));
				    contractor.setContractorMobileNumber(Long.parseLong(request.getParameter("contractorMobile")));
				    contractor.setContractorCompany(request.getParameter("contractorCompany"));
				    contractor.setContractorAddress(request.getParameter("contractorAddrerss"));
				    
				      if(contractorDao.updateContractor(contractor)){
					 
				    	  if(contractorDao.deleteContractorServices(contractor_id)){
				    		  
				    		  if( contractorDao.deleteContractorLocations(contractor_id)){
				    			  
				    			  String[] contractorServices=request.getParameterValues("contractorServices") ;
									 
									List<Integer> contractorServicesIds =new ArrayList<>();
									 
									 for(String service:contractorServices){
											
										 contractorServicesIds.add(Integer.parseInt(service));
											
										}
									 
									
									 res=userDao.saveContractorServices(contractorId, contractorServicesIds);
									
									 
									 //For Location
									 if(res>0){
										 
									 String[] cityPostals=request.getParameterValues("contractorLocations");
									 
									 
									 List<String> contractorLocations=new ArrayList<>();
									 
									 
									 for (String string : cityPostals) {
										
										 String array[]=string.split(":");
										 
										 
										 
										 System.out.println(array[0]+":"+array[1]);
										 
										 
											Locations loc=new Locations();
							    			loc.setCityName(array[0].trim());
							    			loc.setLocationName(array[1].trim());
							    	    	
							    			String postalCodeId;
							    			
							    			int postal_code=leaddao.checkforLocation(array[1].trim());
							    			
							    			if(postal_code>0){
							    				
							    				postalCodeId=String.valueOf(postal_code);
							    			 
							    			
							    			}else{
							    				
							    				postalCodeId=String.valueOf(leaddao.addNewLocation(loc));
							    		    
							    			}
							    			
							    			
							    			contractorLocations.add(postalCodeId);
									}
									 
									 
									 
									 List<Integer> contractorLocationsIds =new ArrayList<>();
									 
									
									 
									 
									 for(String location:contractorLocations){
											
										 /*System.out.println(location);*/
										 contractorLocationsIds.add(Integer.parseInt(location));
											
										}
									 
									 
									 
									 int locsev=userDao.saveContractorLocations(contractorId, contractorLocationsIds);
								   
									 if(locsev>0){
										
										response.sendRedirect("ContractorController?action=profile&result=contractorUpdated");
										 
										 
									 }else{
										 
										 response.sendRedirect("ContractorController?action=profile&result=contractorUpdateFailed");
									 }
								   
							   }else{
									 
									 response.sendRedirect("ContractorController?action=profile&result=contractorUpdateFailed");
								 }
				              }
				    		} 
				    	  
					   }else{
	        	
	        	response.sendRedirect("ContractorController?action=profile&result=contractorUpdateFailed");
	        	
	         }
	       }else if(action.equalsIgnoreCase("deleteDoctype")){
	    	 
	    	 int type_id=Integer.parseInt(request.getParameter("type_id"));
	    	 
	    	 int dres=contractorDao.deleteDocumentType(type_id);
	    	 
	    	 
	    	       if(dres>0){
					
					response.sendRedirect("ContractorController?action=contractorSetting&result=doctypeDeleted");
					 
					 
				 }else{
					 
					 response.sendRedirect("ContractorController?action=contractorSetting&result=doctypeNotDeleted");
				 }
	    	  
	       }else if(action.equalsIgnoreCase("addDocumentType")){
		    	 
		    	 String document_type=request.getParameter("document_type").toLowerCase();
		    	 
		    	 
		    	 if(contractorDao.validateDocumentType(document_type)){
		    		 
		    	  int dres=contractorDao.addDocumentType(document_type);
		    	 
		    	 
		    	       if(dres>0){
						
						response.sendRedirect("ContractorController?action=contractorSetting&result=doctypeAdded");
						 
						 
					 }else{
						 
						 response.sendRedirect("ContractorController?action=contractorSetting&result=doctypeNotAdded");
					 }
		    	   }else{
						 
						 response.sendRedirect("ContractorController?action=contractorSetting&result=doctypeAlreadyExist");
					 }
		    	 
		     }
	
}
}
