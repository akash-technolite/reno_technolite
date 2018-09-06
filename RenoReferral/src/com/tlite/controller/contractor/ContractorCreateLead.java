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
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.subscriptions.ISubscriptionsImpl;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.mail.Mailer2;
import com.tlite.pojo.Assign;
import com.tlite.pojo.Lead;
import com.tlite.pojo.LeadImages;
import com.tlite.pojo.Locations;
import com.tlite.utility.TimestampGenerator;


@WebServlet("/ContractorCreateLead")
public class ContractorCreateLead extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	IContractor contractorDao=new IContractorImpl();
	RequestDispatcher rd=null;
	String PATH=null;
	IContractor idao=null;
	String result="";
	ISubscriptions subDao=new ISubscriptionsImpl();
	ILead leaddao=new ILeadImpl();
	IUser userDao=new IUserImpl();
	int res=0;
	
	    private static final String UPLOAD_DIRECTORY = "upload";
	    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 200;  // 200MB
	    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 2000; // 2GB
	    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 2000; // 2GB
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName="";
	    String filePath="";
	 
	       Lead lead=new Lead();
	       ILead leaddao=new ILeadImpl(); 
	       String result="";
	       String path=null;
	       LeadImages imagepath=new LeadImages();
	       HttpSession session=request.getSession(false);
	 
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
	                        
	                        
	                        System.out.println(filePath);
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
	                
	                  System.out.println(fieldvalue[0]);
	                
	                  int nextLeadID=leaddao.getNextLeadId();
	                 
	                int service=Integer.parseInt(fieldvalue[0]);
	    			String name=fieldvalue[2];
	    			String email=fieldvalue[5];
	    			long mobileNumber=Long.parseLong((fieldvalue[3]));
	    			String description=fieldvalue[8];
	    			Timestamp timestamp=TimestampGenerator.getTimestamp();
	    			String address=fieldvalue[7];
	    	    	String contractorId=fieldvalue[9];
	    	    	int budget_range_id=Integer.parseInt(fieldvalue[1]);
            	    
	    			Locations loc=new Locations();
	    			loc.setCityName(fieldvalue[6]);
	    			/*loc.setLocationName(fieldvalue[4]);*/
	    	    	
	    			String postalCode;
	    			
	    			
	    			int postal_code=leaddao.checkforLocation(fieldvalue[6]);
	    			
	    			if(postal_code>0){
	    				
	    				 postalCode=String.valueOf(postal_code);
	    			 
	    			
	    			}else{
	    				
	    				postalCode=String.valueOf(leaddao.addNewLocation(loc));
	    		    
	    			}
	    			
	    			System.out.println("postalCode Test:"+postalCode);
	    			
	    			lead.setServiceId(service);
	    			lead.setDescription(description);
	    			lead.setName(name);
	    			lead.setEmail(email);
	    			lead.setMobile(mobileNumber);
	    			lead.setPostalCode(postalCode);
	    			lead.setAddress(address);
	    			lead.setTimestamp(timestamp);
	    			lead.setImage("No");
	    			lead.setLead_status("applied"); 
	    			lead.setLead_type("contractor");
	    			lead.setMax_byers(1);
	    			lead.setBudget_range_id(budget_range_id);
	    			lead.setCity(fieldvalue[6]);
	    			if(!postalCode.equals('0')){
	    				
	    			result=leaddao.registerLead(lead);
	    	    	
	    			if(result.equals("success")){
	                
	                for (String filepathDatabase : filePathsDatabase) {
	              	  
	       	    	 imagepath.setLeadId(nextLeadID);
	       	    	 imagepath.setImagePath(filepathDatabase);
	       	    	 System.out.println("filepaths="+filepathDatabase);
	       	    	 
	       	    	 
	       	    	 leaddao.saveImagePaths(imagepath);
	       		    }
	                
	            
	                Assign a=new Assign();
	    			
	    			
	    			a.setContractorId(Integer.parseInt(contractorId));
	    			a.setLeadID(nextLeadID);
	    			
	    			
	    			
	    			result=contractorDao.applyLead(a);
	                
	    			contractorDao.addContractorLead(nextLeadID, Integer.parseInt(contractorId));
	                
	    			if(result.equals("success")){
	    				
	    				String to=email;
						String subject="RenoReferral:Registration Success";
						String msg=" Welcome to RenoReferral.\n Thank You for registering your requirements.Our Contractors will reach you soon\n"
								+ " Your Referrance no. is "+nextLeadID+"\n Please note down fo further queries.\n Fill free to contact us at renoreferral@gmail.com";
						
						Mailer2.send(to, subject, msg);
	    				
	    				
	    				
	    				/*request.setAttribute("SuccessMessage", "Lead Created Successfully");
	    				
	    				path="ShowContractor";*/
	    				res=userDao.updateContractorLimit("createLeadLimit",1,Integer.parseInt(contractorId));
	    				if(res>0){
	    					
	    					session.setAttribute("conLimit",contractorDao.getContractorLimits(Integer.parseInt(contractorId)));	
	    					
	    				response.sendRedirect("ContractorController?action=show&result=leadCreateSuccess");
	    				
	    				}else{
	    					
	    					response.sendRedirect("ContractorController?action=show&result=leadCreateFailed");	
	    				}
	    				}
	    			
	    			else{
	    				
	    	       /*request.setAttribute("ErrorMessage", "Lead Not created");
	    				
	    				path="ShowContractor";*/
	    				
	    				response.sendRedirect("ContractorController?action=show&result=leadCreateFailed");
	    			}   
	    			}else{
	    				
	    				response.sendRedirect("ContractorController?action=show&result=leadCreateFailed");
	    			}
	    			}else{
	    				
	    				response.sendRedirect("ContractorController?action=show&result=leadCreateFailed");
	    			}
	            }
	        } catch (Exception ex) {
	            
	             ex.printStackTrace();   
	        }
	       
	       
	        
			
			
	}
}

