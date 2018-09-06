package com.tlite.utility;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

public class RequestCleaner {
	
	
	
	public static boolean  clean(HttpServletRequest request){
		
		 Enumeration<String> e = request.getAttributeNames();
		 
		  while(e.hasMoreElements()){
			  
		     String attName = (String)e.nextElement();
		     request.removeAttribute(attName);
		     
		     
		     
		  }
		  
		    
		return true;
		
	};
	
	
	
	

}
