package com.tlite.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter({"/installerComplaints.jsp",
	"/installerDashboard.jsp",
	"/installerDocuments.jsp",
	"/installerLeadComplaints.jsp",
	"/installerLeads.jsp",
	"/installerSidebar.jsp",
	"/installerStores.jsp",
	"/invoiceCheckout.jsp",})
public class InstallerFilter implements Filter {

   
    public InstallerFilter() {
        
    	
    }

	
	public void destroy() {
		
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		
			HttpSession session = req.getSession(false);
			
			System.out.println("Inside Admin Filter");
			System.out.println("user="+(String)session.getAttribute("user"));
			
			if (session==null) {
				
				res.sendRedirect("Index");
				
			}else{
				
			 if(session.getAttribute("user")==null){
				
				res.sendRedirect("Index");
				
			}else{ 
				
				if((String)session.getAttribute("user")!="installer"){
			
				session.invalidate();
				res.sendRedirect("Index");
				
				}else{
					
					chain.doFilter(req, res);
				}
			
			}
			
		}	
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
		
	}

}
