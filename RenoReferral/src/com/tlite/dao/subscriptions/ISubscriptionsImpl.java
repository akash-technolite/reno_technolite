package com.tlite.dao.subscriptions;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;

import com.tlite.connection.DBConnection;
import com.tlite.pojo.DefaultLeadSubscriptions;
import com.tlite.pojo.SubscriptionQueue;
import com.tlite.pojo.SubscriptionTransaction;
import com.tlite.pojo.Subscriptions;

public class ISubscriptionsImpl implements ISubscriptions {

	 Connection con=null;
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	 Subscriptions sub=new Subscriptions();
	 int count=0;
	 String result=null;
	 boolean status=false;
	 
	@Override
	public String createSubscription(Subscriptions sub){
		
		con=DBConnection.getConnection();
		
		query="INSERT INTO subscriptions(subscriptionName,"
				+ "renoRefLeads,purchaseLeads,createLeads,createEmployees,createSubcontractors,"
				+ "LeadManagement,signContact,uploadContact,price,note,visibility,"
				+ "renoLeadLimit,purchaseLeadLimit,createLeadLimit,createEmployeeLimit,createSubConLimit,duration) "
				+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		
		try {
			
		ps=con.prepareStatement(query);
		ps.setString(1, sub.getSubscriptionName());
		ps.setString(2, sub.getRenoRefLeads());
		ps.setString(3, sub.getPurchaseLeads());
		ps.setString(4, sub.getCreateLeads());
		ps.setString(5, sub.getCreateEmployees());
		ps.setString(6, sub.getCreateSubcontractors());
		ps.setString(7, "Not Allowed");
		ps.setString(8, sub.getSignContact());
		ps.setString(9,  sub.getUploadContact());
		ps.setString(10, sub.getPrice());
		ps.setString(11, sub.getNote());
		ps.setString(12, sub.getVisibility());
		ps.setString(13, sub.getRenoLeadLimit());
		ps.setString(14, sub.getPurchaseLeadLimit());
		ps.setString(15, sub.getCreateLeadLimit());
		ps.setString(16, sub.getCreateEmployeeLimit());
		ps.setString(17, sub.getCreateSubConLimit());
		ps.setInt(18, sub.getDuration());
	    count=ps.executeUpdate();	
	   
	    
	    if(count>0){
	    	System.out.println("Subscription Added");
	    	result="Success";
	    }
	    else{
	    	
	    	result="Error";
	    }
	    
	    
	    
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return result;
	}



	@Override
	public List<Subscriptions> getAllSubscription() {
		
		con=DBConnection.getConnection();
		
		List<Subscriptions> subList=new ArrayList<>();
		
		query="SELECT * ,COUNT(e.subscriptionId) AS count FROM   subscriptions   o LEFT   JOIN contractor e ON e.subscriptionId = o.subscriptionId where o.visibility='Public'  GROUP  BY o.subscriptionId";
		try {
			
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				Subscriptions sub=new Subscriptions();
				sub.setSubscriptionId(rs.getInt("subscriptionId"));
				sub.setSubscriptionName(rs.getString("subscriptionName"));
				sub.setRenoRefLeads(rs.getString("renoRefLeads"));
				sub.setPurchaseLeads(rs.getString("purchaseLeads"));
				sub.setCreateLeads(rs.getString("createLeads"));
				sub.setCreateEmployees(rs.getString("createEmployees"));
				sub.setCreateSubcontractors(rs.getString("createSubcontractors"));
				sub.setLeadManagement(rs.getString("LeadManagement"));
				sub.setSignContact(rs.getString("signContact"));
				sub.setUploadContact(rs.getString("uploadContact"));
				sub.setPrice(rs.getString("price"));
				sub.setNote(rs.getString("note"));
				sub.setVisibility(rs.getString("visibility"));
				sub.setSubscriberCount(rs.getInt("count"));
				sub.setRenoLeadLimit(rs.getString("renoLeadLimit"));
				sub.setPurchaseLeadLimit(rs.getString("purchaseLeadLimit"));
				sub.setCreateLeadLimit(rs.getString("createLeadLimit"));
				sub.setCreateEmployeeLimit(rs.getString("createEmployeeLimit")); 
				sub.setCreateSubConLimit(rs.getString("createSubConLimit"));
				sub.setDuration(rs.getInt("duration"));
				subList.add(sub);
			
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return subList;
	}



	@Override
	public List<DefaultLeadSubscriptions> getAllDefaultSubscription() {
		
		con=DBConnection.getConnection();
		
  List<DefaultLeadSubscriptions> subList=new ArrayList<>();
		
		query="SELECT DISTINCT(subscriptionId) FROM defaultleadsubscriptions";
		try {
			
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				
				DefaultLeadSubscriptions sub=new DefaultLeadSubscriptions();
				sub.setSubscriptionId(rs.getInt(1));;
				subList.add(sub);
	}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return subList;
	


	}



	@Override
	public Subscriptions getSubscriptionById(int subId) {
		
		con=DBConnection.getConnection();
		
		query="SELECT * FROM   subscriptions   WHERE subscriptionId=? ";
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1, subId);
			rs=ps.executeQuery();
			while(rs.next()){
				
				sub.setSubscriptionId(rs.getInt("subscriptionId"));
				sub.setSubscriptionName(rs.getString("subscriptionName"));
				sub.setRenoRefLeads(rs.getString("renoRefLeads"));
				sub.setPurchaseLeads(rs.getString("purchaseLeads"));
				sub.setCreateLeads(rs.getString("createLeads"));
				sub.setCreateEmployees(rs.getString("createEmployees"));
				sub.setCreateSubcontractors(rs.getString("createSubcontractors"));
				sub.setLeadManagement(rs.getString("LeadManagement"));
				sub.setSignContact(rs.getString("signContact"));
				sub.setUploadContact(rs.getString("uploadContact"));
				sub.setPrice(rs.getString("price"));
				sub.setNote(rs.getString("note"));
				sub.setVisibility(rs.getString("visibility"));
				sub.setRenoLeadLimit(rs.getString("renoLeadLimit"));
				sub.setPurchaseLeadLimit(rs.getString("purchaseLeadLimit"));
				sub.setCreateLeadLimit(rs.getString("createLeadLimit"));
				sub.setCreateEmployeeLimit(rs.getString("createEmployeeLimit")); 
				sub.setCreateSubConLimit(rs.getString("createSubConLimit"));
				sub.setDuration(rs.getInt("duration"));
				//sub.setSubscriberCount(rs.getInt("count"));
				
							
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return sub;
		
	}



	@Override
	public List<Subscriptions> getAllSubscriptionPrivate() {
		
		con=DBConnection.getConnection();
		
		List<Subscriptions> subList=new ArrayList<>();
		
		query="SELECT * ,COUNT(e.subscriptionId) AS count FROM   subscriptions   o LEFT   JOIN contractor e ON e.subscriptionId = o.subscriptionId where o.visibility='Private' GROUP  BY o.subscriptionId";
		try {
			
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				Subscriptions sub=new Subscriptions();
				sub.setSubscriptionId(rs.getInt("subscriptionId"));
				sub.setSubscriptionName(rs.getString("subscriptionName"));
				sub.setRenoRefLeads(rs.getString("renoRefLeads"));
				sub.setPurchaseLeads(rs.getString("purchaseLeads"));
				sub.setCreateLeads(rs.getString("createLeads"));
				sub.setCreateEmployees(rs.getString("createEmployees"));
				sub.setCreateSubcontractors(rs.getString("createSubcontractors"));
				sub.setLeadManagement(rs.getString("LeadManagement"));
				sub.setSignContact(rs.getString("signContact"));
				sub.setUploadContact(rs.getString("uploadContact"));
				sub.setPrice(rs.getString("price"));
				sub.setNote(rs.getString("note"));
				sub.setVisibility(rs.getString("visibility"));
				sub.setSubscriberCount(rs.getInt("count"));
				sub.setRenoLeadLimit(rs.getString("renoLeadLimit"));
				sub.setPurchaseLeadLimit(rs.getString("purchaseLeadLimit"));
				sub.setCreateLeadLimit(rs.getString("createLeadLimit"));
				sub.setCreateEmployeeLimit(rs.getString("createEmployeeLimit")); 
				sub.setCreateSubConLimit(rs.getString("createSubConLimit"));
				sub.setDuration(rs.getInt("duration"));
				subList.add(sub);
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return subList;
	}



	@Override
	public String updateSubscription(Subscriptions sub) {
		
		con=DBConnection.getConnection();
		
		query="update subscriptions set subscriptionName=?,renoRefLeads=?,purchaseLeads=?,createLeads=?,"
				+ "createEmployees=?,createSubcontractors=?,LeadManagement=?,signContact=?,uploadContact=?,"
				+ "price=?,note=?,visibility=?,renoLeadLimit=?,purchaseLeadLimit=?,"
				+ "createLeadLimit=?,createEmployeeLimit=?,createSubConLimit=? "
				+ "WHERE subscriptionId=? ";
		
		try {
			
		ps=con.prepareStatement(query);
		ps.setString(1, sub.getSubscriptionName());
		ps.setString(2, sub.getRenoRefLeads());
		ps.setString(3, sub.getPurchaseLeads());
		ps.setString(4, sub.getCreateLeads());
		ps.setString(5, sub.getCreateEmployees());
		ps.setString(6, sub.getCreateSubcontractors());
		ps.setString(7, "Not Allowed");
		ps.setString(8, sub.getSignContact());
		ps.setString(9,  sub.getUploadContact());
		ps.setString(10, sub.getPrice());
		ps.setString(11, sub.getNote());
		ps.setString(12, sub.getVisibility());
		ps.setString(13, sub.getRenoLeadLimit());
		ps.setString(14, sub.getPurchaseLeadLimit());
		ps.setString(15, sub.getCreateLeadLimit());
		ps.setString(16, sub.getCreateEmployeeLimit());
		ps.setString(17, sub.getCreateSubConLimit());
		ps.setInt(18, sub.getSubscriptionId());
		
		
		System.out.println(ps);
	    count=ps.executeUpdate();	
	   
	    
	    if(count>0){
	    	System.out.println("Subscription Added");
	    	result="Success";
	    }
	    else{
	    	
	    	result="Error";
	    }
	    
	    
	    
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return result;
	}



	@Override
	public List<Subscriptions> getSubscriptions() {
		
		con=DBConnection.getConnection();
		
        List<Subscriptions> subList=new ArrayList<>();
		
		query="SELECT * ,COUNT(e.subscriptionId) AS count FROM   subscriptions   o LEFT   JOIN contractor e ON e.subscriptionId = o.subscriptionId  GROUP  BY o.subscriptionId";
		try {
			
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				Subscriptions sub=new Subscriptions();
				sub.setSubscriptionId(rs.getInt("subscriptionId"));
				sub.setSubscriptionName(rs.getString("subscriptionName"));
				sub.setRenoRefLeads(rs.getString("renoRefLeads"));
				sub.setPurchaseLeads(rs.getString("purchaseLeads"));
				sub.setCreateLeads(rs.getString("createLeads"));
				sub.setCreateEmployees(rs.getString("createEmployees"));
				sub.setCreateSubcontractors(rs.getString("createSubcontractors"));
				sub.setLeadManagement(rs.getString("LeadManagement"));
				sub.setSignContact(rs.getString("signContact"));
				sub.setUploadContact(rs.getString("uploadContact"));
				sub.setPrice(rs.getString("price"));
				sub.setNote(rs.getString("note"));
				sub.setVisibility(rs.getString("visibility"));
				sub.setSubscriberCount(rs.getInt("count"));
				sub.setRenoLeadLimit(rs.getString("renoLeadLimit"));
				sub.setPurchaseLeadLimit(rs.getString("purchaseLeadLimit"));
				sub.setCreateLeadLimit(rs.getString("createLeadLimit"));
				sub.setCreateEmployeeLimit(rs.getString("createEmployeeLimit")); 
				sub.setCreateSubConLimit(rs.getString("createSubConLimit"));
				sub.setDuration(rs.getInt("duration"));
				subList.add(sub);
			
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return subList;
	}



	@Override
	public List<Subscriptions> getContractorsSubscriptionsById(int serviceId, int locationId) {
		
		con=DBConnection.getConnection();
		
		List<Subscriptions> subList=new ArrayList<>();
			
			query="SELECT c.subscriptionId,s.subscriptionName "
					+ "FROM contractor c "
					+ "JOIN subscriptions s  ON c.subscriptionId=s.subscriptionId "
					+ "JOIN contractorservices cs ON cs.contractorId=c.contractorId "
					+ "JOIN contractorlocations col ON col.contractorId=c.contractorId  "
					+ "WHERE cs.serviceId=? "  
					+ "AND col.locationId=? GROUP BY c.subscriptionId";
			try {
				
				ps=con.prepareStatement(query);
				ps.setInt(1,serviceId);
				ps.setInt(2,locationId);
				rs=ps.executeQuery();
				while(rs.next()){
					Subscriptions sub=new Subscriptions();
					
					sub.setSubscriptionId(rs.getInt(1));
					sub.setSubscriptionName(rs.getString(2));
					subList.add(sub);
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			return subList;
	}



	@Override
	public List<Subscriptions> getAllTotalSubscription() {
		
		con=DBConnection.getConnection();
		
		List<Subscriptions> subList=new ArrayList<>();
		/*s.renoRefLeads!='Not Allowed'*/
		query="SELECT s.subscriptionId,s.subscriptionName,s.visibility FROM  subscriptions s WHERE s.visibility!='Disable' AND s.visibility!='Default' ORDER BY s.visibility" ;
		try {
			
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			while(rs.next()){
				Subscriptions sub=new Subscriptions();
				
				sub.setSubscriptionId(rs.getInt(1));
				sub.setSubscriptionName(rs.getString(2)+" ("+rs.getString(3)+")");
				subList.add(sub);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return subList;
	}



	@Override
	public int makePrivate(int subscription_id) {
        con=DBConnection.getConnection();
		query="UPDATE subscriptions s SET s.visibility='Private' WHERE s.subscriptionId=?" ;
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1, subscription_id);
			count=ps.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return count;
	}



	@Override
	public int disableSubscription(int subscription_id) {
		 con=DBConnection.getConnection();
			query="UPDATE subscriptions s SET s.visibility='Disable' WHERE s.subscriptionId=?" ;
			try {
				
				ps=con.prepareStatement(query);
				ps.setInt(1, subscription_id);
				count=ps.executeUpdate();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return count;
	}



	@Override
	public int makePublic(int subscription_id) {
		 con=DBConnection.getConnection();
			query="UPDATE subscriptions s SET s.visibility='Public' WHERE s.subscriptionId=?" ;
			try {
				
				ps=con.prepareStatement(query);
				ps.setInt(1, subscription_id);
				count=ps.executeUpdate();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return count;
	}



	@Override
	public int addNewSubscriptionTransaction(SubscriptionTransaction transaction) {

		con=DBConnection.getConnection();
		
		query="INSERT INTO subscription_transactions(transaction_time,"
				+ "contractorId,subscription_start_date,subscription_end_date) "
				+ "VALUES(?,?,?,?)";
		
		
		try {
			
				
		ps=con.prepareStatement(query);
		ps.setTimestamp(1, transaction.getTransaction_time());
		ps.setInt(2,  transaction.getContractorId());
		ps.setDate(3, transaction.getSubscription_start_date());
		ps.setDate(4, transaction.getSubscription_end_date());
		
		
	    count=ps.executeUpdate();	
	   
	    
	    
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return count;
	}



	@Override
	public SubscriptionTransaction getLastTransaction(int contractorId) {
		
		SubscriptionTransaction transaction=new SubscriptionTransaction();
		
		query="SELECT * FROM subscription_transactions WHERE st.contractorId=? ORDER BY st.transaction_id DESC LIMIT 1";
		try {
			
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			ps.setInt(1,contractorId);
			while(rs.next()){
				
				transaction.setTransaction_id(rs.getInt("transaction_id"));
				transaction.setContractorId(rs.getInt("contractorId"));
				transaction.setSubscription_start_date(rs.getDate("subscription_start_date"));
				transaction.setSubscription_end_date(rs.getDate("subscription_end_date"));
				transaction.setTransaction_time(rs.getTimestamp("transaction_time"));
			
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return transaction;
	}



	@Override
	public int getSubscriptionRemainingDays(int contractorId) {
		
		 int remaining_days=0;
		 
		 con=DBConnection.getConnection();
		 
		query="SELECT datediff(st.subscription_end_date,CURDATE()) "
				+ "FROM subscription_transactions st "
				+ "WHERE st.contractorId=? "
				+ "ORDER BY st.transaction_id DESC LIMIT 1";
		try {
			
			ps=con.prepareStatement(query);
			
			ps.setInt(1,contractorId);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				remaining_days=rs.getInt(1);
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			DbUtils.closeQuietly(con, ps, rs);
			
		}
		
		return remaining_days;
		
		
	}



	@Override
	public Subscriptions getDefaultSubscription() {
         con=DBConnection.getConnection();
         Subscriptions sub=new Subscriptions();
		query="SELECT * ,COUNT(e.subscriptionId) AS count FROM   subscriptions   o LEFT   JOIN contractor e ON e.subscriptionId = o.subscriptionId where o.visibility='Default' GROUP  BY o.subscriptionId";
		try {
			
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				sub.setSubscriptionId(rs.getInt("subscriptionId"));
				sub.setSubscriptionName(rs.getString("subscriptionName"));
				sub.setRenoRefLeads(rs.getString("renoRefLeads"));
				sub.setPurchaseLeads(rs.getString("purchaseLeads"));
				sub.setCreateLeads(rs.getString("createLeads"));
				sub.setCreateEmployees(rs.getString("createEmployees"));
				sub.setCreateSubcontractors(rs.getString("createSubcontractors"));
				sub.setLeadManagement(rs.getString("LeadManagement"));
				sub.setSignContact(rs.getString("signContact"));
				sub.setUploadContact(rs.getString("uploadContact"));
				sub.setPrice(rs.getString("price"));
				sub.setNote(rs.getString("note"));
				sub.setVisibility(rs.getString("visibility"));
				sub.setSubscriberCount(rs.getInt("count"));
				sub.setRenoLeadLimit(rs.getString("renoLeadLimit"));
				sub.setPurchaseLeadLimit(rs.getString("purchaseLeadLimit"));
				sub.setCreateLeadLimit(rs.getString("createLeadLimit"));
				sub.setCreateEmployeeLimit(rs.getString("createEmployeeLimit")); 
				sub.setCreateSubConLimit(rs.getString("createSubConLimit"));
				sub.setDuration(rs.getInt("duration"));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return sub;
	}



	@Override
	public int addNewSubscriptionQueue(SubscriptionQueue queue) {
con=DBConnection.getConnection();
		
		query="INSERT INTO subscription_queue(contractorId,"
				+ "subscriptionId,previousSubId) "
				+ "VALUES(?,?,?)";
		
		
		try {
		
		ps=con.prepareStatement(query);
		ps.setInt(1,  queue.getContractorId());
		ps.setInt(2, queue.getSubscriptionId());
		ps.setInt(3, queue.getPreviousSubId());
		
		
	    count=ps.executeUpdate();	
	   
	    
	    
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return count;
	}



	@Override
	public SubscriptionQueue getSubscriptionQueue(int contractorId) {
		
		 con=DBConnection.getConnection();
		 
		 SubscriptionQueue queue=new SubscriptionQueue();
		 
		query="SELECT * FROM subscription_queue WHERE contractorId=?";
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				queue.setContractorId(rs.getInt("subscriptionId"));
				queue.setSubscriptionId(rs.getInt("subscriptionId"));
				queue.setPreviousSubId(rs.getInt("subscriptionId"));
				queue.setQueued_time(rs.getTimestamp("queued_time"));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return queue;
	}



	@Override
	public boolean checkSubscriptionQueueAvailability(int contractorId) {
		con=DBConnection.getConnection();
		
		query="SELECT queue_id FROM subscription_queue  WHERE contractorId=?" ;
		    
		        try {
			
			    ps=con.prepareStatement(query);
			       
					ps.setInt(1,contractorId);  
				
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
	public int deleteSubscriptionQueue(int contractorId) {
con=DBConnection.getConnection();
		
		query="DELETE FROM subscription_queue  WHERE contractorId=?" ;
		    
		        try {
			
			    ps=con.prepareStatement(query);
			    ps.setInt(1,contractorId);  
				count=ps.executeUpdate();  
				
					
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return count;
	}



	@Override
	public int getDefaultSubscriptionId() {
		
		con=DBConnection.getConnection();
		
       int default_id=0;
     
		query="SELECT subscriptionId FROM   subscriptions WHERE visibility='Default'";
		
		try {
			
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				default_id=rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return default_id;
	}



	@Override
	public String updateDefaultSubscription(Subscriptions sub) {

		con=DBConnection.getConnection();
		
		query="update subscriptions set renoRefLeads=?,purchaseLeads=?,createLeads=?, "
				+ "createEmployees=?,createSubcontractors=?, "
				+ "note=?,renoLeadLimit=?,purchaseLeadLimit=?, "
				+ "createLeadLimit=?,createEmployeeLimit=?,createSubConLimit=? "
				+ "WHERE subscriptionId=? ";
		
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setString(1, sub.getRenoRefLeads());
		ps.setString(2, sub.getPurchaseLeads());
		ps.setString(3, sub.getCreateLeads());
		ps.setString(4, sub.getCreateEmployees());
		ps.setString(5, sub.getCreateSubcontractors());
		ps.setString(6, sub.getNote());
		ps.setString(7, sub.getRenoLeadLimit());
		ps.setString(8, sub.getPurchaseLeadLimit());
		ps.setString(9, sub.getCreateLeadLimit());
		ps.setString(10, sub.getCreateEmployeeLimit());
		ps.setString(11, sub.getCreateSubConLimit());
		ps.setInt(12, sub.getSubscriptionId());
		
		
		
		
	    count=ps.executeUpdate();	
	   
	    
	    
	     if(count>0){
	    	
	    	
	    	
	    	result="Success";
	    }
	    else{
	    	
	    	result="Error";
	    }
	    
	    
	    
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return result;
	}



	@Override
	public List<Subscriptions> getAllTotalSubscriptionForDefaulLeadAction() {
con=DBConnection.getConnection();
		
		List<Subscriptions> subList=new ArrayList<>();
		/*s.renoRefLeads!='Not Allowed'*/
		query="SELECT s.subscriptionId,s.subscriptionName,s.visibility FROM  subscriptions s WHERE s.visibility!='Disable' AND s.renoRefLeads!='Assign By Admin' AND s.visibility!='Default' ORDER BY s.visibility" ;
		try {
			
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			while(rs.next()){
				Subscriptions sub=new Subscriptions();
				
				sub.setSubscriptionId(rs.getInt(1));
				sub.setSubscriptionName(rs.getString(2)+" ("+rs.getString(3)+")");
				subList.add(sub);
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return subList;
	}
	
}
