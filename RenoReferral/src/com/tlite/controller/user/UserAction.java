package com.tlite.controller.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.tlite.dao.contractor.IContractor;
import com.tlite.dao.contractor.IContractorImpl;
import com.tlite.dao.lead.ILead;
import com.tlite.dao.lead.ILeadImpl;
import com.tlite.dao.subscriptions.ISubscriptions;
import com.tlite.dao.user.IUser;
import com.tlite.dao.user.IUserImpl;
import com.tlite.mail.Mailer2;
import com.tlite.pojo.Contractor;


@WebServlet("/UserAction")

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
maxFileSize = 1024 * 1024 * 10,         // 10MB
maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class UserAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UserAction() {
            
    }

    @SuppressWarnings("unused")
	private List<File> saveUploadedFiles(HttpServletRequest request)
            throws IllegalStateException, IOException, ServletException {
        List<File> listFiles = new ArrayList<File>();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        Collection<Part> multiparts = request.getParts();
        if (multiparts.size() > 0) {
            for (Part part : request.getParts()) {
                // creates a file to be saved
                String fileName = extractFileName(part);
                if (fileName == null || fileName.equals("")) {
                    // not attachment part, continue
                    continue;
                }
                 
                File saveFile = new File(fileName);
                System.out.println("saveFile: " + saveFile.getAbsolutePath());
                FileOutputStream outputStream = new FileOutputStream(saveFile);
                 
                // saves uploaded file
                InputStream inputStream = part.getInputStream();
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                outputStream.close();
                inputStream.close();
                 
                listFiles.add(saveFile);
            }
        }
        return listFiles;
    }
    
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    }

	IUser userDao=new IUserImpl();
	RequestDispatcher rd=null;
	String PATH=null;
	ISubscriptions subscriptionDao=null;
	ILead leaddao=new ILeadImpl();
	IContractor contractorDao=new IContractorImpl();
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String action=request.getParameter("action");		
		if(action.equalsIgnoreCase("show")){	
			
			if(request.getParameter("result")!=null){
			if(request.getParameter("result").equals("success")){
				request.setAttribute("SuccessMessage", "Contractor Added");
				
			}else if(request.getParameter("result").equals("error")){
				request.setAttribute("ErrorMessage", "Contractor Not Added");
				
			}else if(request.getParameter("result").equals("emailAlreadyRegistered")){
				
				 request.setAttribute("ErrorMessage", "Email already registered");
			}
			
			
			
			}
			
			
		request.setAttribute("contractorList", userDao.getAllContractors());
		PATH="createUser.jsp";	
		
		}
		
		else if(action.equalsIgnoreCase("register"))
		{
			int contractorId=Integer.parseInt(request.getParameter("contractorId")); 
			List<Contractor> contractorList=contractorDao.getContractorDetails(contractorId);

			HashSet<String> contractorServices=new HashSet<String>();  

			for (Contractor con : contractorList) {

			contractorServices.add(con.getServiceName());

			}

			           HashSet<String> contractorLocations=new HashSet<String>();  

			for (Contractor con : contractorList) {

			contractorLocations.add(con.getLocationName());

			}
			request.setAttribute("contractorList",contractorList) ;
			request.setAttribute("contractorServices",contractorServices) ;
			request.setAttribute("contractorLocations",contractorLocations) ;
			request.setAttribute("taxation", leaddao.getTaxation());
			
			
			
			
			
			//List<Subscriptions> subscriptionsList=subscriptionDao.getAllSubscription();

			
		//	request.setAttribute("serviceList", leaddao.getAllServices());
		//	request.setAttribute("LocationList", leaddao.getAllLocations());
			//request.setAttribute("subscriptionsList", subscriptionsList);			
			PATH="updateContractor.jsp";
		}
		
		rd=request.getRequestDispatcher(PATH);		
		rd.forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	
	String action=request.getParameter("button");
	String result="";
	if(action.equalsIgnoreCase("save"))
	{
		Contractor contractor=new Contractor();			
		 String contractorPassword=request.getParameter("contractorPassword");
         contractor.setContractorName(request.getParameter("contractorName"));
         contractor.setContractorEmail(request.getParameter("contractorEmail"));
         contractor.setContractorMobileNumber(Long.parseLong(request.getParameter("contractorMobileNumber")));
         contractor.setContractorCompany(request.getParameter("contractorCompany"));
		 contractor.setSubscriptionId(Integer.parseInt(request.getParameter("contractorSubscription")));
		 contractor.setPassword(request.getParameter("contractorPassword"));
		 contractor.setTax_id(Integer.parseInt(request.getParameter("taxation")));
		 System.out.println("contractorPassword"+contractorPassword);
		 String to=request.getParameter("contractorEmail");
		   
		    String subject="RenoReferral Reference No and Password ";  
		  
		    String msg="Your Reference no is:  "
		    		+ request.getParameter("contractorId")		    	
		    		+ "\nYour password is: "
		    	    + contractorPassword;  
		    
		    System.out.println(to+"-----"+subject+"----"+msg);
		    
		    
		if(request.getParameter("contractorId")!="")
		{
			
	        //List<File> uploadedFiles = saveUploadedFiles(request);
		    
		   /* Mailer.send(to, subject, msg); */
			result=Mailer2.send(to, subject, msg);
			
			if(result.equals("success")){
				
				request.setAttribute("SuccessMessage", "Email Sent Successfully");
			}
			
			else{
				
	       request.setAttribute("ErrorMessage", "Email Not Sent");
				
				
			}
			
		contractor.setContractorId(Integer.parseInt(request.getParameter("contractorId")));
		
		userDao.updateContractor(contractor);
		
		}
		
		request.setAttribute("contractorList", userDao.getAllContractors());
		PATH="createUser.jsp";	
	}
	
			rd=request.getRequestDispatcher(PATH);		
			rd.forward(request, response);
	}

    }