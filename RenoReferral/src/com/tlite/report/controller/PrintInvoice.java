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
import com.tlite.dao.contractor.IInvoice;
import com.tlite.dao.contractor.IInvoiceImpl;
import com.tlite.utility.UtilityClass;

import net.sf.jasperreports.engine.JasperRunManager;

@WebServlet("/PrintInvoice")
public class PrintInvoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	
    private Connection conn = null;
	private RequestDispatcher rd = null;
	 IContractor contractorDao=new IContractorImpl();
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletOutputStream servletOutputStream = null;
		
		HttpSession session=request.getSession(false);
		
		
		IInvoice invDao=new IInvoiceImpl();
		//get parameters from jsp
		int invoice_id=Integer.parseInt(request.getParameter("invoice_id"));
		int contractorId=(int) session.getAttribute("userId");
		
		String logo_path=contractorDao.getCompanyRealLogo(contractorId);
	
		
		/*String contentType = request.getParameter("report");*/
		
		
		String contentType = "pdf";
		
		
		

		try {
			
			conn = DBConnection.getConnection();
			
			//load jrxml
			File reportFile = new File(getServletContext().getRealPath("ireport/renoReferralInvoice.jrxml"));
			
			
			//set Parameters
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("invoice_id",invoice_id);			
			parameters.put("logo_path",logo_path);
			
			
			
			byte[] bytes = null;
			
			//select directory create if not present
			String folderPath=UtilityClass.makeDirectory("C", "upload\\RenoInvoices", "Invoice");

			
			
			/* execute if pdf button has been clicked */
			if (contentType.equals("pdf")) {
				
				
				 
				
				response.setContentType("application/pdf");
				servletOutputStream = response.getOutputStream();
				
				bytes = JasperRunManager.runReportToPdf(ExportReport.compileReport(reportFile), parameters, conn);
				

				response.setContentLength(bytes.length);
				servletOutputStream.write(bytes, 0, bytes.length);

				
				
				
				String filePath="Invoice"+invoice_id+".pdf";
				String realPath=folderPath+filePath;
				String webPath="\\RenoReferral\\upload\\RenoInvoices\\Invoice\\"+filePath;
				
				invDao.saveInvoicePaths(webPath,realPath,invoice_id);
				
					
				
				ExportReport.exportReport(reportFile,parameters,contentType,folderPath, "Invoice"+invoice_id+".pdf");
				
				
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
