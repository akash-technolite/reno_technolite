package com.tlite.controller.subscriptions;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.pojo.Subscriptions;

@WebServlet("/CreateSubscription")


public class CreateSubscription extends HttpServlet  {


	private static final long serialVersionUID = 1L;
	Subscriptions sub=new Subscriptions();
	ISubscriptions subDao=new ISubscriptionsImpl();
	RequestDispatcher rd=null;
	InputStream inputStream = null;
	String fileName="";
    String filePath="";
    String result="";
    String message="";
    private static final String UPLOAD_DIRECTORY = "upload";
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 200;  // 200MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 2000; // 2GB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 2000; // 2GB
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rd=request.getRequestDispatcher("createSubscription.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
		 
		
		 
		 
		 if (!ServletFileUpload.isMultipartContent(request)) {
	            PrintWriter writer = response.getWriter();
	            writer.println("Error: Form must has enctype=multipart/form-data.");
	            writer.flush();
	            return;
	        }
	        
	        List<String> filePaths=new ArrayList<>();
	        
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        factory.setSizeThreshold(MEMORY_THRESHOLD);
	        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	        ServletFileUpload upload = new ServletFileUpload(factory);
	        upload.setFileSizeMax(MAX_FILE_SIZE);
	        upload.setSizeMax(MAX_REQUEST_SIZE);
	        String uploadPath = "C:" + File.separator + UPLOAD_DIRECTORY;
	        
	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdir();
	        }
	        
	        String[] fieldvalue = new String[20];
	        int i=0;
	        try {
	            List<FileItem> formItems = upload.parseRequest(request);
	            if (formItems != null && formItems.size() > 0) {
	                for (FileItem item : formItems) {
	                    if (!item.isFormField()) {
	                    	
	                    	
	                        fileName = new File(item.getName()).getName(); 
	                        
	                        if(fileName.length()>0){
	                        
	                        filePath = uploadPath + File.separator + fileName;
	                        File storeFile = new File(filePath);
	                        item.write(storeFile);
	                        filePaths.add(filePath);
	                        request.setAttribute("message",
	                            "Upload has been done successfully!");
	                    	}
	                    }else {
	                    	
	                    	
	                        fieldvalue[i] = item.getString();
	                        System.out.println(i+"="+fieldvalue[i]);
	                        i++;
	                    }
	                }
	                
	                String filePathsDatabase=null;
	                
	                for (String filePath2 : filePaths) {
						
				    String[] parts = filePath2.split(":");
	        		String part1 = parts[0]; // 004
	        		String part2 = parts[1]; // 034556
	        		String str = "RenoReferral";
	        		String newstring = part1.replaceAll(part1, str);
	        		String finalPath=File.separator+newstring+part2;
	        		filePathsDatabase=finalPath;
	                }
	                
	                  System.out.println(fieldvalue[0]);
		 
		 
		   	
		   	   	
	                  System.out.println("purchase lead limit="+fieldvalue[4]); 	
		   	
		 String subscriptionName=fieldvalue[0];
		 String renoRefLeads=fieldvalue[1];
		 String renoLeadLimit=fieldvalue[2];
		 String purchaseLeads=fieldvalue[3];
		 String purchaseLeadLimit=fieldvalue[4];
		 String createLeads=fieldvalue[5];
		 String createLeadLimit=fieldvalue[6];
		 String createEmployees=fieldvalue[7];
		 String createEmployeeLimit=fieldvalue[8];
		 String createSubcontractors=fieldvalue[9];
		 String createSubConLimit=fieldvalue[10];
		 /*String leadManagement=request.getParameter("leadManagement");*/
		 String signContact=fieldvalue[11];
		 String price=fieldvalue[12];
		 String visibility=fieldvalue[13];
		 String note=fieldvalue[14];

		
		 sub.setSubscriptionName(subscriptionName);
		 sub.setRenoRefLeads(renoRefLeads);
		 sub.setPurchaseLeads(purchaseLeads);
		 sub.setCreateLeads(createLeads);
		 sub.setCreateEmployees(createEmployees);
		 /*sub.setLeadManagement(leadManagement);*/
		 sub.setSignContact(signContact);
		 sub.setDuration(30);
		 sub.setCreateSubcontractors(createSubcontractors);
		 
		 
		
			 
			
			 sub.setRenoLeadLimit(renoLeadLimit);
		     sub.setPurchaseLeadLimit(purchaseLeadLimit); 
			 sub.setCreateLeadLimit(createLeadLimit);
		     sub.setCreateEmployeeLimit(createEmployeeLimit);
			 sub.setCreateSubConLimit(createSubConLimit);
		
		
			 
		 
		 if(filePathsDatabase!=null){
			 
			 sub.setUploadContact(filePathsDatabase);
			 
		 }
		 else{
			 
			 sub.setUploadContact("No Document to Show");
			 
		 }
		 
		 sub.setPrice(price);
		 sub.setNote(note);
		 sub.setVisibility(visibility);
		 
		 
		
			 result=subDao.createSubscription(sub);
			
	            }
	        } catch (Exception ex) {
	            
	             ex.printStackTrace();   
	        }
	       
		
		 
	        
	        
	        
	        
		    if(result.equals("Success")){
		    	
		    	response.sendRedirect("SubscriptionAction?result=success");
		    }
		    else {
		    	
		    	response.sendRedirect("SubscriptionAction?result=error");
		    }   
	        
	        
		  
		/* rd=request.getRequestDispatcher("createSubscription.jsp");
		 
		 rd.forward(request, response);*/
		 
		 
		
	}

	
	
}
