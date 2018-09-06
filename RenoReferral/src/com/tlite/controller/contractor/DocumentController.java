package com.tlite.controller.contractor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RequestWrapper;

import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.contractor.IDocument;
import com.tlite.dao.contractor.IDocumentImpl;



@WebServlet("/DocumentController")
public class DocumentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    IDocument docDao=new IDocumentImpl();
    IContractor contractorDao=new IContractorImpl();
    RequestDispatcher rd=null;
    int res=0;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		String action=request.getParameter("action");
     	String result=request.getParameter("result");
		
     	 
     	
     	    
     	     if(action!=null){
     	    	 
     		   if(result!=null){
          		
     			if(result.equals("documentUploaded")){
     				
     				request.setAttribute("SuccessMessage", "Document Uploaded");
     				
     			}else if(result.equals("documentUploadFailed")){
     				
     				request.setAttribute("ErrorMessage", "Document Not Uploaded");
     				
     			}else if(result.equals("documentDeleted")){
     				
     				request.setAttribute("SuccessMessage", "Document Deleted");
     				
     			}else if(result.equals("documentNotDeleted")){
     				
     				request.setAttribute("ErrorMessage", "Document Not Deleted");
     				
     			}else if(result.equals("documentUpdated")){
     				
     				request.setAttribute("SuccessMessage", "Document Updated");
     				
     			}else if(result.equals("documentUpdateFailed")){
     				
     				request.setAttribute("ErrorMessage", "Document Not Updated");
     				
     			}else if(result.equals("documentShared")){
     				
     				request.setAttribute("SuccessMessage", "Document Shared");
     				
     			}else if(result.equals("documentNotShared")){
     				
     				request.setAttribute("ErrorMessage", "Document Not Shared");
     				
     			}else if(result.equals("alreadyShared")){
     				
     				request.setAttribute("ErrorMessage", "Document Already Shared");
     				
     			}
     			
     			
     			  
     	    	 
     		   }
     	    	 
     		if(action.equalsIgnoreCase("showAllDocuments")){
     			   
     		request.setAttribute("documentTypes", contractorDao.getDocumentTypes(contractorId));
     			 
			request.setAttribute("documentlist", docDao.getAllDocuments(contractorId));
			
			rd=request.getRequestDispatcher("contractorDocuments.jsp");
			
			rd.forward(request, response);
			
            }
            
            
     	    
			
           
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("delete")){
			
			int document_id=Integer.parseInt(request.getParameter("document_id"));
			
			res=docDao.disableDocument(document_id);
			
			if(res>0){
			
				response.sendRedirect("DocumentController?action=showAllDocuments&result=documentDeleted");
				
			}else{
				
				response.sendRedirect("DocumentController?action=showAllDocuments&result=documentNotDeleted");
			}
			
		}else if(action.equalsIgnoreCase("share")){
			
			int document_id=Integer.parseInt(request.getParameter("document_id"));
			int  employee_id=Integer.parseInt(request.getParameter("employee_id"));
			
			
			         if(docDao.validateSharing(document_id,employee_id)){
				
			        	 response.sendRedirect("DocumentController?action=showAllDocuments&result=alreadyShared");  
				
			         }else{
				
				    res=docDao.shareDocument(document_id,employee_id);
					
					if(res>0){
					
						response.sendRedirect("DocumentController?action=showAllDocuments&result=documentShared");
						
					}else{
						
						response.sendRedirect("DocumentController?action=showAllDocuments&result=documentNotShared");
					}
			}
			
            
		}
			
		
	}

}
