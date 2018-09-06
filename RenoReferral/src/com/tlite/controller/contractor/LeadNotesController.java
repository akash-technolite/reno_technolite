package com.tlite.controller.contractor;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.pojo.LeadNotes;
import com.tlite.utility.TimestampGenerator;

@WebServlet("/LeadNotesController")
public class LeadNotesController extends HttpServlet {
	 
	private static final long serialVersionUID = 1L;

	IContractor contratorDao = new IContractorImpl();
	ILead leaddao=new ILeadImpl();
	    private static final String UPLOAD_DIRECTORY = "upload";
	    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 200;  // 200MB
	    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 2000; // 2GB
	    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 2000; // 2GB

	String fileName = "";
	String filePath = "";
	String result = "";

	RequestDispatcher rd = null;
	String PATH = null;

    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    	String user=null;
    	/*HttpSession session=request.getSession(false);
  		int contractorId=(int) session.getAttribute("userId");*/
    	
    	int contractorId=0;
  		 int leadId=0;
  		String employee_id=null;
    	 String filePathsDatabase=null;
    	
    	
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
        
       List<String> fieldvalue = new ArrayList<>();
        
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
                       
                    	}
                    }else {
                    	
                    	
                        fieldvalue.add(item.getString());
                        
                        
                    }
                }
                
               
                
                for (String filePath2 : filePaths) {
					
                	String[] parts = filePath2.split(":");
            		String part1 = parts[0]; // 004
            		String part2 = parts[1]; // 034556
            		String str = "RenoReferral";
            		String newstring = part1.replaceAll(part1, str);
            		String finalPath=File.separator+newstring+part2;
        		
        		filePathsDatabase=finalPath;
        		
        		System.out.println("filePathsDatabase"+filePathsDatabase);
                }
                
                  
                for (String fv : fieldvalue) {
					
                	System.out.println("fields="+fv);
				}
    	    	
    	    	
       		    }
                
         Timestamp timestamp=TimestampGenerator.getTimestamp();
    		
   		 leadId=Integer.parseInt(fieldvalue.get(0));
   		 contractorId=Integer.parseInt(fieldvalue.get(2));
  		 employee_id=fieldvalue.get(3);
  	
   		 LeadNotes leadNote=new LeadNotes();
   		 
   		 leadNote.setLeadId(leadId);
   		 leadNote.setContractorId(contractorId);
   		 leadNote.setNote_timestamp(String.valueOf(timestamp));
   		 leadNote.setNote(fieldvalue.get(1));
   		 leadNote.setImagepath(filePathsDatabase);
   		 
   		HttpSession session= request.getSession(false);
   		
   		 user=(String) session.getAttribute("user");
   		  
   		if(user.equals("installer")){
   			
   			leadNote.setShare(1);
   			
   		}else{
   			
   			leadNote.setShare(0);
   		}
   		
   		
   		
   		 if(employee_id != null && !employee_id.isEmpty()){
   			 
   		 leadNote.setEmployee_id(Integer.parseInt(employee_id));
   		 
   		 }
   		 
   		  result=contratorDao.addLeadNote(leadNote);
                
                   
           
        } catch (Exception ex) {
            
             ex.printStackTrace();   
        }
       
       System.out.println("employee_id="+employee_id);
       
       if(employee_id != null && !employee_id.isEmpty()){
        
    	   
    	   if(user.equals("installer")){ 
    		   
    	   if(result.equals("success")){
				
				response.sendRedirect("InstallerController?action=installerleadNotes&lead_id="+leadId+"&employee_id="+employee_id+"&result=noteCreated");
			}
			
			else{
			
				response.sendRedirect("InstallerController?action=installerleadNotes&lead_id="+leadId+"&employee_id="+employee_id+"&result=noteNotCreated");	
			}	
    	  
    	   }else{
    		   
    		   if(result.equals("success")){
   				
   				response.sendRedirect("EstimatorController?action=estimatorleadNotes&lead_id="+leadId+"&employee_id="+employee_id+"&result=noteCreated");
   			}
   			
   			else{
   			
   				response.sendRedirect("EstimatorController?action=estimatorleadNotes&lead_id="+leadId+"&employee_id="+employee_id+"&result=noteNotCreated");	
   			}
    		   
    	   }
    	   
    	   
    	   
    	   
    	   
    	   
		}else{
			
			
			 if(result.equals("success")){
					
					response.sendRedirect("ContractorFlowController?action=leadNotes&lead_id="+leadId+"&result=noteCreated");
				}
				
				else{
				
					response.sendRedirect("ContractorFlowController?action=leadNotes&lead_id="+leadId+"&result=noteNotCreated");	
				}
			
			
			
		}
		
	
    }
   
   
    
    
}