package com.tlite.dao.lead;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;

import com.tlite.connection.DBConnection;
import com.tlite.pojo.BudgetRanges;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.DefaultLeadSetting;
import com.tlite.pojo.DefaultLeadSubscriptions;
import com.tlite.pojo.Lead;
import com.tlite.pojo.LeadImages;
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;
import com.tlite.pojo.Subscriptions;
import com.tlite.pojo.Taxation;

public class ILeadImpl implements ILead {

	 Connection con=null;
	 PreparedStatement ps=null;
	 ResultSet rs=null;
	 String query="";
	 int count=0;
	String result="";
	boolean status=false;
	
	@Override
	public String registerLead(Lead lead) {
		
		con=DBConnection.getConnection();
		
		String result = "";
		query="INSERT INTO leads(ServiceId,Timestamp,Name,Email,Mobile,PostalCode,Description,Address,Image,sell_count,max_byers,lead_status,lead_type,bugget_range_id,city) Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps=con.prepareStatement(query);
		    ps.setInt(1,lead.getServiceId());
		    ps.setTimestamp(2,lead.getTimestamp());
		    ps.setString(3, lead.getName());
		    ps.setString(4, lead.getEmail());
		    ps.setLong(5,lead.getMobile());
		    ps.setString(6,lead.getPostalCode());
		    ps.setString(7, lead.getDescription());
		    ps.setString(8, lead.getAddress());
		    ps.setString(9, lead.getImage());
		    ps.setInt(10,lead.getSell_count());
		    ps.setInt(11, lead.getMax_byers());
		    ps.setString(12,lead.getLead_status());
		    ps.setString(13,lead.getLead_type());
		    ps.setInt(14, lead.getBudget_range_id());
		    ps.setString(15, lead.getCity());
		    int update=ps.executeUpdate();
		  
		    if(update>0){
		    	
		    	result="success";
		    	
		    }
		    else{
		    	
		    	result="error";
		    	
		    }
		    
		    
		    
		    
		    System.out.println(update+" Row Inserted");
		    
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
				
				
		
		
		
		return result;
	}


	@Override
	public Lead getLeadDetails(int LeadID) {
		
		con=DBConnection.getConnection();
		
		Lead lead=new Lead();
		
		query="SELECT * FROM leads l JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode JOIN budget_ranges br ON br.budget_ranges_id=l.bugget_range_id WHERE l.LeadID=?";
		
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, LeadID);
			rs=ps.executeQuery();
			while(rs.next()){
				
			lead.setLeadID(rs.getInt("LeadID"));
			lead.setServiceId(rs.getInt("ServiceId"));
			lead.setTimestamp(rs.getTimestamp("Timestamp"));
			lead.setName(rs.getString("Name"));
			lead.setDescription(rs.getString("Description"));
			lead.setEmail(rs.getString("Email"));
			lead.setAddress(rs.getString("Address"));
			lead.setMobile(rs.getLong("Mobile"));
			lead.setPostalCode(rs.getString("PostalCode"));
			lead.setServiceName(rs.getString("serviceName"));
			lead.setImage(rs.getString("Image"));
			lead.setLocationName(rs.getString("locationName"));
			lead.setLocationId(rs.getInt("locationId"));
			
			BudgetRanges budgetRange=new BudgetRanges();
			budgetRange.setBudget_ranges_id(rs.getInt("budget_ranges_id"));
			budgetRange.setMin_value(rs.getInt("min_value"));
			budgetRange.setMax_value(rs.getInt("max_value"));
			
			lead.setBudgetrange(budgetRange);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		
		
		return lead;
	}


	@Override
	public String saveImagePaths(LeadImages imagePath) {
		
		con=DBConnection.getConnection();
		String result = "";
		query="INSERT INTO leadimages(LeadID,ImagePath) Values(?,?)";
		try {
			ps=con.prepareStatement(query);
		    ps.setInt(1,imagePath.getLeadId());
		    ps.setString(2, imagePath.getImagePath());
		    
		    
		    int update=ps.executeUpdate();
		  
		    if(update>0){
		    	
		    	result="Success";
		    	
		    }
		    else{
		    	
		    	result="error";
		    	
		    }
		    
	
		    System.out.println(update+" Images Inserted");
		    
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
				
				
		
		
		
		return result;
	}


	@Override
	public int getNextLeadId() {
		
		con=DBConnection.getConnection();
		
		int nextId=0;
		
		query="SELECT MAX(LeadID) FROM leads";
		try {
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			while(rs.next()){
				nextId=rs.getInt(1)+1;
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		
		
		return nextId;
	}


	@Override
	public List<String> getImagePaths(int leadId) {
	
		con=DBConnection.getConnection();
		
     query="SELECT ImagePath FROM leadimages  WHERE LeadID=?";
		
    
    List<String> imagePaths=new ArrayList<>();
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, leadId);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				imagePaths.add(rs.getString(1));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		
		
		return imagePaths;
	}


	@Override
	public List<Services> getAllServices() {
      
		con=DBConnection.getConnection();
		
		 List<Services> services=new ArrayList<>();
		
		
		query="SELECT * FROM services";
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()){
				
				Services service=new Services();	
				
				service.setServiceId(rs.getInt("serviceId"));
				service.setServiceName(rs.getString("serviceName"));
			 
				services.add(service);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		
		
		return services;
	}


	@Override
	public List<Locations> getAllLocations() {
		
		con=DBConnection.getConnection();
		 List<Locations> locations=new ArrayList<>();
			
			
			query="SELECT * FROM locations";
			
			try {
				ps=con.prepareStatement(query);
				rs=ps.executeQuery();
				while(rs.next()){
					
					Locations location=new Locations();	
					
					location.setLocatonId(rs.getInt("locationId"));
					location.setLocationName(rs.getString("locationName"));
					location.setCityName(rs.getString("cityName"));
					location.setAreaCode(rs.getString("areaCode"));
					locations.add(location);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			
			
			
			return locations;
	}


	@Override
	public String saveDeafaultLeadSetting(DefaultLeadSetting defaultLead) {
		
		con=DBConnection.getConnection();
		
		String result = "";
		
		query="Update defaultleadsetting  SET timeout=?,maxBuyers=? WHERE defaultLeadSettingId=1";
		try {
			ps=con.prepareStatement(query);
			
		    ps.setInt(1,defaultLead.getTimeout());
		    ps.setInt(2,defaultLead.getMaxBuyers());
		   
		    int update=ps.executeUpdate();
		  
		    if(update>0){
		    	
		    	result="success";
		    	
		    }
		    else{
		    	
		    	result="error";
		    	
		    }
		    
		    
		    
		    
		    System.out.println(update+" Row Inserted");
		    
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
				
				
		
		
		
		return result;
	}


	@Override
	public int getNextDefaultLeadId() {
		
		con=DBConnection.getConnection();
		
		int NextDefaultLeadId=0;
		query="SELECT MAX(defaultLeadSettingId) FROM defaultleadsetting";
		
		
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				NextDefaultLeadId=rs.getInt(1)+1;
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return NextDefaultLeadId;
	
	}


	@Override
	public String saveDefaultLeadSubscriptions(DefaultLeadSubscriptions defaultLeadSub) {
		
		con=DBConnection.getConnection();
		
		String result = "";
		
		query="INSERT INTO defaultleadsubscriptions(defaultLeadSettingId,subscriptionId) Values(?,?)";
	int DefaultLeadSettingId=defaultLeadSub.getDefaultLeadSettingId();
	
	List<Integer> subscriptionIdList=defaultLeadSub.getSubscriptionIdList();
		
	
		try {
			
			
			
	  for (Integer subscriptions : subscriptionIdList) {
				
			ps=con.prepareStatement(query);
			
		    ps.setInt(1,DefaultLeadSettingId);
		    ps.setInt(2,subscriptions);
		   
		    System.out.println(subscriptions);
		    
		    
		    int update=ps.executeUpdate();
		  
		    if(update>0){
		    	
		    	result="success";
		    	
		    }
		    else{
		    	
		    	result="error";
		    	
		    }
		    
		     System.out.println(update+" Row Inserted");
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
				
				
		
		
		
		return result;
	}


	@Override
	public String assignLead(int LeadId, List<Integer> contractorIdList) {
        
		con=DBConnection.getConnection();
		
		String result = "";
		
		query="INSERT INTO assignedleads(LeadID,contractorId) Values(?,?)";
	
	
		
		try {
			
			
			
	  for (Integer contractorId : contractorIdList) {
				
			ps=con.prepareStatement(query);
			
		    ps.setInt(1,LeadId);
		    ps.setInt(2,contractorId);
		   
		   
		    
		    
		    int update=ps.executeUpdate();
		  
		    if(update>0){
		    	
		    	result="success";
		    	
		    }
		    else{
		    	
		    	result="error";
		    	
		    }
		    
		     System.out.println(update+" Row Inserted");
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
				
				
		
		
		
		return result;
	}


	@Override
	public int getContractorsCount(int subscriptionId) {
		
		con=DBConnection.getConnection();
		
        int count=0;
		
		query="SELECT COUNT(contractorId) FROM contractor WHERE subscriptionId=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, subscriptionId);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				count=rs.getInt(1);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return count;
	}


	@Override
	public List<DefaultLeadSetting> getDeafaultLeadSetting() {
		
		con=DBConnection.getConnection();
		
		List<DefaultLeadSetting> setting=new ArrayList<>();
		
		DefaultLeadSetting defaultSetting=new DefaultLeadSetting();
		
		
		query="SELECT timeout,maxBuyers FROM defaultleadsetting";
		try {
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				defaultSetting.setTimeout(rs.getInt("timeout"));
				defaultSetting.setMaxBuyers(rs.getInt("maxBuyers"));
				setting.add(defaultSetting);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return setting;
	}


	@Override
	public List<Lead> getAllUnassignedLeads() {
		
		con=DBConnection.getConnection();
		
      List<Lead> LeadList=new ArrayList<>();
		
		
		
		
		/*query="SELECT * FROM leads l JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode WHERE LeadID NOT IN(SELECT LeadID FROM assignedleads) AND  LeadID NOT IN(SELECT LeadID FROM contractor_leads)";*/
		
      query="SELECT * "
      		+ "FROM leads l JOIN services s "
      		+ "ON l.ServiceId=s.serviceId "
      		+ "JOIN locations loc "
      		+ "ON loc.locationId=l.PostalCode "
      		+ "WHERE  l.lead_status='new'";
		
		try {
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				Lead  lead=new Lead();
				
				lead.setLeadID(rs.getInt("LeadID"));
				lead.setServiceId(rs.getInt("ServiceId"));
				lead.setTimestamp(rs.getTimestamp("Timestamp"));
				lead.setName(rs.getString("Name"));
				lead.setDescription(rs.getString("Description"));
				lead.setEmail(rs.getString("Email"));
				lead.setAddress(rs.getString("Address"));
				lead.setMobile(rs.getLong("Mobile"));
				lead.setPostalCode(rs.getString("PostalCode"));
				lead.setServiceName(rs.getString("serviceName"));
				lead.setImage(rs.getString("Image"));
				lead.setLocationName(rs.getString("locationName"));
				
				LeadList.add(lead);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return LeadList;
	}

	
	
	public List<Lead> getAllAssignedLeads() {
		
		con=DBConnection.getConnection();
		
		 List<Lead> LeadList=new ArrayList<>();
			
			query="SELECT * FROM  leads l JOIN services s ON l.ServiceId=s.serviceId JOIN  locations loc ON l.PostalCode=loc.locationId WHERE l.lead_status='assigned'";
			
			
			try {
				ps=con.prepareStatement(query);
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					Lead  lead=new Lead();
					
					lead.setLeadID(rs.getInt("LeadID"));
					lead.setServiceId(rs.getInt("ServiceId"));
					lead.setTimestamp(rs.getTimestamp("Timestamp"));
					lead.setName(rs.getString("Name"));
					lead.setDescription(rs.getString("Description"));
					lead.setEmail(rs.getString("Email"));
					lead.setAddress(rs.getString("Address"));
					lead.setMobile(rs.getLong("Mobile"));
					lead.setPostalCode(rs.getString("PostalCode"));
					lead.setServiceName(rs.getString("serviceName"));
					lead.setImage(rs.getString("Image"));
					lead.setLocationName(rs.getString("locationName"));
					/*lead.setContactorCount(rs.getInt("count"));*/
					
					
					
					
					LeadList.add(lead);
					
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return LeadList;
	}

	/*@Override
	public List<Lead> getAllAssignedLeads() {
		 List<Lead> LeadList=new ArrayList<>();
			
			
			
	
			query="SELECT *,COUNT(cl.contractorId) as 'count' FROM assignedleads cl JOIN leads l ON cl.LeadID=l.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN  locations loc ON l.PostalCode=loc.locationId GROUP BY cl.LeadID";
			
			
			try {
				ps=con.prepareStatement(query);
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					Lead  lead=new Lead();
					
					lead.setLeadID(rs.getInt("LeadID"));
					lead.setServiceId(rs.getInt("ServiceId"));
					lead.setTimestamp(rs.getTimestamp("Timestamp"));
					lead.setName(rs.getString("Name"));
					lead.setDescription(rs.getString("Description"));
					lead.setEmail(rs.getString("Email"));
					lead.setAddress(rs.getString("Address"));
					lead.setMobile(rs.getLong("Mobile"));
					lead.setPostalCode(rs.getString("PostalCode"));
					lead.setServiceName(rs.getString("serviceName"));
					lead.setImage(rs.getString("Image"));
					lead.setLocationName(rs.getString("locationName"));
					lead.setContactorCount(rs.getInt("count"));
					
					
					
					
					LeadList.add(lead);
					
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return LeadList;
	}
*/

	public int getContractorCount(int contractorId) {
		 	
		con=DBConnection.getConnection();
		
			int count=0;
			query="SELECT COUNT(DISTINCT(cl.LeadID)) FROM contractor_assigned_leads  cl WHERE cl.contractorId=?";
			
			
			try {
				ps=con.prepareStatement(query);
				ps.setInt(1, contractorId);
				rs=ps.executeQuery();
				
				while(rs.next()){
					
				count=rs.getInt(1);						
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return count;
	}


	@Override
	public int getContractorsCount(int subscriptionId, Lead lead) {
		
		con=DBConnection.getConnection();
		
		 int count=0;
			
			query="SELECT COUNT(c.contractorId) FROM contractor  c JOIN contractorservices cos ON cos.contractorId=c.contractorId JOIN contractorlocations col ON col.contractorId=c.contractorId WHERE subscriptionId=? AND col.locationId=? AND cos.serviceId=?";
			try {
				ps=con.prepareStatement(query);
				ps.setInt(1, subscriptionId);
				ps.setInt(2, lead.getLocationId());
				ps.setInt(3, lead.getServiceId());
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					count=rs.getInt(1);
				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return count;
	}


	@Override
	public int getLeadSellCount(int leadId) {
		
		con=DBConnection.getConnection();
		
		int count=0;
		
		try{
		query="SELECT sell_count  FROM leads WHERE LeadID=?";
			ps=con.prepareStatement(query);
			ps.setInt(1, leadId);
			
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				count=rs.getInt(1);
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return count;
	}


	@Override
	public String updateLeadSellCount(int count,int leadId) {
		
		con=DBConnection.getConnection();
		
		String result="";
		query="UPDATE leads SET sell_count=? WHERE LeadID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, count);
			ps.setInt(2, leadId);
			
			
			 int update=ps.executeUpdate();
			  
			    if(update>0){
			    	
			    	result="success";
			    	
			    }
			    else{
			    	
			    	result="error";
			    	
			    }
			    
			  System.out.println(update+" Row Inserted");
				 
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
				
			
			return result;
	}


	@Override
	public String addNewContractorLeads(int LeadId, List<Integer> contractorIdList) {
		
		con=DBConnection.getConnection();
		
		 String result = "";
			
			query="INSERT INTO contractor_newreno_leads(LeadID,contractorId) Values(?,?)";
		
		
			
			try {
				
				
				
		  for (Integer contractorId : contractorIdList) {
					
				ps=con.prepareStatement(query);
				
			    ps.setInt(1,LeadId);
			    ps.setInt(2,contractorId);
			   
			   
			    
			    
			    int update=ps.executeUpdate();
			  
			    if(update>0){
			    	
			    	result="success";
			    	
			    }
			    else{
			    	
			    	result="error";
			    	
			    }
			    
			     System.out.println(update+" Row Inserted");
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
				
					
					
			
			
			
			return result;
	}


	@Override
	public String updateLeadStatus(String status, int leadId) {
         
		con=DBConnection.getConnection();
		
		int count=0;
		String result = "";
		
		try{
		query="UPDATE leads SET lead_status=? WHERE LeadID=?";
			ps=con.prepareStatement(query);
			ps.setString(1, status);
			ps.setInt(2, leadId);
			
			count=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		if(count>0){
	    	
	    	result="success";
	    	System.out.println("Lead Status Updated Successfully");
	    }
	    else{
	    	
	    	result="error";
	    	System.err.println("Lead Status Not Updated");
	    }
		
		
		return result;
	}


	@Override
	public List<Lead> getAllAppliedBuyLeads() {
		
		con=DBConnection.getConnection();
		
		 List<Lead> LeadList=new ArrayList<>();
		 
		 /*query="SELECT * FROM  leads l JOIN services s ON l.ServiceId=s.serviceId JOIN  locations loc ON l.PostalCode=loc.locationId WHERE l.lead_status='applied'";*/
		/*query="SELECT * FROM  leads l JOIN services s ON l.ServiceId=s.serviceId JOIN  locations loc ON l.PostalCode=loc.locationId WHERE l.lead_status!='assigned' AND l.lead_status!='new'";*/
		 query="SELECT * FROM  leads l JOIN services s ON l.ServiceId=s.serviceId JOIN  locations loc ON l.PostalCode=loc.locationId JOIN contractor_lead_employee_details ced ON ced.LeadID=l.LeadID JOIN contractor c ON c.contractorId=ced.contractorId WHERE l.lead_status!='assigned' AND l.lead_status!='new'";
			
			try {
				ps=con.prepareStatement(query);
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					Lead  lead=new Lead();
					
					lead.setLeadID(rs.getInt("LeadID"));
					lead.setServiceId(rs.getInt("ServiceId"));
					lead.setTimestamp(rs.getTimestamp("Timestamp"));
					lead.setName(rs.getString("Name"));
					lead.setDescription(rs.getString("Description"));
					lead.setEmail(rs.getString("Email"));
					lead.setAddress(rs.getString("Address"));
					lead.setMobile(rs.getLong("Mobile"));
					lead.setPostalCode(rs.getString("PostalCode"));
					lead.setServiceName(rs.getString("serviceName"));
					lead.setImage(rs.getString("Image"));
					lead.setLocationName(rs.getString("locationName"));
					lead.setContractorId(rs.getInt("contractorId"));
					lead.setContractorName(rs.getString("contractorName"));
				/*	lead.setContactorCount(rs.getInt("count"));*/
					
					
					
					
					LeadList.add(lead);
					
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return LeadList;
	}


	@Override
	public List<Lead> getAllLeads() {
		
		con=DBConnection.getConnection();
		
		List<Lead> LeadList=new ArrayList<>();
		
		query="SELECT * FROM  leads l JOIN services s ON l.ServiceId=s.serviceId JOIN  locations loc ON l.PostalCode=loc.locationId ";
		
		
		try {
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				Lead  lead=new Lead();
				
				lead.setLeadID(rs.getInt("LeadID"));
				lead.setServiceId(rs.getInt("ServiceId"));
				lead.setTimestamp(rs.getTimestamp("Timestamp"));
				lead.setName(rs.getString("Name"));
				lead.setDescription(rs.getString("Description"));
				lead.setEmail(rs.getString("Email"));
				lead.setAddress(rs.getString("Address"));
				lead.setMobile(rs.getLong("Mobile"));
				lead.setPostalCode(rs.getString("PostalCode"));
				lead.setServiceName(rs.getString("serviceName"));
				lead.setImage(rs.getString("Image"));
				lead.setLocationName(rs.getString("locationName"));
				/*lead.setContactorCount(rs.getInt("count"));*/
				
				
				
				
				LeadList.add(lead);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return LeadList;
	}


	@Override
	public String addApplyBuyLead(int leadId, int contractorId) {
		
		
		con=DBConnection.getConnection();
		
		 try {
				
		  	    
			    query ="INSERT INTO appbuyleads SET LeadID=?,contractorId=?";
			    ps=con.prepareStatement(query); 
				ps.setInt(1,leadId);
				ps.setInt(2,contractorId);
				
				count=ps.executeUpdate();
				
				  if(count>0){
				    	
				    	result="success";
				    	
				    }
				    else{
				    	
				    	result="error";
				    	
				    }
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DbUtils.closeQuietly(con, ps, rs);
				}
				
				return result;
	}


	@Override
	public List<Locations> getAllCities() {
		
		con=DBConnection.getConnection();
		
		 List<Locations> locations=new ArrayList<>();
			
			
			query="SELECT DISTINCT(locationName) FROM locations";
			
			try {
				ps=con.prepareStatement(query);
				rs=ps.executeQuery();
				while(rs.next()){
					
					Locations location=new Locations();	
					
					/*location.setLocatonId(rs.getInt("locationId"));
					location.setLocationName(rs.getString("locationName"));*/
					location.setCityName(rs.getString("locationName"));
					/*location.setAreaCode(rs.getString("areaCode"));*/
					locations.add(location);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			
			
			
			return locations;
	}


	@Override
	public List<Locations> getPincodesByCity(String cityName) {
		
		con=DBConnection.getConnection();
		
		List<Locations> locations=new ArrayList<>();
		
		
		query="SELECT locationId,locationName FROM locations WHERE cityName=?";
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1,cityName);
			rs=ps.executeQuery();
			while(rs.next()){
				
				Locations location=new Locations();	
				
				location.setLocatonId(rs.getInt("locationId"));
				location.setLocationName(rs.getString("locationName"));
				/*location.setCityName(rs.getString("cityName"));*/
				/*location.setAreaCode(rs.getString("areaCode"));*/
				locations.add(location);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		
		
		return locations;
	}


	@Override
	public Boolean deleteDefaultLeadSubscriptions() {
		con=DBConnection.getConnection();
		
		query="DELETE FROM defaultleadsubscriptions";
		
		try {
			
			ps=con.prepareStatement(query);
			int i=ps.executeUpdate();
			System.out.println(i);
		    if(i>0){
				
				return true;
			}
			
		} catch (SQLException e) {
			System.err.println(e);
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return false;
	}


	@Override
	public int addNewLocation(Locations location) {
		int auto_id=0;
		con=DBConnection.getConnection();
		
	/*	query = "INSERT INTO locations (cityName, locationName) values(?, ?)";*/
		query = "INSERT INTO locations (locationName) values(?)";
		try {
			
		 ps= con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
         ps.setString(1, location.getCityName());
        /* ps.setString(2, location.getLocationName());*/
         ps.executeUpdate();
         
         rs = ps.getGeneratedKeys();
         
		    while( rs.next()) {
		    	
		     auto_id = rs.getInt(1);
		   
		     System.out.println("auto_id="+auto_id);
		    }
		
		
			} catch (SQLException e) {
				System.err.println(e);
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
		
		return auto_id;
	}


	@Override
	public int checkforLocation(String locationName) {
        
		int id=0;
        
		con=DBConnection.getConnection();
        
		query="SELECT locationId FROM locations WHERE locationName=?";
		
		try {
			ps=con.prepareStatement(query);
			
			ps.setString(1,locationName);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				id=rs.getInt(1);
				
				System.out.println("locationId="+id);
			}
		} catch (SQLException e) {
			System.err.println(e);
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
			
		
	return id;
	}


	@Override
	public List<BudgetRanges> getBudgetRanges() {
		con=DBConnection.getConnection();
		 List<BudgetRanges> ranges=new ArrayList<>();
			
			
			query="SELECT * FROM budget_ranges";
			
			try {
				ps=con.prepareStatement(query);
				rs=ps.executeQuery();
				while(rs.next()){
					
					BudgetRanges range=new BudgetRanges();	
					
					range.setBudget_ranges_id(rs.getInt("budget_ranges_id"));
					range.setMin_value(rs.getInt("min_value"));
					range.setMax_value(rs.getInt("max_value"));
					
					ranges.add(range);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			
			return ranges;
	}


	@Override
	public boolean validateLead(int lead_id) {
		
		con=DBConnection.getConnection();
		boolean leadpresent=false;
		query="SELECT LeadID FROM leads WHERE LeadID=?";
			
			try {
				ps=con.prepareStatement(query);
				ps.setInt(1, lead_id);
				rs=ps.executeQuery();
				if(rs.next()){
					
					leadpresent=true;
				}
					
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			
			return leadpresent;

	}


	@Override
	public boolean checkIfSold(int leadId) {
		con=DBConnection.getConnection();
		boolean leadsold=false;
		query="SELECT LeadID FROM leads WHERE LeadID=? AND lead_status='sold'";
			
			try {
				ps=con.prepareStatement(query);
				ps.setInt(1,leadId);
				rs=ps.executeQuery();
				if(rs.next()){
					
					leadsold=true;
				}
					
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			
			return leadsold;

	}


	@Override
	public Contractor getLeadContractorDetails(int leadID) {
        con=DBConnection.getConnection();
		
        Contractor contractor=new Contractor();	
		
		query="SELECT * FROM  contractor c LEFT JOIN contractor_lead_employee_details ced ON c.contractorId=ced.contractorId WHERE ced.LeadID=?";
		
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, leadID);
			rs=ps.executeQuery();
			while(rs.next()){
				
				   contractor.setContractorId(rs.getInt("contractorId"));	
					contractor.setContractorName(rs.getString("contractorName"));
				    contractor.setContractorEmail(rs.getString("contractorEmail"));
				    contractor.setContractorMobileNumber(rs.getLong("contractorMobile"));
				    contractor.setContractorCompany(rs.getString("contractorCompany"));
				    
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		
		
		return contractor;
	}


	@Override
	public String getLeadEmail(int leadId) {
    con=DBConnection.getConnection();
		
		String email=null;
		
		query="SELECT Email FROM leads WHERE LeadID=?";
		
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, leadId);
			rs=ps.executeQuery();
			while(rs.next()){
				
				email=rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		
		
		return email;
	}
	

	@Override
	public int getLast24hrsleadCount() {
		
      con=DBConnection.getConnection();
		
		
		int lead_count=0;
		
		query="SELECT COUNT(l.LeadID) FROM leads l WHERE l.Timestamp >= now() - INTERVAL 1 DAY";
		
		try {
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				lead_count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return lead_count;
	}


	@Override
	public int getContractorsCountFromLast7days() {
   
		con=DBConnection.getConnection();
		
		
		int con_count=0;
		
		query="SELECT COUNT(c.contractorId) FROM contractor c WHERE c.contractorRegDate >= DATE(NOW()) - INTERVAL 7 DAY";
		
		try {
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				con_count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return con_count;
	}


	@Override
	public double getDefaultLeadPrice() {

		con=DBConnection.getConnection();
		
		
		double price=0;
		
		query="SELECT lead_price FROM defaultleadsetting WHERE defaultLeadSettingId=1";
		
		try {
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				price=rs.getDouble(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return price;
	}


	@Override
	public List<Taxation> getTaxation() {
		con=DBConnection.getConnection();
		 List<Taxation> taxation=new ArrayList<>();
			
			
			query="SELECT * FROM taxation";
			
			try {
				ps=con.prepareStatement(query);
				rs=ps.executeQuery();
				while(rs.next()){
					
					Taxation tax=new Taxation();	
					tax.setTax_id(rs.getInt("tax_id"));
					tax.setProvince(rs.getString("province"));
					tax.setGst(rs.getDouble("gst"));
					tax.setHst(rs.getDouble("hst"));
					tax.setPst(rs.getDouble("pst"));
					tax.setQst(rs.getDouble("qst"));
					taxation.add(tax);
					
				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			
			return taxation;
		
}


	@Override
	public Taxation getTaxationById(int tax_id) {
		con=DBConnection.getConnection();
		Taxation tax=new Taxation();	
		
			query="SELECT * FROM taxation WHERE tax_id=?";
			
			try {
				ps=con.prepareStatement(query);
				ps.setInt(1, tax_id);
				rs=ps.executeQuery();
				while(rs.next()){
					tax.setTax_id(rs.getInt("tax_id"));
					tax.setProvince(rs.getString("province"));
					tax.setGst(rs.getDouble("gst"));
					tax.setHst(rs.getDouble("hst"));
					tax.setPst(rs.getDouble("pst"));
					tax.setQst(rs.getDouble("qst"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			
			return tax;
	}


	@Override
	public int updateTaxation(Taxation tax) {
		
		int res=0;
		
		con=DBConnection.getConnection();
		
		query="UPDATE taxation SET gst=?,hst=?,pst=?,qst=? WHERE tax_id=?";
		
		try {
			ps=con.prepareStatement(query);
		   
		    ps.setDouble(1, tax.getGst());
		    ps.setDouble(2, tax.getHst());
		    ps.setDouble(3, tax.getPst());
		    ps.setDouble(4,tax.getQst());
		    ps.setInt(5, tax.getTax_id());
		    
		     res=ps.executeUpdate();
		  
		  	    
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		return res;
	}

      
}
