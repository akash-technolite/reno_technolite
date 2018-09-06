package com.tlite.controller.contractor;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tlite.dao.contractor.IStore;
import com.tlite.dao.contractor.IStoreImpl;
import com.tlite.pojo.Store;
import com.tlite.pojo.StoreItems;

@WebServlet("/StoreController")
public class StoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	IStore storeDao=new IStoreImpl();
    RequestDispatcher rd=null;
    int res=0;
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		String action=request.getParameter("action");
     	String result=request.getParameter("result");
		
     	 
     	 
     	    
     	     if(action!=null){
     	    	 
     		   if(result!=null){
          		
     			      
     			if(result.equals("storeAdded")){
     				
     				request.setAttribute("SuccessMessage", "Store Added");
     				
     			}else if(result.equals("storeNotAdded")){
     				
     				request.setAttribute("ErrorMessage", "Store Not Added");
     				
     			}else if(result.equals("storeItemsNotAdded")){
     				
     				request.setAttribute("ErrorMessage", "Store Items Not Added");
     				
     			}else if(result.equals("storeDeleted")){
     				
     				request.setAttribute("SuccessMessage", "Store Deleted");
     				
     			}else if(result.equals("storeNotDeleted")){
     				
     				request.setAttribute("ErrorMessage", "Store Not Deleted");
     				
     			}else if(result.equals("storeUpdated")){
     				
     				request.setAttribute("SuccessMessage", "Store Updated");
     				
     			}else if(result.equals("storeNotUpdated")){
     				
     				request.setAttribute("ErrorMessage", "Store Not Updated");
     				
     			}else if(result.equals("storeItemNotUpdated")){
     				
     				request.setAttribute("ErrorMessage", "Store Items Not Updated");
     				
     			}else if(result.equals("storeShared")){
     				
     				request.setAttribute("SuccessMessage", "Store Shared");
     				
     			}else if(result.equals("storeNotShared")){
     				
     				request.setAttribute("ErrorMessage", "Store Not Shared");
     				
     			}else if(result.equals("alreadyShared")){
     				
     				request.setAttribute("ErrorMessage", "Store Already Shared");
     				
     			}
     			
     			  
     		   }
     	    	 
     		if(action.equalsIgnoreCase("showAllStores")){
     			   
     			   
			request.setAttribute("storeslist", storeDao.getAllStores(contractorId));
			
			rd=request.getRequestDispatcher("contractorStores.jsp");
			
			rd.forward(request, response);
			
            }
            
            
     	    
			
           
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		int contractorId=(int) session.getAttribute("userId");
		String action=request.getParameter("action");
     	
		if(action.equalsIgnoreCase("addStore")){
			
			
			int new_store_id;
			
			Store store=new Store();
			
			store.setContractor_id(contractorId);
			store.setStore_name(request.getParameter("store_name"));
			store.setStore_address(request.getParameter("store_address"));
			store.setStore_email(request.getParameter("store_email"));
			store.setStore_mobile(Long.parseLong(request.getParameter("store_mobile")));
			
			new_store_id=storeDao.addStore(store);
			
			if(new_store_id>0){
				
				String items=request.getParameter("items");
				
				String itemsSplitted[]=items.split(",");
				
				for (String string : itemsSplitted) {
					System.out.println("splited:"+string);
				}
				
				List<StoreItems> itemslist=new ArrayList<>();
				
				
				for (int i = 0; i < itemsSplitted.length; i++) {
					
					StoreItems item=new StoreItems();
					
					item.setStores_id(new_store_id);
					
					item.setItem_name(itemsSplitted[i]);
					
					itemslist.add(item);
					
				}
				
				res=storeDao.addStoreItems(itemslist);
				
				if(res>0){
					
				response.sendRedirect("StoreController?action=showAllStores&result=storeAdded");
				
				}else{
					
					response.sendRedirect("StoreController?action=showAllStores&result=storeItemsNotAdded");
				}
				
				
			}else{
				
				response.sendRedirect("StoreController?action=showAllStores&result=storeNotAdded");
			}
			
			//delete Store
		}else if(action.equalsIgnoreCase("delete")){
			
			int store_id=Integer.parseInt(request.getParameter("store_id"));
			
			res=storeDao.disableStore(store_id);
			
			if(res>0){
				
				response.sendRedirect("StoreController?action=showAllStores&result=storeDeleted");
				
			}else{
				
				response.sendRedirect("StoreController?action=showAllStores&result=storeNotDeleted");
			}
			
		}else if(action.equalsIgnoreCase("update")){
			
			int store_id=Integer.parseInt(request.getParameter("store_id"));
           
			Store store=new Store();
			
			store.setStores_id(store_id);
			store.setStore_name(request.getParameter("store_name"));
			store.setStore_address(request.getParameter("store_address"));
			store.setStore_email(request.getParameter("store_email"));
			store.setStore_mobile(Long.parseLong(request.getParameter("store_mobile")));
			
			res=storeDao.updateStore(store);
			
		    	if(res>0){
				
				res=storeDao.deleteStoreItems(store_id);
				
				if(res>0){
					
				
				String items=request.getParameter("items");
				
				String itemsSplitted[]=items.split(",");
				
				for (String string : itemsSplitted) {
					System.out.println("splited:"+string);
				}
				
				List<StoreItems> itemslist=new ArrayList<>();
				
				
				for (int i = 0; i < itemsSplitted.length; i++) {
					
					StoreItems item=new StoreItems();
					
					item.setStores_id(store_id);
					
					item.setItem_name(itemsSplitted[i]);
					
					itemslist.add(item);
					
				}
				
				res=storeDao.addStoreItems(itemslist);
				
				if(res>0){
					
				response.sendRedirect("StoreController?action=showAllStores&result=storeUpdated");
				
				}else{
					
					response.sendRedirect("StoreController?action=showAllStores&result=storeItemNotUpdated");
				}
				
				}else{
					
					response.sendRedirect("StoreController?action=showAllStores&result=storeNotUpdated");
				}
				
				
				
			}else{
				
				response.sendRedirect("StoreController?action=showAllStores&result=storeNotUpdated");
			}
			
		}else if(action.equalsIgnoreCase("share")){
			
			int store_id=Integer.parseInt(request.getParameter("store_id"));
			int  employee_id=Integer.parseInt(request.getParameter("employee_id"));
			
			
			         if(storeDao.validateSharing(store_id,employee_id)){
				
			        	 response.sendRedirect("StoreController?action=showAllStores&result=alreadyShared");  
				
			         }else{
				
				    res=storeDao.shareDocument(store_id,employee_id);
					
					if(res>0){
					
						response.sendRedirect("StoreController?action=showAllStores&result=storeShared");
						
					}else{
						
						response.sendRedirect("StoreController?action=showAllStores&result=storeNotShared");
					}
			}
			
            
		}
		
		
		
		
		
		
		
		
		
		
	}

}
