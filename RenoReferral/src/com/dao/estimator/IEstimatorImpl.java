package com.dao.estimator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;

import com.tlite.connection.DBConnection;
import com.tlite.pojo.ContractorComplaint;
import com.tlite.pojo.Document;
import com.tlite.pojo.Employee;
import com.tlite.pojo.Lead;
import com.tlite.pojo.LeadNotes;
import com.tlite.pojo.Store;

public class IEstimatorImpl implements IEstimator {
	 Connection con=null;
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	 int count;
	 String result="";
	 boolean status=false;  
	 
	@Override
	public boolean validate(String email, String password) {
		
          con=DBConnection.getConnection();
		
		query="SELECT e.employee_id FROM contractor_employee e WHERE e.employee_email=? AND e.employee_password=? AND employee_type='estimator'" ;
		    
		        try {
			
			    ps=con.prepareStatement(query);
			       
					ps.setString(1,email);  
					ps.setString(2,password);  
					
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
	public Employee getEmployeeDetails(String email) {
		con=DBConnection.getConnection();
		Employee employee=new Employee();
		
        query="SELECT * FROM contractor_employee WHERE employee_email=?" ;
        
            try {
			
			ps=con.prepareStatement(query);
			ps.setString(1,email);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
			
			employee.setEmployee_id(rs.getInt("employee_id"));
			employee.setContractor_id(rs.getInt("contractorId"));
			employee.setEmployee_name(rs.getString("employee_name"));
			employee.setEmployee_email(rs.getString("employee_email"));
			employee.setEmployee_password(rs.getString("employee_password"));	
			employee.setEmployee_mobile(rs.getLong("employe_mobile"));	
			employee.setEmployee_type(rs.getString("employee_type"));	
				
			
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return  employee;
	}

	@Override
	public List<Lead> getLeadsByEstimator(int contractor_id,int employee_id) {
con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		  query="SELECT * FROM leads l "
		+ "JOIN services s ON l.ServiceId=s.serviceId "
		+ "JOIN locations loc ON loc.locationId=l.PostalCode  "
		+ "JOIN contractor_assigned_leads a ON l.LeadID=a.LeadID "
		+ "JOIN contractor_lead_employee_details le ON le.LeadID=a.LeadID "
		+ "WHERE a.contractorId=? "
		+ "AND  le.estimator_id=? "
		+ "ORDER BY a.LeadID";
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
			/*ps.setInt(2,contractorId);
			ps.setInt(3,contractorId);*/
			rs=ps.executeQuery();
			while(rs.next()){
				
			Lead lead=new Lead();
			
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
			leadList.add(lead);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return leadList;
	}

	@Override
	public List<Lead> getConsultedLeadList(int contractor_id, int employee_id) {
		
			con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		
		query="SELECT * FROM contractor_consulted_leads ccl "
				+ "JOIN leads l ON ccl.LeadID=l.LeadID "
				+ "JOIN services s ON s.serviceId=l.ServiceId "
				+ "JOIN locations loc ON loc.locationId=l.PostalCode "
				+ "JOIN contractor_lead_employee_details le ON le.LeadID=l.LeadID "
				+ "WHERE ccl.contractorId=? "
				+ "AND  le.estimator_id=? "
				+ "ORDER BY ccl.LeadID" ;
		
		   try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
			Lead lead=new Lead();
			
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
	    	/*lead.setEstimatorId(rs.getInt("estimator_id"));
			lead.setEstimatorName(rs.getString("estimator_name"));
			lead.setInstallerId(rs.getInt("installer_id"));
			lead.setInstallerName(rs.getString("installer_name"));*/
			leadList.add(lead);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return leadList;
	}

	@Override
	public List<Lead> getQuotedLeadList(int contractor_id, int employee_id) {
		
       con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_quoted_leads ccl "
				+ "JOIN leads l ON ccl.LeadID=l.LeadID "
				+ "JOIN services s ON l.ServiceId=s.serviceId "
				+ "JOIN locations loc "
				+ "ON loc.locationId=l.PostalCode "
				+ "JOIN contractor_lead_employee_details le ON le.LeadID=l.LeadID  "
				+ "WHERE ccl.contractorId=? "
				+ "AND  le.estimator_id=?  "
				+ "ORDER BY ccl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
			Lead lead=new Lead();
			
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
	    	/*lead.setEstimatorId(rs.getInt("estimator_id"));
			lead.setEstimatorName(rs.getString("estimator_name"));
			lead.setInstallerId(rs.getInt("installer_id"));
			lead.setInstallerName(rs.getString("installer_name"));*/
			leadList.add(lead);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return leadList;
	}

	@Override
	public List<Lead> getContractorSoldLeads(int contractor_id, int employee_id) {
		
        con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_sold_leads csl "
				+ " JOIN leads l ON csl.LeadID=l.LeadID "
				+ " JOIN services s ON l.ServiceId=s.serviceId "
				+ " JOIN locations loc ON loc.locationId=l.PostalCode "
				+ " JOIN contractor_lead_employee_details le ON le.LeadID=l.LeadID "
				+ " WHERE csl.contractorId=? "
				+ " AND  le.estimator_id=? "
				+ " ORDER BY csl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
			Lead lead=new Lead();
			
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
	    	/*lead.setEstimatorId(rs.getInt("estimator_id"));
			lead.setEstimatorName(rs.getString("estimator_name"));
			lead.setInstallerId(rs.getInt("installer_id"));
			lead.setInstallerName(rs.getString("installer_name"));*/
			leadList.add(lead);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return leadList;
	}

	@Override
	public List<Lead> getEstimatorWorkStartedLeads(int contractor_id, int employee_id) {
		
        con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		
		    query="SELECT * FROM contractor_work_started_leads ccl "
				+ "JOIN leads l ON ccl.LeadID=l.LeadID "
				+ "JOIN services s ON l.ServiceId=s.serviceId "
				+ "JOIN locations loc ON loc.locationId=l.PostalCode "
				+ "JOIN contractor_lead_employee_details le ON le.LeadID=l.LeadID "
				+ "WHERE ccl.contractorId=? "
				+ "AND  le.estimator_id=? "
				+ "ORDER BY ccl.LeadID" ;
		
		     try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
			Lead lead=new Lead();
			
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
	    	/*lead.setEstimatorId(rs.getInt("estimator_id"));
			lead.setEstimatorName(rs.getString("estimator_name"));
			lead.setInstallerId(rs.getInt("installer_id"));
			lead.setInstallerName(rs.getString("installer_name"));*/
			leadList.add(lead);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return leadList;
	}

	@Override
	public List<Lead> getEstimatorWorkCompletedLeads(int contractor_id, int employee_id) {
          con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_work_completed_leads ccl "
				+ "JOIN leads l ON ccl.LeadID=l.LeadID "
				+ "JOIN services s ON l.ServiceId=s.serviceId "
				+ "JOIN locations loc ON loc.locationId=l.PostalCode "
				+ "JOIN contractor_lead_employee_details le ON le.LeadID=l.LeadID "
				+ "WHERE ccl.contractorId=? "
				+ "AND  le.estimator_id=? "
				+ "ORDER BY ccl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
			Lead lead=new Lead();
			
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
	    	/*lead.setEstimatorId(rs.getInt("estimator_id"));
			lead.setEstimatorName(rs.getString("estimator_name"));
			lead.setInstallerId(rs.getInt("installer_id"));
			lead.setInstallerName(rs.getString("installer_name"));*/
			leadList.add(lead);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return leadList;
	}

	@Override
	public List<Lead> getEstimatorInvoicedLeads(int contractor_id, int employee_id) {
			con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_invoiced_leads ccl "
				+ "JOIN leads l ON ccl.LeadID=l.LeadID "
				+ "JOIN services s ON l.ServiceId=s.serviceId "
				+ "JOIN locations loc ON loc.locationId=l.PostalCode "
				+ "JOIN contractor_lead_employee_details le ON le.LeadID=l.LeadID  "
				+ "WHERE ccl.contractorId=? "
				+ "AND  le.estimator_id=?  "
				+ "ORDER BY ccl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
			Lead lead=new Lead();
			
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
	    	/*lead.setEstimatorId(rs.getInt("estimator_id"));
			lead.setEstimatorName(rs.getString("estimator_name"));
			lead.setInstallerId(rs.getInt("installer_id"));
			lead.setInstallerName(rs.getString("installer_name"));*/
			leadList.add(lead);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return leadList;
	}

	@Override
	public List<Lead> getEstimatorClosedLeads(int contractor_id, int employee_id) {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_closed_leads ccl "
				+ "JOIN leads l ON ccl.LeadID=l.LeadID "
				+ "JOIN services s ON l.ServiceId=s.serviceId "
				+ "JOIN locations loc ON loc.locationId=l.PostalCode "
				+ "JOIN contractor_lead_employee_details le ON le.LeadID=l.LeadID "
				+ "WHERE ccl.contractorId=? "
				+ "AND le.estimator_id=? "
				+ "ORDER BY ccl.LeadID ";
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
			Lead lead=new Lead();
			
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
	    	/*lead.setEstimatorId(rs.getInt("estimator_id"));
			lead.setEstimatorName(rs.getString("estimator_name"));
			lead.setInstallerId(rs.getInt("installer_id"));
			lead.setInstallerName(rs.getString("installer_name"));*/
			leadList.add(lead);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return leadList;
	}

	@Override
	public List<Lead> getEstimatorCancledLeads(int contractor_id, int employee_id) {
      
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_cancled_leads ccl "
				+ "JOIN leads l ON ccl.LeadID=l.LeadID "
				+ "JOIN services s ON l.ServiceId=s.serviceId "
				+ "JOIN locations loc ON loc.locationId=l.PostalCode "
				+ "JOIN contractor_lead_employee_details le ON le.LeadID=l.LeadID "
				+ "WHERE ccl.contractorId=? "
				+ "AND  le.estimator_id=? "
				+ "ORDER BY ccl.LeadID " ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
			Lead lead=new Lead();
			
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
	    	/*lead.setEstimatorId(rs.getInt("estimator_id"));
			lead.setEstimatorName(rs.getString("estimator_name"));
			lead.setInstallerId(rs.getInt("installer_id"));
			lead.setInstallerName(rs.getString("installer_name"));*/
			leadList.add(lead);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return leadList;
	}

	@Override
	public List<Lead> getAllEstimatorLeads(int contractor_id, int employee_id) {
			con=DBConnection.getConnection();
		
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_lead_employee_details le JOIN leads l ON l.LeadID=le.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode WHERE le.contractorId=? AND le.estimator_id=? ORDER BY le.LeadID";
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
			Lead lead=new Lead();
			
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
			leadList.add(lead);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return leadList;
	}

	@Override
	public List<ContractorComplaint> getAllestimatorComplaintsById(int leadId, int contractorId, int employee_id) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.LeadID=? AND cc.contractorId=? AND cc.employee_id=? AND cc.complaint_status='assigned';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,leadId);
			ps.setInt(2,contractorId);
			ps.setInt(3,employee_id);
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
	public List<ContractorComplaint> getAllestimatorWorkingComplaintsById(int leadId, int contractorId,
			int employee_id) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.LeadID=? AND cc.contractorId=? AND cc.employee_id=? AND cc.complaint_status='working';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,leadId);
			ps.setInt(2,contractorId);
			ps.setInt(3,employee_id);
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
	public List<ContractorComplaint> getAllestimatorClosedComplaintsById(int leadId, int contractorId,
			int employee_id) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.LeadID=? AND cc.contractorId=? AND cc.employee_id=? AND cc.complaint_status='closed';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			ps.setInt(1,leadId);
			ps.setInt(2,contractorId);
			ps.setInt(3,employee_id);
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
	public List<Document> getAllEstimatorDocuments(int contractor_id, int employee_id) {
		List<Document> documentList=new ArrayList<>();
		 con=DBConnection.getConnection();
		query="SELECT * FROM contractor_documents cd JOIN contractor_shared_documents csd ON csd.contractor_documents_id=cd.contractor_documents_id WHERE cd.contractorId=? AND csd.employee_id=? AND cd.document_status='active' ";
		
	        try {
       	
			ps=con.prepareStatement(query);
			ps.setInt(1, contractor_id);
			ps.setInt(2, employee_id);
	    	rs=ps.executeQuery();
           while(rs.next()){
           	
           	Document document=new Document();
       		
           	document.setDocument_id(rs.getInt("contractor_documents_id"));
           	document.setContractor_id(rs.getInt("contractorId"));
           	document.setDocument_name(rs.getString("document_name"));
           	document.setDocument_type(rs.getString("document_type"));
           	document.setDocument_description(rs.getString("document_description"));
           	document.setDocument_path(rs.getString("document_path"));
           	document.setDocument_status(rs.getString("document_status"));
           	documentList.add(document);
           }	
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return documentList;
	}

	@Override
	public List<Store> getAllStores(int contractor_id, int employee_id) {
 
		 List<Store> storesList=new ArrayList<>();
		 
		 con=DBConnection.getConnection();
		 
		query="SELECT * FROM contractor_stores cs JOIN contractor_shared_stores css ON cs.contractor_stores_id=css.contractor_stores_id WHERE cs.contractorId=? AND css.employee_id=? AND cs.store_status='active' ";
		
	        try {
        	
			ps=con.prepareStatement(query);
			ps.setInt(1, contractor_id);
			ps.setInt(2, employee_id);
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
	public boolean validateEstimatorLead(int leadId, int contractorId, int estimator_id) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;
		 boolean leadPresent=false;
		 
		 try {
			 
			ps=con.prepareStatement("SELECT LeadID FROM contractor_lead_employee_details WHERE LeadID=? AND  contractorId=? AND estimator_id=? ");
			ps.setInt(1,leadId);
			ps.setInt(2,contractorId);
			ps.setInt(3,estimator_id);
			rs=ps.executeQuery();
			
			if(rs.next()){
				leadPresent=true;
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con,ps,rs);
		}
		return leadPresent;
	}

	@Override
	public List<LeadNotes> getEstimatorLeadNotes(int leadId, int contractorId, int employee_id) {
con=DBConnection.getConnection();
		
		List<LeadNotes> notesList=new ArrayList<>();
		
		query="SELECT * FROM lead_notes   WHERE LeadId=? AND contractorId=? AND employee_id=?";


		
		try {
			
			ps=con.prepareStatement(query);
			
			ps.setInt(1, leadId);
			ps.setInt(2, contractorId);
			ps.setInt(3, employee_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				LeadNotes note=new LeadNotes();
			    
				note.setLead_notes_id(rs.getInt("lead_notes_id"));
				note.setLeadId(rs.getInt("LeadId"));
				note.setContractorId(rs.getInt("contractorId"));
				note.setNote_timestamp(String.valueOf(rs.getTimestamp("note_timestamp")));
				note.setNote(rs.getString("note"));
				note.setImagepath(rs.getString("note_image"));
				notesList.add(note);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return notesList;
	}

	@Override
	public List<ContractorComplaint> getAllestimatorComplaints(int contractor_id, int employee_id) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.contractorId=? AND cc.employee_id=? AND cc.complaint_status='assigned';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
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
	public List<ContractorComplaint> getAllestimatorWorkingComplaints(int contractor_id, int employee_id) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.contractorId=? AND cc.employee_id=? AND cc.complaint_status='working';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
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
	public List<ContractorComplaint> getAllestimatorClosedComplaints(int contractor_id, int employee_id) {
		Connection con=DBConnection.getConnection();
		 PreparedStatement ps=null;
		 ResultSet rs=null;;
		 List<ContractorComplaint> complaintsList=new ArrayList<>();
		 
		 query="SELECT * FROM  contractor_complaints cc WHERE cc.contractorId=? AND cc.employee_id=? AND cc.complaint_status='closed';";
		 
		 try {
			 
			ps=con.prepareStatement(query);
			
			ps.setInt(1,contractor_id);
			ps.setInt(2,employee_id);
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
