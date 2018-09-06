package com.tlite.controller.lead;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
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

import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.pojo.Lead;
import com.tlite.pojo.LeadImages;
import com.tlite.utility.TimestampGenerator;


@WebServlet("/LeadRegister2")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)
public class LeadRegister2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Lead lead=new Lead();
       ILead leaddao=new ILeadImpl(); 
       String result="";
       RequestDispatcher rd=null;
       String path=null;
       LeadImages imagepath=new LeadImages();
       
       
   /*	private static final String SAVE_DIR="RenoLeadImages";*/
       
   
   	
       
       
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		int nextLeadID=leaddao.getNextLeadId();
		
		String leadId=String.valueOf(nextLeadID);
		
		   String realPath = getServletContext().getRealPath("/");
		   
		   
           System.out.println("realPath="+realPath);
           
		   	final String SAVE_DIR=realPath+"RenoReferralImages"+ File.separator;
		
		
		
		
		
		
		
		int service=Integer.parseInt(request.getParameter("service"));
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		long mobileNumber=Long.parseLong((request.getParameter("mobileNumber")));
		String postalCode=request.getParameter("postalCode");
		String description=request.getParameter("description");
		Timestamp timestamp=TimestampGenerator.getTimestamp();
		String address=request.getParameter("address");
		
		
	
		
		 String savePath =SAVE_DIR; //specify your path here
         
		 File fileSaveDir=new File(savePath);
         
         
         if(!fileSaveDir.exists()){
             fileSaveDir.mkdir();
         }

         
         
         
         List<Part> files=new ArrayList<>();  
         
         Part image1=request.getPart("uploadImage1");
         Part image2=request.getPart("uploadImage2");
         Part image3=request.getPart("uploadImage3");
         Part image4=request.getPart("uploadImage4");
         Part image5=request.getPart("uploadImage5");
         
         files.add(image1);
         files.add(image2);
         files.add(image3);
         files.add(image4);
         files.add(image5);
         
         
         
		     /*Part part=request.getPart("uploadImage");
		     String fileName=extractFileName(part);
		     part.write(savePath + File.separator + fileName);
				
		     String filePath= savePath + File.separator + fileName ;
		
		     System.out.println("ImagefilePath="+filePath);*/
         String fileName =null;
         
         List<String> filePaths=new ArrayList<>();
		    
		     for (Part part : files) {
		    	 
		     fileName = extractFileName(part);
		     
		      part.write(savePath + File.separator + fileName);
		      
	          filePaths.add("RenoReferralImages"+ File.separator+ fileName) ;
	         
			}
		     
		     
		     
   
		     
		     
		     
		        
		lead.setServiceId(service);
		lead.setName(name);
		lead.setEmail(email);
		lead.setMobile(mobileNumber);
		lead.setPostalCode(postalCode);
		lead.setDescription(description);
		lead.setTimestamp(timestamp);
		lead.setAddress(address);
		lead.setImage("Not Available");
		
		result=leaddao.registerLead(lead);
		
		
		
		System.out.println("Next Lead Id="+nextLeadID);
	    
	     for (String filepath : filePaths) {
	  
	    	 imagepath.setLeadId(nextLeadID);
	    	 imagepath.setImagePath(filepath);
	    	 System.out.println("filepaths="+filepath);
	    	 
	    	 
	    	 leaddao.saveImagePaths(imagepath);
		}
		
		
		
		
		
		
		
		if(result.equals("success")){
			
			request.setAttribute("SuccessMessage", "Lead Created Successfully");
			
			path="adminCreateLead.jsp";
		}
		
		else{
			
       request.setAttribute("ErrorMessage", "Something bad happened,Lead not created");
			
			path="adminCreateLead.jsp";
			
			
		}
		
		
		
		rd=request.getRequestDispatcher(path);
		rd.forward(request, response);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  resp.sendRedirect("adminCreateLead.jsp");
	}
  
	private String extractFileName(Part part) {
	    String contentDisp = part.getHeader("content-disposition");
	    String[] items = contentDisp.split(";");
	    for (String s : items) {
	        if (s.trim().startsWith("filename")) {
	            return s.substring(s.indexOf("=") + 2, s.length()-1);
	        }
	    }
		return "";
	
	}
	
}
