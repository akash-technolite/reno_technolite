package com.tlite.dao.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;

import com.tlite.connection.DBConnection;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.ContractorLimits;
import com.tlite.pojo.Lead;
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;

public class IUserImpl implements IUser {

	 Connection con=null;
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	 int count=0;
	 String result=null;
	 boolean status=true;
	
	
	
	
	@Override
	public int saveContractorServices(int contractorId,List<Integer> contractorServicesIds) {
        int res=0;
		con=DBConnection.getConnection();
		
		query="INSERT INTO contractorservices(contractorId,serviceId) VALUES(?,?)";
		
        try {
        	
        	
        	for (Integer integer : contractorServicesIds) {
        		ps=con.prepareStatement(query);
    			ps.setInt(1, contractorId);
    			ps.setInt(2, integer);
    			res=ps.executeUpdate();
			}
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return res;
	}

	
	
	
	@Override
	public int saveContractorLocations(int contractorId,List<Integer> contractorLocationsIds) {
		int i=0;
		con=DBConnection.getConnection();
		
     query="INSERT INTO contractorlocations(contractorId,locationId) VALUES(?,?)";
		
        try {
        	
        	
        	for (Integer integer : contractorLocationsIds) {
        		ps=con.prepareStatement(query);
    			ps.setInt(1, contractorId);
    			ps.setInt(2, integer);
    			 i=ps.executeUpdate();
			}
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
        
        
        
	return i;	
		
		
	}




	@Override
	public int getNextContractorId() {
		
		con=DBConnection.getConnection();
		
		int NextContractorId=0;
		query="SELECT MAX(contractorId) FROM contractor";
		
		
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				NextContractorId=rs.getInt(1)+1;
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return NextContractorId;
	}




	@Override
	public String saveContractor(Contractor contractor) {
		String res=null;
		int i=0;
		con=DBConnection.getConnection();
		
     query="INSERT INTO contractor(contractorName,contractorEmail,contractorMobile,contractorCompany,subscriptionId,password,prevsubscriptionId,contractorAddress,contractorRegDate) VALUES(?,?,?,?,?,?,?,?,?)";

	
        try {
        	
        		ps=con.prepareStatement(query);
    			ps.setString(1, contractor.getContractorName());
    			ps.setString(2, contractor.getContractorEmail());
    			ps.setLong(3, contractor.getContractorMobileNumber());
    			ps.setString(4, contractor.getContractorCompany());
    			ps.setInt(5, contractor.getSubscriptionId());
    			ps.setString(6, contractor.getPassword());
    			ps.setInt(7, contractor.getPreviousSubscription());
    			ps.setString(8, contractor.getContractorAddress());
    			ps.setDate(9, contractor.getContractorRegDate());
    			i=ps.executeUpdate();
			
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
        
         if(i>0){res="success";}else{res="error";}
        
        
        
        
		return res;
	}




	@Override
	public List<Contractor> getAllContractors() {
		
		con=DBConnection.getConnection();
		
		List<Contractor> contractorList=new ArrayList<>();
		
		 
		query="SELECT * FROM  contractor c join  subscriptions s on c.subscriptionId=s.subscriptionId";
	
		try {
			
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			
			int counter=0;
			
		while(rs.next()){
				
	   Contractor contractor=new Contractor();
	    
	    contractor.setContractorId(rs.getInt("contractorId"));	
		contractor.setContractorName(rs.getString("contractorName"));
	    contractor.setContractorEmail(rs.getString("contractorEmail"));
	    contractor.setContractorMobileNumber(rs.getLong("contractorMobile"));
	    contractor.setContractorCompany(rs.getString("contractorCompany"));
	    contractor.setPassword(rs.getString("password"));
	    contractor.setSubscriptionName((rs.getString("subscriptionName")));
	    /* contractor.setContractorServices(getContractorServices(contractorId));
	    
	    contractor.setContractorLocations(getContractorlocations(contractorId));	
	    
		contractor.setSubscriptionName(getContractorSubscription(contractorId));*/
		
		contractorList.add(contractor);	
		counter++;
		
			}
			
		/*System.out.println("Count="+counter);	*/
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		
		return contractorList;
	}




	private String getContractorSubscription(int contractorId) {
		
		con=DBConnection.getConnection();
		
		String subscriptionName=null;
		
		query="SELECT s.subscriptionName FROM contractor c JOIN  subscriptions s  ON c.subscriptionId=s.subscriptionId WHERE c.contractorId=?  ";
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setInt(1, contractorId);
		
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			
			
			subscriptionName=rs.getString(1);
			
		}
		
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return subscriptionName;
		
		
		
		
		
	}




	@Override
	public List<Services> getContractorServices(int contractorId) {
        
		con=DBConnection.getConnection();
		
        List<Services> serviceList=new ArrayList<>();
		
		query="SELECT cs.serviceId,s.serviceName FROM contractorservices cs JOIN services s ON cs.serviceId=s.serviceId WHERE contractorId=? ";
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setInt(1, contractorId);
		
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			
			Services services=new Services() ;
			
			services.setServiceId(rs.getInt(1));
			
			services.setServiceName(rs.getString(2));
			
			serviceList.add(services);
			
			
		}
		
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return serviceList;
	}




	@Override
	public List<Locations> getContractorlocations(int contractorId) {
		
		con=DBConnection.getConnection();
		
    List<Locations> locationList=new ArrayList<>();
		
		query="SELECT cl.locationId,l.locationName FROM contractorlocations cl JOIN locations l ON cl.locationId=l.locationId WHERE contractorId=? ";
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setInt(1, contractorId);
		
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			
			Locations location=new Locations();
			
			location.setLocatonId(rs.getInt(1));
			
			location.setLocationName(rs.getString(2));
			
			locationList.add(location);
			
			
		}
		
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return locationList;
	}




	@Override
	public List<Integer> getAllContractorsIdBySubscription(int SubscriptionId) {
		
		con=DBConnection.getConnection();
		
		 List<Integer> contractorIdList=new ArrayList<>();
			
			query="SELECT contractorId FROM contractor WHERE subscriptionId=?";
			try {
				
			ps=con.prepareStatement(query);
			
			ps.setInt(1, SubscriptionId);
			
			rs=ps.executeQuery();
			
			
			while(rs.next()){
				
				
				contractorIdList.add(rs.getInt(1));
				
				
			}
			
			
			
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return contractorIdList;
	}




	@Override
	public List<Contractor> getAllContractors(Lead lead) {
		
		con=DBConnection.getConnection();
		
		List<Contractor> contractorList=new ArrayList<>();
		
		 
		query="SELECT  * FROM  contractor c join  subscriptions s on c.subscriptionId=s.subscriptionId LEFT JOIN contractorservices cos ON cos.contractorId=c.contractorId LEFT JOIN contractorlocations col ON col.contractorId=c.contractorId WHERE col.locationId=? AND cos.serviceId=?  ";
	
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1, lead.getLocationId());
			ps.setInt(2, lead.getServiceId());
			rs=ps.executeQuery();
			
			int counter=0;
			
		while(rs.next()){
				
	   Contractor contractor=new Contractor();
	    
	    contractor.setContractorId(rs.getInt("contractorId"));	
		contractor.setContractorName(rs.getString("contractorName"));
	    contractor.setContractorEmail(rs.getString("contractorEmail"));
	    contractor.setContractorMobileNumber(rs.getLong("contractorMobile"));
	    contractor.setContractorCompany(rs.getString("contractorCompany"));
	    contractor.setPassword(rs.getString("password"));
	    contractor.setSubscriptionName((rs.getString("subscriptionName")));
	    /* contractor.setContractorServices(getContractorServices(contractorId));
	    
	    contractor.setContractorLocations(getContractorlocations(contractorId));	
	    
		contractor.setSubscriptionName(getContractorSubscription(contractorId));*/
		
		contractorList.add(contractor);	
		counter++;
		
			}
			
		System.out.println("Count="+counter);	
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		
		return contractorList;
	}




	@Override
	public List<Integer> getAllContractorsIdBySubscription(int SubscriptionId, Lead lead) {
		
		con=DBConnection.getConnection();
		
		List<Integer> contractorIdList=new ArrayList<>();
		
		query="SELECT c.contractorId FROM contractor c JOIN contractorservices cos ON cos.contractorId=c.contractorId JOIN contractorlocations col ON col.contractorId=c.contractorId WHERE subscriptionId=? AND col.locationId=? AND cos.serviceId=?";
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setInt(1, SubscriptionId);
		ps.setInt(2, lead.getLocationId());
		ps.setInt(3, lead.getServiceId());
		
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			
			
			contractorIdList.add(rs.getInt(1));
			
			
		}
		
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return contractorIdList;
	}

	/**/

	/*@Override
	private List<Locations> getContractorlocations(int contractorId) {
		
		List<Locations> locationList=new ArrayList<>();
		
		query="SELECT cl.locationId,l.locationName FROM contractorlocations cl JOIN locations l ON cl.locationId=l.locationId WHERE contractorId=? ";
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setInt(1, contractorId);
		
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			
			Locations location=new Locations();
			
			location.setLocatonId(rs.getInt(1));
			
			location.setLocationName(rs.getString(2));
			
			locationList.add(location);
			
			
		}
		
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return locationList;
	}



	@Override
	private List<Services> getContractorServices(int contractorId) {
		
		
         List<Services> serviceList=new ArrayList<>();
		
		query="SELECT cs.serviceId,s.serviceName FROM contractorservices cs JOIN services s ON cs.serviceId=s.serviceId WHERE contractorId=? ";
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setInt(1, contractorId);
		
		rs=ps.executeQuery();
		
		
		while(rs.next()){
			
			Services services=new Services() ;
			
			services.setServiceId(rs.getInt(1));
			
			services.setServiceName(rs.getString(2));
			
			serviceList.add(services);
			
			
		}
		
		
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return serviceList;
	}*/

	@Override
	public int getContractorId() {
		
		con=DBConnection.getConnection();
		
		int currentContractorId=0;
		query="SELECT MAX(contractorId) FROM contractor";
		
		
		
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				currentContractorId=rs.getInt(1);
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return currentContractorId;
	}
	
	@Override
	public String saveContractorSignUp(Contractor cont) {
		
		con=DBConnection.getConnection();
		
		query="INSERT INTO contractor(contractorName,contractorEmail,contractorMobile,contractorCompany,subscriptionId,prevsubscriptionId,contractorAddress,contractorRegDate) VALUES(?,?,?,?,?,?,?,?)";

		
        try {
        	
        		ps=con.prepareStatement(query);
    			ps.setString(1, cont.getContractorName());
    			ps.setString(2, cont.getContractorEmail());
    			ps.setLong(3, cont.getContractorMobileNumber());
    			ps.setString(4, cont.getContractorCompany());
    			ps.setInt(5, cont.getSubscriptionId());
    			ps.setInt(6, cont.getPreviousSubscription());
    			ps.setString(7, cont.getContractorAddress());
    			ps.setDate(8, cont.getContractorRegDate());
    			int update=ps.executeUpdate();
			
    			
    			if(update>0){
    		    	
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
	public String updateContractor(Contractor contractor) {
		
		con=DBConnection.getConnection();
		
		query="UPDATE contractor set contractorName=?,contractorEmail=?,contractorMobile=?,contractorCompany=?,password=?,tax_id=? WHERE contractorId=?";		
        try {
        	
        		ps=con.prepareStatement(query);
    			ps.setString(1, contractor.getContractorName());
    			ps.setString(2, contractor.getContractorEmail());
    			ps.setLong(3, contractor.getContractorMobileNumber());
    			ps.setString(4, contractor.getContractorCompany());
    			//ps.setInt(5, contractor.getSubscriptionId());
    			ps.setString(5, contractor.getPassword());
    			ps.setInt(6,contractor.getTax_id());
    			ps.setInt(7, contractor.getContractorId());
    			ps.executeUpdate();
			
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Contractor Added";
	}




	@Override
	public List<Contractor> getAllContractorsByLead(int lead_id) {
		
		con=DBConnection.getConnection();
		
		List<Contractor> contractorList=new ArrayList<>();
		
		 
		query="SELECT  * FROM  appbuyleads l JOIN contractor c ON l.contractorId=c.contractorId WHERE l.LeadID=?";
	
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1, lead_id);
			
			rs=ps.executeQuery();
			
			int counter=0;
			
		while(rs.next()){
				
	   Contractor contractor=new Contractor();
	    
	    contractor.setContractorId(rs.getInt("contractorId"));	
		contractor.setContractorName(rs.getString("contractorName"));
	    /*contractor.setContractorEmail(rs.getString("contractorEmail"));
	    contractor.setContractorMobileNumber(rs.getLong("contractorMobile"));
	    contractor.setContractorCompany(rs.getString("contractorCompany"));
	    contractor.setPassword(rs.getString("password"));
	    contractor.setSubscriptionName((rs.getString("subscriptionName")));*/
	    /* contractor.setContractorServices(getContractorServices(contractorId));
	    
	    contractor.setContractorLocations(getContractorlocations(contractorId));	
	    
		contractor.setSubscriptionName(getContractorSubscription(contractorId));*/
		
		contractorList.add(contractor);	
		counter++;
		
			}
			
		System.out.println("Count="+counter);	
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		
		return contractorList;
	}




	@Override
	public int addContractorLimits(ContractorLimits conLimits) {
		int res=0;
		con=DBConnection.getConnection();
		
		query="INSERT INTO "
				+ "contractor_limits"
				+ "(contractorId,renoLeadLimit,purchaseLeadLimit,createLeadLimit,createEmployeeLimit,createSubConLimit)"
				+ " VALUES(?,?,?,?,?,?)";
		
            try {
        	
        		ps=con.prepareStatement(query);
    			ps.setInt(1, conLimits.getContractorId());
    			ps.setInt(2, conLimits.getRenoLeadLimit());
    			ps.setInt(3, conLimits.getPurchaseLeadLimit());
    			ps.setInt(4, conLimits.getCreateLeadLimit());
    			ps.setInt(5, conLimits.getCreateEmployeeLimit());
    			ps.setInt(6, conLimits.getCreateSubConLimit());
    			
    			res=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return res;
		
		
	}




	@Override
	public int updateContractorLimit(String coloumname, int decrementValue, int contractorId) {
		int res=0;
		con=DBConnection.getConnection();
		
		query="UPDATE contractor_limits"
				+ " SET "
			    +coloumname+"="+coloumname+"-"+decrementValue
				+ " WHERE contractorId=?";
		
            try {
        	
        		ps=con.prepareStatement(query);
    			
    			
    			ps.setInt(1,contractorId);
    			
    			res=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return res;
		
	}




	@Override
	public int renewSubscription(ContractorLimits conLimits) {
		int res=0;
		con=DBConnection.getConnection();
		
		query="UPDATE contractor_limits SET renoLeadLimit=?,purchaseLeadLimit=?,createLeadLimit=?,createEmployeeLimit=?,createSubConLimit=?  WHERE contractorId=?";
		
		      try {
        	
        		ps=con.prepareStatement(query);
    			
    			ps.setInt(1,conLimits.getRenoLeadLimit());
    			ps.setInt(2,conLimits.getPurchaseLeadLimit());
    			ps.setInt(3,conLimits.getCreateLeadLimit());
    			ps.setInt(4,conLimits.getCreateEmployeeLimit());
    			ps.setInt(5,conLimits.getCreateSubConLimit());
    			ps.setInt(6,conLimits.getContractorId());
    			res=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return res;
	}




	@Override
	public boolean validateContractorEmail(String contractorEmail) {
        con=DBConnection.getConnection();
		
        boolean conPresent=true;
        try {
			ps=con.prepareStatement("SELECT contractorId FROM contractor WHERE contractorEmail=?");
			
			ps.setString(1,contractorEmail);
			rs=ps.executeQuery();
			
			if(rs.next()){
				
				conPresent=false;
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		
		return conPresent;
	}


}
