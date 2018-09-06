package com.tlite.dao.contractor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;

import com.tlite.connection.DBConnection;
import com.tlite.pojo.Employee;
import com.tlite.pojo.Store;
import com.tlite.pojo.StoreItems;

public class IStoreImpl implements IStore {
	 Connection con=null;
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	 int res;
	 String result="";
	 boolean status=false;
	@Override
	public List<Store> getAllStores(int contractor_id) {
		
		 List<Store> storesList=new ArrayList<>();
		 
		 con=DBConnection.getConnection();
		 
		query="SELECT * FROM contractor_stores WHERE contractorId=? AND store_status='active' ";
		
	        try {
        	
			ps=con.prepareStatement(query);
			ps.setInt(1, contractor_id);
	    	rs=ps.executeQuery();
            while(rs.next()){
            	
            	Store store=new Store();
        		
            	store.setStores_id(rs.getInt("contractor_stores_id"));
            	store.setContractor_id(rs.getInt("contractorId"));
            	store.setStore_name(rs.getString("store_name"));
            	store.setStore_email(rs.getString("store_email"));
            	store.setStore_address(rs.getString("store_address"));
            	store.setStore_mobile(rs.getLong("store_mobile"));
            	store.setStore_status(rs.getString("store_status"));
            	 
            	storesList.add(store);
            }	
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return storesList;
	}

	@Override
	public int addStore(Store store) {
		 con=DBConnection.getConnection();
			
			query="INSERT INTO contractor_stores(contractorId,"
					+ "store_name,store_address,store_email,store_mobile,store_status) "
					+ "VALUES(?,?,?,?,?,?)";
			
		
			try {
				
			ps=con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, store.getContractor_id());
			ps.setString(2, store.getStore_name());
			ps.setString(3, store.getStore_address());
			ps.setString(4, store.getStore_email());
			ps.setLong(5, store.getStore_mobile());
			ps.setString(6, "active");
			ps.executeUpdate();	
		   
			
			 rs = ps.getGeneratedKeys();
	         
			    while( rs.next()) {
			    	
			     res=rs.getInt(1);
			   
			     System.out.println("returned primary key="+res);
			    }
			
		    	
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			
			return res;
	}

	@Override
	public int addStoreItems(List<StoreItems> itemsList) {
		
		con=DBConnection.getConnection();
		
		query="INSERT INTO contractor_store_items(contractor_stores_id,"
				+ "item_name) VALUES(?,?)";
		
	
		try {
		
	   for (StoreItems storeItems : itemsList) {	
			
		ps=con.prepareStatement(query);
		ps.setInt(1, storeItems.getStores_id());
		ps.setString(2, storeItems.getItem_name());
		res=ps.executeUpdate();	
	    
		}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return res;
	
	}

	@Override
	public List<StoreItems> getStoreItems(int stores_id) {

		 List<StoreItems> itemsList=new ArrayList<>();
		 
		 con=DBConnection.getConnection();
		 
		query="SELECT * FROM contractor_store_items WHERE contractor_stores_id=?";
		
		
	        try {
       	
			ps=con.prepareStatement(query);
			ps.setInt(1, stores_id);
	    	rs=ps.executeQuery();
           while(rs.next()){
           	
        	   StoreItems item=new StoreItems();
       		    
        	   item.setStore_item_id(rs.getInt("store_item_id"));
        	   item.setStores_id(rs.getInt("contractor_stores_id"));
        	   item.setItem_name(rs.getString("item_name"));
        	   itemsList.add(item);
           }	
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return itemsList;
	}

	@Override
	public int disableStore(int store_id) {
		 con=DBConnection.getConnection();
			
			query="UPDATE contractor_stores  SET store_status='disabled' WHERE contractor_stores_id=?";
			
			
		
			try {
				
			ps=con.prepareStatement(query);
			ps.setInt(1,store_id);
			
			res=ps.executeUpdate();	
		   
		    	
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			
			return res;
	}

	@Override
	public Store getStore(int stores_id) {
		
		Store store=new Store();
		 
		 con=DBConnection.getConnection();
		 
		query="SELECT * FROM contractor_stores WHERE contractor_stores_id=?";
		
	        try {
       	
			ps=con.prepareStatement(query);
			ps.setInt(1, stores_id);
	    	rs=ps.executeQuery();
          
	    	while(rs.next()){
           	
        	store.setStores_id(rs.getInt("contractor_stores_id"));
           	store.setContractor_id(rs.getInt("contractorId"));
           	store.setStore_name(rs.getString("store_name"));
           	store.setStore_email(rs.getString("store_email"));
           	store.setStore_address(rs.getString("store_address"));
           	store.setStore_mobile(rs.getLong("store_mobile"));
           	store.setStore_status(rs.getString("store_status"));
           	 
           
           }	
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return 	store;
	}

	@Override
	public int updateStore(Store store) {
		
		con=DBConnection.getConnection();
		
		query="UPDATE contractor_stores "
				+ "SET store_name=?,"
				+ "store_address=?,"
				+ "store_email=?,"
				+ "store_mobile=? "
				+ "WHERE contractor_stores_id=?";
		
	
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setString(1,store.getStore_name());
		ps.setString(2,store.getStore_address());
		ps.setString(3,store.getStore_email());
		ps.setLong(4,store.getStore_mobile());
		ps.setInt(5,store.getStores_id());
		
		res=ps.executeUpdate();	
	   	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		return res;
	}

	@Override
	public int deleteStoreItems(int stores_id) {
		
     con=DBConnection.getConnection();
		
		query="DELETE FROM contractor_store_items WHERE contractor_stores_id=?";
		
	
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setInt(1,stores_id);
		res=ps.executeUpdate();	
	   	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		return res;
	}

	@Override
	public boolean validateSharing(int store_id, int employee_id) {
		 con=DBConnection.getConnection();
			
			query="SELECT share_store_id FROM contractor_shared_stores  WHERE contractor_stores_id=? AND employee_id=?" ;
			    
			        try {
				
				    ps=con.prepareStatement(query);
				       
						ps.setInt(1,store_id);  
						ps.setInt(2,employee_id);  
						
						rs=ps.executeQuery();  
						status=rs.next();  
						
				} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			return status;
	}

	@Override
	public int shareDocument(int store_id, int employee_id) {
con=DBConnection.getConnection();
		
		query="INSERT INTO contractor_shared_stores(contractor_stores_id,employee_id) VALUES(?,?)";
		
		
	
		try {
			
		ps=con.prepareStatement(query);
		ps.setInt(1,store_id);
		ps.setInt(2,employee_id);
		res=ps.executeUpdate();	
	   
	    	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return res;
	}

	@Override
	public List<Employee> getSharedList(int stores_id) {
		con=DBConnection.getConnection();
		
        query="SELECT ce.employee_id,ce.employee_name,ce.employee_type FROM contractor_employee ce JOIN contractor_shared_stores csd ON ce.employee_id=csd.employee_id  WHERE csd.contractor_stores_id=?" ;
      
		List<Employee> employeeList=new ArrayList<>();
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,stores_id);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
			Employee employee=new Employee();
			
			employee.setEmployee_id(rs.getInt("ce.employee_id"));
		
			employee.setEmployee_name(rs.getString("ce.employee_name"));
			
			employee.setEmployee_type(rs.getString("ce.employee_type"));	
				
			employeeList.add(employee);
			
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return  employeeList;
	}

}
