package com.tlite.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter({"/addContractorComplaints.jsp",
	"/adminComplaints.jsp",
	"/adminContractorProfile.jsp",
	"/adminCreateLead.jsp",
	"/adminLeadComplaints.jsp",
	"/adminLeads.jsp",
	"/adminSetting.jsp",
	"/adminSubscriptions.jsp",
	"/adminUser.jsp",
	"/assignLead.jsp",
	"/contractorComplaints.jsp",
	"/contractorCreateLead.jsp",
	"/contractorDashboard.jsp",
	"/contractorDocuments.jsp",
	"/contractorEditProfile.jsp",
	"/contractorEmployee.jsp",
	"/contractorFinalWorkReport.jsp",
	"/contractorInvoices.jsp",
	"/contractorLeadComplaints.jsp",
	"/addContractorComplaints.jsp",
	"/adminLeadComplaints.jsp",
	"/contractorLeadNotes.jsp",
	"/contractorLeads.jsp",
	"/contractorPaidInvoices.jsp",
	"/contractorProfile.jsp",
	"/contractorSales.jsp",
	"/contractorSetting.jsp",
	"/contractorSidebar.jsp",
	"/contractorStores.jsp",
	/*"/contratactorSignUpEmail.jsp",*/
/*	"/contrctorSign.jsp",*/
	"/createComplaint.jsp",
	"/contractorLeadComplaints.jsp",
	"/contractorLeadComplaints.jsp",
	"/contractorLeadComplaints.jsp",
	"/createContractor.jsp",
	"/createEstimation.jsp",
	"/createEstimator.jsp",
	"/createInstaller.jsp",
	"/createInvoice.jsp",
	"/createInvoice1.jsp",
	"/CreateLead.jsp",
	"/createpromotion.jsp",
	"/createSubAdmin.jsp",
	"/createSubscription.jsp",
	"/createUser.jsp",
	"/createWorkOrder.jsp",
	"/dashboard.jsp",
	"/defaultLeadSetting.jsp",
	"/estimatorComplaints.jsp",
	"/estimatorDashboard.jsp",
	"/estimatorDocuments.jsp",
	"/estimatorLeadComplaints.jsp",
	"/estimatorLeads.jsp",
	"/estimatorSidebar.jsp",
	"/estimatorStores.jsp",
	"/installerComplaints.jsp",
	"/installerDashboard.jsp",
	"/installerDocuments.jsp",
	"/installerLeadComplaints.jsp",
	"/installerLeads.jsp",
	"/installerSidebar.jsp",
	"/installerStores.jsp",
	"/invoiceCheckout.jsp",
	"/leadRegister.jsp",
	/*"/leadRegisterSuccess.jsp",*/
	"/showAllFollowUps.jsp",
	"/showComplaints.jsp",
	"/showPromotion.jsp",
	"/subscriptionRenewal.jsp",
	"/updateContractor.jsp",
	"/viewLead.jsp",
	"/workOrderCheckout.jsp",
	"/ComplaintAction",
	"/CreateComplaint",
	"/ComplaintController",
	"/ContractorController",
	"/ContractorControllerPost",
	"/ContractorCreateLead",
	"/ContractorFlowController",
	"/DocumentController",
	"/DocumentUpdater",
	"/DocumentUploader",
	"/EmployeeController",
	"/EstimateController",
	"/FinalReportController",
	"/InvoiceController",
	"/LeadNotesController",
	"/PromotionAction",
	"/ShowContractor",
	"/StoreController",
	"/UploadProfilePicture",
	"/WorkOrderController",
	"/Admin",
	"/AssignLead",
	"/AssignLeadAction",
	"/CreateLeadAction",
	"/DefaultLeadAction",
	/*"/IndexLeadRegister",*/
	"/LeadAction",
	/*"/LeadRegister",*/
	"/SaveDefaultLeadSetting",
	"/ViewLeads",
	"/Setting",
	"/CreateSubscription",
	"/SubscriptionAction",
	"/Subscriptions",
	"/UpdateSubscription",
	"/ContractorAction",
	"/ContractorDetailsAction",
	/*"/ContractorSignUp",*/
	"/CreateContractor",
	"/EditContractor",
	/*"/EstimatorController",
	"/InstallerController",*/
	"/UserAction"
	})






public class SessionFilter implements Filter {


	
	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);	
		
			HttpSession session = request.getSession(false);
			
			
			if (null == session) {
				
				response.sendRedirect("Index");
				
			}else{ 
				
				if(session.getAttribute("user")==null){
					
			        response.sendRedirect("Index");
			        
				}else{
					chain.doFilter(req, res);
				}
				
			}
			
			
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	
	}

