package com.tlite.dao.contractor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;

import com.tlite.connection.DBConnection;
import com.tlite.pojo.ContractorComplaint;
import com.tlite.utility.TimestampGenerator;

public class IContractorComplaintsImpl implements IContractorComplaints  {

	
	 String query="";
	 int count;
	 String result="";
	
	
	@Override
	public String saveComplaint(ContractorComplaint complaint) {
		 Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 
		 
		 query="INSERT INTO contractor_complaints SET timestamp=?,LeadID=?,contractorId=?,employee_id=?,complaint_text=?,complaint_status=?,installer_id=?";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setString(1,complaint.getTimestamp());
			ps.setInt(2,complaint.getLeadID());
			ps.setInt(3,complaint.getContractorId());
			ps.setInt(4,complaint.getEmployee_id());
			ps.setString(5,complaint.getComplaint_text());
			ps.setString(6,complaint.getComplaint_status());
			ps.setInt(7,complaint.getInstaller_id());
			
			count=ps.executeUpdate();
			
            if(count>0){
		    	
		    	result="success";
		    	
		    }
		    else{
		    	
		    	result="error";
		    	
		    }
            
          
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
		 
		    
		 
		 return result;   
		
	}





	@Override
	public List<ContractorComplaint> getAllContractorNewComplaintsById(int leadId, int contractorId) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.LeadID=? AND cc.contractorId=? AND cc.complaint_status='new';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,leadId);
			ps.setInt(2,contractorId);
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
	public List<ContractorComplaint> getAllContractorAssignedComplaintsById(int leadId, int contractorId) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.LeadID=? AND cc.contractorId=? AND cc.complaint_status='assigned';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,leadId);
			ps.setInt(2,contractorId);
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
	public List<ContractorComplaint> getAllContractorWorkingComplaintsById(int leadId, int contractorId) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.LeadID=? AND cc.contractorId=? AND cc.complaint_status='working';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,leadId);
			ps.setInt(2,contractorId);
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
	public List<ContractorComplaint> getAllContractorClosedComplaintsById(int leadId, int contractorId) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.LeadID=? AND cc.contractorId=? AND cc.complaint_status='closed';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,leadId);
			ps.setInt(2,contractorId);
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
	public String assignComplaint(int complaint_id, int employee_id,int installer_id) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 
		 
		 query="UPDATE contractor_complaints SET employee_id=?,employee_id=?,complaint_status='assigned' WHERE  con_complaint_id=?";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			
			ps.setInt(1,employee_id);
			ps.setInt(2,installer_id);
			ps.setInt(3,complaint_id);
			
			count=ps.executeUpdate();
			
           if(count>0){
		    	
		    	result="Success";
		    	
		    }
		    else{
		    	
		    	result="error";
		    	
		    }
           
         
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
		 
		    
		 
		 return result;   
	}





	@Override
	public String updateComplaintStatus(int complaint_id,String status) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 
		 
		 query="UPDATE contractor_complaints SET complaint_status=? WHERE con_complaint_id=?";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			
			ps.setString(1,status);
			ps.setInt(2,complaint_id);
			
			
			count=ps.executeUpdate();
			
          if(count>0){
		    	
		    	result="Success";
		    	
		    }
		    else{
		    	
		    	result="error";
		    	
		    }
          
        
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
		 
		    
		 
		 return result; 
	}





	@Override
	public List<ContractorComplaint> getAllContractorNewComplaints(int contractorId) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.contractorId=? AND cc.complaint_status='new';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
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
	public List<ContractorComplaint> getAllContractorAssignedComplaints(int contractorId) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.contractorId=? AND cc.complaint_status='assigned';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
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
	public List<ContractorComplaint> getAllContractorWorkingComplaints(int contractorId) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.contractorId=? AND cc.complaint_status='working';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
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
	public List<ContractorComplaint> getAllContractorClosedComplaints(int contractorId) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE  cc.contractorId=? AND cc.complaint_status='closed';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
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


	
	
	
	
	
	
	
}
