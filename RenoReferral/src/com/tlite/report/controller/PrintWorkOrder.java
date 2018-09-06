package com.tlite.report.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tlite.connection.DBConnection;
import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.contractor.IWorkOrder;
import com.tlite.dao.contractor.IWorkOrderImpl;
import com.tlite.utility.UtilityClass;

import net.sf.jasperreports.engine.JasperRunManager;

@WebServlet("/PrintWorkOrder")
public class PrintWorkOrder extends HttpServlet {
	
      private static final long serialVersionUID = 1L;
       
       private Connection conn = null;
	      private RequestDispatcher rd = null;
	      IWorkOrder orderDao=new IWorkOrderImpl();
	      IContractor contractorDao=new IContractorImpl();
	      
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		
		ServletOutputStream servletOutputStream = null;
		
		//get parameters from jsp
		int work_order_id=Integer.parseInt(request.getParameter("work_order_id"));
		int contractorId=(int) session.getAttribute("userId");
	
		String logo_path=contractorDao.getCompanyRealLogo(contractorId);
		
		/*String contentType = request.getParameter("report");*/
		
		
		String contentType = "pdf";
		
		
		

		try {
			
			conn = DBConnection.getConnection();
			
			//load jrxml
			File reportFile = new File(getServletContext().getRealPath("ireport/workOrderReport.jrxml"));
			
			
			//set Parameters
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("work_order_id",work_order_id);			
			parameters.put("logo_path",logo_path);
			
			
			
			byte[] bytes = null;
			
			//select directory create if not present
			String folderPath=UtilityClass.makeDirectory("C", "upload\\RenoWorkOrders", "WorkOrders");

			
			
			/* execute if pdf button has been clicked */
			if (contentType.equals("pdf")) {
				
				
				 
				
				response.setContentType("application/pdf");
				servletOutputStream = response.getOutputStream();
				
				bytes = JasperRunManager.runReportToPdf(ExportReport.compileReport(reportFile), parameters, conn);
				

				response.setContentLength(bytes.length);
				servletOutputStream.write(bytes, 0, bytes.length);

				
				String filePath="WorkOrder"+work_order_id+".pdf";
				String realPath=folderPath+filePath;
				String webPath="\\RenoReferral\\upload\\RenoWorkOrders\\WorkOrders\\"+filePath;
				
				int i=orderDao.saveWorkOrderPaths(webPath,realPath,work_order_id);
				
				ExportReport.exportReport(reportFile,parameters,contentType,folderPath, "WorkOrder"+work_order_id+".pdf");
				
				
				servletOutputStream.flush();
				servletOutputStream.close();
				System.out.println("PDF Report Generated");
				
				
			} /*else if (contentType.equals("html")) {
				
				
				ExportReport.exportReport(reportFile,parameters,contentType,folderPath, "AllSupplierReport.html");
				request.setAttribute("message", "Html Report Generated at "+folderPath + " folder");
				rd = request.getRequestDispatcher("/SupplierPaginationServlet");
				rd.forward(request, response);
				System.out.println("Html Report Generated");
				
				
			} else if (contentType.equals("xls")) {
				
				ExportReport.exportReport(reportFile,parameters,contentType,folderPath,"AllSupplierReport.xls");
				request.setAttribute("message", "Excel Report Generated at "+folderPath+" folder");
				rd = request.getRequestDispatcher("/SupplierPaginationServlet");
				rd.forward(request, response);
				System.out.println("XLS Report Generated");
				
			}*/
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

			try {
				
				if (conn != null) {
					conn.close();
				} else
					System.out.println("conn object is null on SaleInvoiceReport");
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("");
	}
	
}