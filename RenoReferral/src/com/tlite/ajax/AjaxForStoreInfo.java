package com.tlite.ajax;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.tlite.dao.contractor.IStore;
import com.tlite.dao.contractor.IStoreImpl;
import com.tlite.pojo.Store;
import com.tlite.pojo.StoreItems;

@WebServlet("/AjaxForStoreInfo")
public class AjaxForStoreInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IStore storeDao=new IStoreImpl();   
	   
    public AjaxForStoreInfo() {
        super();
       
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int stores_id=Integer.parseInt(request.getParameter("stores_id"));
	    String  json= null;
		   
	     Store store=storeDao.getStore(stores_id);
	      
	     store.setStore_items(storeDao.getStoreItems(stores_id));
	      
	    
	    json= new Gson().toJson(store);
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
	    
	}
}
