package com.tlite.controller.contractor;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

import com.tlite.dao.contractor.IDocument;
import com.tlite.dao.contractor.IDocumentImpl;
import com.tlite.pojo.Document;


@WebServlet("/DocumentUploader")
public class DocumentUploader extends HttpServlet {
   private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIRECTORY = "upload";
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 200;  // 200MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 2000; // 2GB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 2000; // 2GB
    
    String fileName = "";
	String filePath = "";
    String result = "";
	RequestDispatcher rd = null;
	 IDocument docDao=new IDocumentImpl();
	int res=0;
    
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html");
    		
    	HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		
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
        
        String[] fieldvalue = new String[10];
        
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
                        
                        request.setAttribute("message","Upload has been done successfully!");
                    	
                        }
                    }else {
                    	
                    	
                        fieldvalue[i] = item.getString();
                        
                        System.out.println(i+"="+item.getString());
                        i++;
                    }
                }
                
                String finalPath="";
                
                for (String filePath2 : filePaths) {
					
			    String[] parts = filePath2.split(":");
        		String part1 = parts[0]; // 004
        		String part2 = parts[1]; // 034556
        		String str = "RenoReferral";
        		String newstring = part1.replaceAll(part1, str);
        	    finalPath=File.separator+newstring+part2;
        		  }
                
                  
                Document document=new Document();
                
                document.setContractor_id(contractorId);
                document.setDocument_name(fieldvalue[0]);
                document.setDocument_type(fieldvalue[1]);
                document.setDocument_description(fieldvalue[2]);
                document.setDocument_path(finalPath);
                
                res=docDao.saveDocument(document);
                
            }
        } catch (Exception ex) {
            
             ex.printStackTrace();   
        }
         
			if(res>0){
				
				response.sendRedirect("DocumentController?action=showAllDocuments&result=documentUploaded");
				
			}
			
			else{
				
					
				response.sendRedirect("DocumentController?action=showAllDocuments&result=documentUploadFailed");
				
				
			}                            
			
			
		  
        
		}
        
        

}
