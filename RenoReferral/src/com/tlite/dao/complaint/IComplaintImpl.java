package com.tlite.dao.complaint;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;

import com.tlite.connection.DBConnection;
import com.tlite.pojo.Complaint;
import com.tlite.pojo.ContractorComplaint;

public class IComplaintImpl implements IComplaint {
	 Connection con=null;
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	 String result = "";
	 int count=0;
	@Override
	public String saveComplaint(Complaint complaint) {
		
		con=DBConnection.getConnection();
		
		query="INSERT INTO complaints(LeadId,ComplaintText,complaint_status,timestamp) Values(?,?,?,?)";
		try {
			ps=con.prepareStatement(query);
			 
		    ps.setInt(1,complaint.getLeadId());
		   
		    ps.setString(2, complaint.getComplaintText());
		 
		    ps.setString(3,complaint.getComplaint_status());
		    
		    ps.setString(4,complaint.getTimestamp());
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
			DbUtils.closeQuietly(con,ps,rs);
		}
			
				
				
		
		
		
		return result;
		
		
	}

	@Override
	public List<Complaint> getAllComplaints() {
		
		con=DBConnection.getConnection();
		
		List<Complaint> complaintsList=new ArrayList<>();
		
		query="SELECT * FROM complaints";
		try {
			ps=con.prepareStatement(query);
			 
		    rs=ps.executeQuery();
		    
		    while(rs.next()){
		    	
		    	Complaint complaint=new Complaint();
		    	complaint.setComplaintId(rs.getInt("complaintId"));
		    	complaint.setLeadId(rs.getInt("LeadId"));
		    	complaint.setComplaintText(rs.getString("ComplaintText"));
		    	complaint.setStatus(rs.getString("status"));
		    	
		    	complaintsList.add(complaint);
		    }
		 
		      
		    
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
			
				
				
		
		
		
		return complaintsList;
		
		
	}

	@Override
	public String deleteComplaint(int complaintId) {
		
		con=DBConnection.getConnection();
		
		query="DELETE FROM complaints WHERE complaintId=?";
		
		try {
			ps=con.prepareStatement(query);
			 
		    ps.setInt(1,complaintId);
		   
		   int update=ps.executeUpdate();
		  
		    if(update>0){
		    	
		    	result="success";
		    	
		    }
		    else{
		    	
		    	result="error";
		    	
		    }
		    
		    
		    
		    
		    System.out.println(update+" Row deleted");
		    
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
			
				
				
		
		
		
		return result;
		
	}

	@Override
	public String updateComplaint(Complaint complaint) {
		
		con=DBConnection.getConnection();
		
		query="UPDATE complaints SET LeadId=? ,ComplaintText=?,status=?  WHERE complaintId=?";
		
		try {
			
			ps=con.prepareStatement(query);
			 
		    ps.setInt(1,complaint.getLeadId());
		    ps.setString(2, complaint.getComplaintText());
		    ps.setString(3, complaint.getStatus());
		    ps.setInt(4,complaint.getComplaintId());
		    
		    int update=ps.executeUpdate();
		  
		    if(update>0){
		    	
		    	result="success";
		    	
		    }
		    else{
		    	
		    	result="error";
		    	
		    }
		    
		    
		    
		    
		    System.out.println(update+" Row Updated");
		    
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
			
				
				
		
		
		
		return result;
	}

	@Override
	public List<Complaint> getAllNewComplaintsById(int lead_id) {
		
		con=DBConnection.getConnection();
		
		
		List<Complaint> complaintsList=new ArrayList<>();
		
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		
		 
		 query="SELECT * FROM  complaints  WHERE LeadID=? AND complaint_status='new';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,lead_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				Complaint complaint=new Complaint();
				
				complaint.setComplaintId(rs.getInt("complaintId"));
				complaint.setLeadId(rs.getInt("LeadId"));
				complaint.setComplaintText(rs.getString("ComplaintText"));
				complaint.setStatus(rs.getString("complaint_status"));
				complaint.setComplaint_status(rs.getString("complaint_status"));
				complaint.setTimestamp(String.valueOf(rs.getTimestamp("timestamp")));
				
				
		    	complaintsList.add(complaint);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
		 
		    
		 
		 return complaintsList;  
	}

	@Override
	public List<ContractorComplaint> getAllWorkingComplaintsById(int lead_id) {
		
		con=DBConnection.getConnection();
		
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.LeadID=?  AND cc.complaint_status='working';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,lead_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
	    	ContractorComplaint complaint=new ContractorComplaint();
		
		    complaint.setCon_complaint_id(rs.getInt("con_complaint_id"));
		    complaint.setLeadID(rs.getInt("LeadID"));
			complaint.setContractorId(rs.getInt("contractorId"));
			complaint.setEmployee_id(rs.getInt("employee_id"));
			complaint.setTimestamp(String.valueOf(rs.getTimestamp("timestamp")));
			complaint.setComplaint_text(rs.getString("complaint_text"));
			complaint.setComplaint_status(rs.getString("complaint_status"));	
				
			complaintsList.add(complaint);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
		 
		    
		 
		 return complaintsList;  
	}

	@Override
	public List<ContractorComplaint> getAllClosedComplaintsById(int lead_id) {
		
		 con=DBConnection.getConnection();
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.LeadID=?  AND cc.complaint_status='closed';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,lead_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
	    	ContractorComplaint complaint=new ContractorComplaint();
		
		    complaint.setCon_complaint_id(rs.getInt("con_complaint_id"));
		    complaint.setLeadID(rs.getInt("LeadID"));
			complaint.setContractorId(rs.getInt("contractorId"));
			complaint.setEmployee_id(rs.getInt("employee_id"));
			complaint.setTimestamp(String.valueOf(rs.getTimestamp("timestamp")));
			complaint.setComplaint_text(rs.getString("complaint_text"));
			complaint.setComplaint_status(rs.getString("complaint_status"));	
				
			complaintsList.add(complaint);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
		 
		 return complaintsList;  
	}
	
	@Override
	public List<Complaint> getAllAssignedComplaintsById(int lead_id) {
		
		con=DBConnection.getConnection();
        List<Complaint> complaintsList=new ArrayList<>();
		
		 query="SELECT * FROM  complaints  WHERE LeadID=? AND complaint_status='assigned';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,lead_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				Complaint complaint=new Complaint();
				
				complaint.setComplaintId(rs.getInt("complaintId"));
				complaint.setLeadId(rs.getInt("LeadId"));
				complaint.setComplaintText(rs.getString("ComplaintText"));
				complaint.setStatus(rs.getString("complaint_status"));
				complaint.setComplaint_status(rs.getString("complaint_status"));
				complaint.setTimestamp(String.valueOf(rs.getTimestamp("timestamp")));
				
				
		    	complaintsList.add(complaint);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
		 
		    
		 
		 return complaintsList;  
	}

	/*@Override
	public List<ContractorComplaint> getAllAssignedComplaintsById(int lead_id) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.LeadID=?  AND cc.complaint_status='assigned';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,lead_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
	    	ContractorComplaint complaint=new ContractorComplaint();
		
		    complaint.setCon_complaint_id(rs.getInt("con_complaint_id"));
		    complaint.setLeadID(rs.getInt("LeadID"));
			complaint.setContractorId(rs.getInt("contractorId"));
			complaint.setEmployee_id(rs.getInt("employee_id"));
			complaint.setTimestamp(String.valueOf(rs.getTimestamp("timestamp")));
			complaint.setComplaint_text(rs.getString("complaint_text"));
			complaint.setComplaint_status(rs.getString("complaint_status"));	
				
			complaintsList.add(complaint);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
		 
		    
		 
		 return complaintsList; 
	}
*/
	@Override
	public String assignComplaint(Complaint complaint) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Complaint getComplaintById(int complaint_id) {
		 con=DBConnection.getConnection();
		 Complaint complaint=new Complaint();
		 
		 query="SELECT * FROM  complaints  WHERE complaintId=?";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,complaint_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				
				complaint.setComplaintId(rs.getInt("complaintId"));
				complaint.setLeadId(rs.getInt("LeadId"));
				complaint.setComplaintText(rs.getString("ComplaintText"));
				complaint.setStatus(rs.getString("status"));
				complaint.setComplaint_status(rs.getString("complaint_status"));
				complaint.setTimestamp(String.valueOf(rs.getTimestamp("timestamp")));
				
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
		 
		    
		 
		 return complaint;  
	}

	@Override
	public String updateStatus(String status, int complaint_id) {
		
		con=DBConnection.getConnection();
		 
		 query="UPDATE complaints SET complaint_status=?  WHERE complaintId=?";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setString(1,status);
			ps.setInt(2,complaint_id);
			
			count=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
		 
		 if(count>0){
			 
			 result="success";
		 }else{
			 
			 result="error";
		 }
		    
		 
		 return result;  
	}

	

}
