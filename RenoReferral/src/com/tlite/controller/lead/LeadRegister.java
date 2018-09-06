package com.tlite.controller.lead;

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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.mail.Mailer;
import com.tlite.mail.Mailer2;
import com.tlite.pojo.DefaultLeadSetting;
import com.tlite.pojo.Lead;
import com.tlite.pojo.LeadImages;
import com.tlite.pojo.Locations;
import com.tlite.utility.TimestampGenerator;


@WebServlet("/LeadRegister")
public class LeadRegister extends HttpServlet {

	private static final long serialVersionUID = 1L;
		String fileName="";
	    String filePath="";
	 
	       Lead lead=new Lead();
	       ILead leaddao=new ILeadImpl(); 
	       String result="";
	       RequestDispatcher rd=null;
	       String path=null;
	       LeadImages imagepath=new LeadImages();
	    private static final String UPLOAD_DIRECTORY = "upload";
	    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 200;  // 200MB
	    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 2000; // 2GB
	    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 2000; // 2GB
	    String email="";
	    int nextLeadID=0;
	    
	    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
	    	response.setContentType("text/html");
	    		
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
	        
	        nextLeadID=leaddao.getNextLeadId();
	        
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
	                        request.setAttribute("message",
	                            "Upload has been done successfully!");
	                    	}
	                    }else {
	                    	
	                    	
	                        fieldvalue[i] = item.getString();
	                        
	                        System.out.println(i+"="+item.getString());
	                        i++;
	                    }
	                }
	                
	                List<String> filePathsDatabase=new ArrayList<>();
	                
	                for (String filePath2 : filePaths) {
						
				    String[] parts = filePath2.split(":");
	        		String part1 = parts[0]; // 004
	        		String part2 = parts[1]; // 034556
	        		String str = "RenoReferral";
	        		String newstring = part1.replaceAll(part1, str);
	        		String finalPath=File.separator+newstring+part2;
	        		
	        		filePathsDatabase.add(finalPath);
	                }
	               
	                 int service=Integer.parseInt(fieldvalue[1]);
	                String description=fieldvalue[8];
	    			String name=fieldvalue[3];
	    			email=fieldvalue[6];
	    			long mobileNumber=Long.parseLong((fieldvalue[4]));
	    			String address=fieldvalue[9];
	    			Timestamp timestamp=TimestampGenerator.getTimestamp();
	    			int budget_range_id=Integer.parseInt(fieldvalue[2]);
	    			
	    			Locations loc=new Locations();
	    			loc.setCityName(fieldvalue[7]);
	    			/*loc.setLocationName(fieldvalue[5]);*/
	    	    	
	    			String postalCode;
	    			
	    			int postal_code=leaddao.checkforLocation(fieldvalue[7]);
	    			
	    			if(postal_code>0){
	    				
	    				 postalCode=String.valueOf(postal_code);
	    			 
	    			
	    			}else{
	    				
	    				postalCode=String.valueOf(leaddao.addNewLocation(loc));
	    		    
	    			}
	    			
            	    lead.setServiceId(service);
	    			lead.setDescription(description);
	    			lead.setName(name);
	    			lead.setEmail(email);
	    			lead.setMobile(mobileNumber);
	    			lead.setPostalCode(postalCode);
	    			lead.setAddress(address);
	    			lead.setTimestamp(timestamp);
	    			lead.setImage("No");
	    			lead.setLead_status("new");
	    			lead.setBudget_range_id(budget_range_id);
	    			lead.setCity(fieldvalue[7]);
	    			int maxByers=0;
	    			
	    			List<DefaultLeadSetting> defaultLead=leaddao.getDeafaultLeadSetting();
	    			
	    			for (DefaultLeadSetting defaultLeadSetting : defaultLead) {
						
	    				 maxByers=defaultLeadSetting.getMaxBuyers();
	    				
					}
	    			
	    			lead.setMax_byers(maxByers);
	    			lead.setSell_count(0);
	    			
	    			result=leaddao.registerLead(lead);
	    	    	
	                
	                for (String filepathDatabase : filePathsDatabase) {
	              	  
	       	    	 imagepath.setLeadId(nextLeadID);
	       	    	 imagepath.setImagePath(filepathDatabase);
	       	    	 System.out.println("filepaths="+filepathDatabase);
	       	    	 
	       	    	 
	       	    	 leaddao.saveImagePaths(imagepath);
	       		    }
	                
	                
	                
	                
	                
	                
	                
	            }
	        } catch (Exception ex) {
	            
	             ex.printStackTrace();   
	        }
	       
	       
	        
			
			
			
			String page=fieldvalue[0];
			
			System.out.println("page="+page);
			
			if(page.equals("index")){
				
				
				
				if(result.equals("success")){
					
					String to=email;
					String subject="RenoReferral:Registration Success";
					String msg=" Welcome to RenoReferral.\n Thank You for registering your requirements.Our Contractors will reach you soon\n"
							+ " Your Referrance no. is "+nextLeadID+"\n Please note down fo further queries.\n Fill free to contact us at renoreferral@gmail.com";
					
					Mailer2.send(to, subject, msg);
					
					request.setAttribute("SuccessMessage", "Lead Created Successfully");
					
					path="leadRegisterSuccess.jsp";
					
				}else{
					
					
					  
					
		       request.setAttribute("ErrorMessage", "Lead Not created");
					
					path="Index?result=0";
					
					
				}                            
				
				
			   request.setAttribute("LeadId",nextLeadID);
				rd=request.getRequestDispatcher(path);
				rd.forward(request, response);	
				
				
				
			}else{
				
				if(result.equals("success")){
					
					String to=email;
					String subject="RenoReferral:Registration Success";
					String msg=" Welcome to RenoReferral.\n Thank You for registering your requirements.Our Contractors will reach you soon\n"
							+ " Your Referrance no. is "+nextLeadID+"\n Please note down fo further queries.\n Fill free to contact us at renoreferral@gmail.com";
					
					Mailer2.send(to, subject, msg);
					  
					/*request.setAttribute("SuccessMessage", "Lead Created Successfully");*/
					
					path="LeadAction?result=1";
				}
				
				else{
					
					 
					  
					
		      /* request.setAttribute("ErrorMessage", "Lead Not created");*/
					
					path="LeadAction?result=0";
					
					
				}
				
				response.sendRedirect(path);
			/*rd=request.getRequestDispatcher(path);
			rd.forward(request, response);*/
	        
			}
	        
	        
	        
	    }
	    
	    
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    	
	    	path="Index";
			
		
	    	
	    	
	    	
		rd=request.getRequestDispatcher(path);
		rd.forward(request, response);
	    }
	    
	    
	    
	    
	    
	    
	    
	}