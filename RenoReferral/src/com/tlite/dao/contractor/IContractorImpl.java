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
import com.tlite.pojo.Assign;
import com.tlite.pojo.BudgetRanges;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.ContractorLeadEmployeeDetails;
import com.tlite.pojo.ContractorLimits;
import com.tlite.pojo.DocumentTypes;
import com.tlite.pojo.Employee;
import com.tlite.pojo.FinalWorkReport;
import com.tlite.pojo.FinalWorkReportFiles;
import com.tlite.pojo.FollowUp;
import com.tlite.pojo.Lead;
import com.tlite.pojo.LeadNotes;
import com.tlite.pojo.Locations;
import com.tlite.pojo.Services;
import com.tlite.pojo.Subscriptions;

public class IContractorImpl implements IContractor {
	 Connection con=null;
     Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	 int count=0;
	 String result="";
	 boolean status=false;
	 
	@Override
	public List<Lead> getLeadsByContractor(int contractorId) {
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
/*		query="SELECT * FROM leads l JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  JOIN assignedleads a ON l.LeadID=a.LeadID   WHERE a.contractorId=? AND l.LeadID NOT IN(SELECT ca.LeadID FROM contractor_applied_leads ca   WHERE ca.contractorId=?) AND l.LeadID NOT IN(SELECT ca.LeadID FROM contractor_assigned_leads ca   WHERE ca.contractorId=?)    AND l.sell_count<l.max_byers   ORDER BY a.LeadID" ;
*/		query="SELECT * FROM contractor_newreno_leads cnl JOIN leads l ON cnl.LeadID=l.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode   WHERE cnl.contractorId=? AND l.sell_count<l.max_byers   ORDER BY cnl.LeadID";
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
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
			lead.setLead_status(rs.getString("lead_status"));
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
	public Contractor getContractorByEmail(String email) {
		con=DBConnection.getConnection();
		
    query="SELECT * FROM contractor WHERE contractorEmail=?";
    Contractor contractor=new Contractor();	
    
		try {
			
			ps=con.prepareStatement(query);
			ps.setString(1,email);
			rs=ps.executeQuery();
			while(rs.next()){
				
			    contractor.setContractorId(rs.getInt("contractorId"));	
				contractor.setContractorName(rs.getString("contractorName"));
			    contractor.setContractorEmail(rs.getString("contractorEmail"));
			    contractor.setContractorMobileNumber(rs.getLong("contractorMobile"));
			    contractor.setContractorCompany(rs.getString("contractorCompany"));
			    contractor.setPassword(rs.getString("password"));
			    contractor.setSubscriptionId(rs.getInt("subscriptionId"));
			    contractor.setPreviousSubscription(rs.getInt("prevsubscriptionId"));
			
			
			
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
	public Lead getContracorLeadDetails(int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		
           query="SELECT * FROM leads l JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode JOIN budget_ranges br ON br.budget_ranges_id=l.bugget_range_id WHERE l.LeadID=?" ;
           Lead lead=new Lead();
		try {
			
			ps=con.prepareStatement(query);
			/*ps.setInt(1,contractorId);*/
			ps.setInt(1,leadId);
			
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
			BudgetRanges budgetRange=new BudgetRanges();
			budgetRange.setBudget_ranges_id(rs.getInt("budget_ranges_id"));
			budgetRange.setMin_value(rs.getInt("min_value"));
			budgetRange.setMax_value(rs.getInt("max_value"));
			
			lead.setBudgetrange(budgetRange);
			
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return  lead;
	}

	@Override
	public String addEmployee(Employee employee) {
		
		con=DBConnection.getConnection();
		query="INSERT INTO contractor_employee SET contractorId=?,employee_name=?,employee_email=?,employee_password=?,employe_mobile=?,employee_type=?";
		
           try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,employee.getContractor_id());
			ps.setString(2, employee.getEmployee_name());
			ps.setString(3, employee.getEmployee_email());	
			ps.setString(4, employee.getEmployee_password());
			ps.setLong(5, employee.getEmployee_mobile());
			ps.setString(6, employee.getEmployee_type());
			
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
	public List<Employee> getAllEmployee(int contractorId) {
		
		  con=DBConnection.getConnection();
		
          query="SELECT * FROM contractor_employee WHERE contractorId=?" ;
        
		List<Employee> employeeList=new ArrayList<>();
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
			Employee employee=new Employee();
			employee.setEmployee_id(rs.getInt("employee_id"));
			employee.setContractor_id(rs.getInt("contractorId"));
			employee.setEmployee_name(rs.getString("employee_name"));
			employee.setEmployee_email(rs.getString("employee_email"));
			employee.setEmployee_password(rs.getString("employee_password"));	
			employee.setEmployee_mobile(rs.getLong("employe_mobile"));	
			employee.setEmployee_type(rs.getString("employee_type"));	
				
			employeeList.add(employee);
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return  employeeList;
	}

	@Override
	public List<Employee> getAllEstimators(int contractorId) {
		
		con=DBConnection.getConnection();
		query="SELECT * FROM contractor_employee WHERE contractorId=? AND employee_type=? " ;
        
		List<Employee> estimatorList=new ArrayList<>();
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			ps.setString(2,"estimator");
			rs=ps.executeQuery();
			
			while(rs.next()){
				
			Employee employee=new Employee();
			employee.setEmployee_id(rs.getInt("employee_id"));
			employee.setContractor_id(rs.getInt("contractorId"));
			employee.setEmployee_name(rs.getString("employee_name"));
			employee.setEmployee_email(rs.getString("employee_email"));
			employee.setEmployee_password(rs.getString("employee_password"));	
			employee.setEmployee_mobile(rs.getLong("employe_mobile"));	
			employee.setEmployee_type(rs.getString("employee_type"));	
				
			estimatorList.add(employee);
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return  estimatorList;
	}

	@Override
	public List<Employee> getAllInstaller(int contractorId) {
		
		con=DBConnection.getConnection();
		
      query="SELECT * FROM contractor_employee WHERE contractorId=? AND employee_type=?" ;
        
		List<Employee> installerList=new ArrayList<>();
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			ps.setString(2,"installer");
			rs=ps.executeQuery();
			
			while(rs.next()){
				
			Employee employee=new Employee();
			
			employee.setEmployee_id(rs.getInt("employee_id"));
			employee.setContractor_id(rs.getInt("contractorId"));
			employee.setEmployee_name(rs.getString("employee_name"));
			employee.setEmployee_email(rs.getString("employee_email"));
			employee.setEmployee_password(rs.getString("employee_password"));	
			employee.setEmployee_mobile(rs.getLong("employe_mobile"));	
			employee.setEmployee_type(rs.getString("employee_type"));		
				
			installerList.add(employee);
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return  installerList;
	}

	@Override
	public String addAssign(Assign assigned) {
		
		con=DBConnection.getConnection();
		
		    try {
				
		   query="INSERT INTO contractor_assigned_leads (contractorId,LeadID) values(?,?)";	
			ps=con.prepareStatement(query);
			ps.setInt(1,assigned.getContractorId());
			ps.setInt(2,assigned.getLeadID());
		
			
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
	public List<Lead> getContractorAssignedLeads(int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT *  FROM leads l JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  JOIN contractor_assigned_leads a ON l.LeadID=a.LeadID WHERE a.contractorId=?   ORDER BY a.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
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
			lead.setLead_status(rs.getString("lead_status"));
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
	public List<Contractor> getContractorDetails(int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<Contractor> contractorList=new ArrayList<>();
		 query="SELECT * FROM contractor c JOIN contractorservices cs ON c.contractorId=cs.contractorId JOIN contractorlocations cl ON c.contractorId=cl.contractorId JOIN locations loc ON loc.locationId=cl.locationId JOIN services s ON s.serviceId=cs.serviceId JOIN subscriptions sub ON sub.subscriptionId=c.subscriptionId  WHERE c.contractorId=?";
		    
		    
				try {
					
					ps=con.prepareStatement(query);
					ps.setInt(1, contractorId);
					rs=ps.executeQuery();
					while(rs.next()){
						Contractor contractor=new Contractor();	
					    contractor.setContractorId(rs.getInt("contractorId"));	
						contractor.setContractorName(rs.getString("contractorName"));
					    contractor.setContractorEmail(rs.getString("contractorEmail"));
					    contractor.setContractorMobileNumber(rs.getLong("contractorMobile"));
					    contractor.setContractorCompany(rs.getString("contractorCompany"));
					    contractor.setPassword(rs.getString("password"));
					    contractor.setContractorAddress(rs.getString("contractorAddress"));
					    contractor.setContractorRegDate(rs.getDate("contractorRegDate"));
					    contractor.setContractorPicture(rs.getString("contractorPicture"));
					    contractor.setContractorServiceId(rs.getInt("serviceId"));
					    contractor.setServiceName(rs.getString("serviceName"));
					    contractor.setContractorLocationsId(rs.getInt("locationId"));
					    contractor.setLocationName(rs.getString("locationName"));
					    contractor.setSubscriptionId(rs.getInt("subscriptionId"));
					    contractor.setSubscriptionName(rs.getString("subscriptionName"));
					    contractorList.add(contractor);
					}
					} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DbUtils.closeQuietly(con, ps, rs);
				}
				return contractorList;
	}

	@Override
	public String applyLead(Assign assigned) {
		
		con=DBConnection.getConnection();

		query="INSERT INTO contractor_applied_leads (contractorId,LeadID) values(?,?)";
		
           try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,assigned.getContractorId());
			ps.setInt(2,assigned.getLeadID());
		
			
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
	public List<Lead> getContractorAppliedLeads(int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM leads l JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  JOIN contractor_applied_leads a ON l.LeadID=a.LeadID WHERE contractorId=?    ORDER BY a.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
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
			lead.setLead_status(rs.getString("lead_status"));
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
	public String deleteAppliedLead(Assign assigned) {
		
		con=DBConnection.getConnection();
		
		try {
	    query="delete from contractor_applied_leads WHERE LeadID=? AND contractorId=?";
		ps=con.prepareStatement(query);  
		ps.setInt(1,assigned.getLeadID());
		ps.setInt(2,assigned.getContractorId());
		
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
	public String addFollowUp(FollowUp follow) {
		
		con=DBConnection.getConnection();
		
		query="INSERT INTO lead_follow_up SET LeadId=?,contractorId=?,timestamp=STR_TO_DATE(?, '%m/%d/%Y %h:%i %p'),note=?";
		
        try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,follow.getLeadId());
			ps.setInt(2,follow.getContractorId());
			ps.setString(3, follow.getTimestamp());
			ps.setString(4, follow.getNote());	
			
			
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
	public List<FollowUp> getAllFollowUp(int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<FollowUp> followList=new ArrayList<>();
		query="SELECT * FROM lead_follow_up f JOIN leads l ON f.LeadId=l.LeadID WHERE contractorId=?  AND DATE(f.timestamp)=DATE(current_timestamp)" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1, contractorId);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				FollowUp follow=new FollowUp();
			    
				follow.setFollow_up_id(rs.getInt("follow_up_id"));
				follow.setLeadId(rs.getInt("LeadId"));
				follow.setContractorId(rs.getInt("contractorId"));
				follow.setTimestamp(rs.getString("timestamp"));
				follow.setNote(rs.getString("note"));
				follow.setName(rs.getString("Name"));
				follow.setEmail(rs.getString("Email"));
				follow.setMobile(rs.getLong("Mobile"));
				followList.add(follow);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return followList;
	}

	@Override
	public List<FollowUp> getAllFollowUpByLead(int leadId,int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<FollowUp> followList=new ArrayList<>();
		query="SELECT * FROM lead_follow_up WHERE LeadId=? AND contractorId=? " ;
		
		try {
			
			ps=con.prepareStatement(query);
			
			ps.setInt(1, leadId);
			ps.setInt(2, contractorId);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				FollowUp follow=new FollowUp();
			    
				follow.setFollow_up_id(rs.getInt("follow_up_id"));
				follow.setLeadId(rs.getInt("LeadId"));
				follow.setContractorId(rs.getInt("contractorId"));
				follow.setTimestamp(rs.getString("timestamp"));
				follow.setNote(rs.getString("note"));
			     
				followList.add(follow);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return followList;
	}

	@Override
	public String addContractorLead(int leadId, int contractorId) {

		con=DBConnection.getConnection();
		
		query="INSERT INTO contractor_leads SET LeadID=?,contractorId=?";
        try {
			
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
	public List<FollowUp> getTodaysFollowUp(int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<FollowUp> followList=new ArrayList<>();
		query="SELECT * FROM lead_follow_up f  WHERE LeadId=? AND contractorId=? AND DATE(f.timestamp)=DATE(current_timestamp)" ;
		
		try {
			
			ps=con.prepareStatement(query);
			
			ps.setInt(1, leadId);
			ps.setInt(2, contractorId);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				FollowUp follow=new FollowUp();
			    
				follow.setFollow_up_id(rs.getInt("follow_up_id"));
				follow.setLeadId(rs.getInt("LeadId"));
				follow.setContractorId(rs.getInt("contractorId"));
				follow.setTimestamp(rs.getString("timestamp"));
				follow.setNote(rs.getString("note"));
			     
				followList.add(follow);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return followList;
	}

	@Override
	public List<FollowUp> getPastFollowUp(int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<FollowUp> followList=new ArrayList<>();
		query="SELECT * FROM lead_follow_up f  WHERE LeadId=? AND contractorId=? AND DATE(f.timestamp)<DATE(current_timestamp)" ;
		
		try {
			
			ps=con.prepareStatement(query);
			
			ps.setInt(1, leadId);
			ps.setInt(2, contractorId);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				FollowUp follow=new FollowUp();
			    
				follow.setFollow_up_id(rs.getInt("follow_up_id"));
				follow.setLeadId(rs.getInt("LeadId"));
				follow.setContractorId(rs.getInt("contractorId"));
				follow.setTimestamp(rs.getString("timestamp"));
				follow.setNote(rs.getString("note"));
			     
				followList.add(follow);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return followList;
	}

	@Override
	public List<FollowUp> getUpcomingFollowUp(int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<FollowUp> followList=new ArrayList<>();
		query="SELECT * FROM lead_follow_up f  WHERE LeadId=? AND contractorId=? AND DATE(f.timestamp)>DATE(current_timestamp)";


		
		try {
			
			ps=con.prepareStatement(query);
			
			ps.setInt(1, leadId);
			ps.setInt(2, contractorId);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				FollowUp follow=new FollowUp();
			    
				follow.setFollow_up_id(rs.getInt("follow_up_id"));
				follow.setLeadId(rs.getInt("LeadId"));
				follow.setContractorId(rs.getInt("contractorId"));
				follow.setTimestamp(rs.getString("timestamp"));
				follow.setNote(rs.getString("note"));
			     
				followList.add(follow);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return followList;
	}

	@Override
	public String moveToConsulted(int leadId, int contractorId) {
		
		  con=DBConnection.getConnection();
		
		 query="INSERT INTO contractor_consulted_leads SET LeadID=?,contractorId=?";
			
		
		 try {
				
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
	public List<Lead> getConsultedLeadList(int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_consulted_leads ccl JOIN leads l ON ccl.LeadID=l.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  WHERE ccl.contractorId=?   ORDER BY ccl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
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
			lead.setLead_status(rs.getString("lead_status"));
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
	public int getFollowUpCount(int contractorId) {
		
		con=DBConnection.getConnection();
		
		query="SELECT COUNT(f.follow_up_id) FROM lead_follow_up f  WHERE  contractorId=? AND DATE(f.timestamp)=DATE(current_timestamp)" ;
		int count=0;
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1, contractorId);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				count=rs.getInt(1);
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return count;
	}

	@Override
	public String addLeadNote(LeadNotes leadNote) {
		
		con=DBConnection.getConnection();
		
		query="INSERT INTO lead_notes SET LeadID=?,contractorId=?,note_timestamp=?,note=?,note_image=?,employee_id=?,share=?";
		
		
		 try {
				
		    ps=con.prepareStatement(query);
			ps.setInt(1,leadNote.getLeadId());
			ps.setInt(2,leadNote.getContractorId());
			ps.setString(3, leadNote.getNote_timestamp());
			ps.setString(4, leadNote.getNote());
			ps.setString(5, leadNote.getImagepath());
			ps.setInt(6,leadNote.getEmployee_id());
			ps.setInt(7,leadNote.getShare());
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
	public List<LeadNotes> getLeadNotesById(int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<LeadNotes> notesList=new ArrayList<>();
		
		query="SELECT * FROM lead_notes  WHERE LeadId=? AND contractorId=? ORDER BY lead_notes_id";


		
		try {
			
			ps=con.prepareStatement(query);
			
			ps.setInt(1, leadId);
			ps.setInt(2, contractorId);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				LeadNotes note=new LeadNotes();
			    
				note.setLead_notes_id(rs.getInt("lead_notes_id"));
				note.setLeadId(rs.getInt("LeadId"));
				note.setContractorId(rs.getInt("contractorId"));
				note.setNote_timestamp(String.valueOf(rs.getTimestamp("note_timestamp")));
				note.setNote(rs.getString("note"));
				note.setImagepath(rs.getString("note_image"));
				note.setShare(rs.getInt("share"));
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
	public String addContractorLeadEmployeeDetails(ContractorLeadEmployeeDetails conLeadEmp) {
		
		con=DBConnection.getConnection();
		
		 try {
			   query="INSERT INTO contractor_lead_employee_details(contractorId,estimator_id,installer_id,LeadID) values(?,?,?,?)";	
				ps=con.prepareStatement(query);
				
				ps.setInt(1,conLeadEmp.getContractorId());
				ps.setInt(2,conLeadEmp.getEstimator_id());
				ps.setInt(3,conLeadEmp.getInstaller_id());
				ps.setInt(4,conLeadEmp.getLeadID());
			
				
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
	public String deleteAssignedLead(int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		
		try {
		    query="delete from contractor_assigned_leads WHERE LeadID=? AND contractorId=?";
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
	public String deleteContractorLead(String tablename, int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		try {
			
	  	    String  strQuery="delete from $tableName WHERE LeadID=? AND contractorId=?";
		    query =strQuery.replace("$tableName",tablename);
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
	public String moveContractorLead(String tablename, int leadId, int contractorId) {
		con=DBConnection.getConnection(); 
		try {
			
	  	    String  strQuery="INSERT INTO $tableName SET LeadID=?,contractorId=?";
		    query =strQuery.replace("$tableName",tablename);
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
	public List<Lead> getQuotedLeadList(int contractorId) {
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_quoted_leads ccl JOIN leads l ON ccl.LeadID=l.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  WHERE ccl.contractorId=?   ORDER BY ccl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
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
			lead.setLead_status(rs.getString("lead_status"));
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
	public Contractor getContractorById(int conID) {
		
		con=DBConnection.getConnection();
		
		query="SELECT * FROM contractor WHERE contractorId=?";
	    Contractor contractor=new Contractor();	
	    
			try {
				
				ps=con.prepareStatement(query);
				ps.setInt(1,conID);
				rs=ps.executeQuery();
				while(rs.next()){
					
				    contractor.setContractorId(rs.getInt("contractorId"));	
					contractor.setContractorName(rs.getString("contractorName"));
				    contractor.setContractorEmail(rs.getString("contractorEmail"));
				    contractor.setContractorMobileNumber(rs.getLong("contractorMobile"));
				    contractor.setContractorCompany(rs.getString("contractorCompany"));
				    contractor.setPassword(rs.getString("password"));
				    contractor.setContractorAddress(rs.getString("contractorAddress"));
				    contractor.setContractorRegDate(rs.getDate("contractorRegDate"));
				    contractor.setSubscriptionId(rs.getInt("subscriptionId"));
				    contractor.setPreviousSubscription(rs.getInt("prevsubscriptionId"));
				    contractor.setContractorPicture(rs.getString("contractorPicture"));
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
	public Contractor getContractorId(int conID) {
		
		con=DBConnection.getConnection();
		
		query="Select *,s.subscriptionName from contractor c JOIN subscriptions s on s.subscriptionId=c.subscriptionId where c.contractorId=?";
	    Contractor contractor=new Contractor();	
	    
			try {
				
				ps=con.prepareStatement(query);
				ps.setInt(1,conID);
				rs=ps.executeQuery();
				while(rs.next()){
					
				    contractor.setContractorId(rs.getInt("contractorId"));	
					contractor.setContractorName(rs.getString("contractorName"));
				    contractor.setContractorEmail(rs.getString("contractorEmail"));
				    contractor.setContractorMobileNumber(rs.getLong("contractorMobile"));
				    contractor.setContractorCompany(rs.getString("contractorCompany"));
				    contractor.setPassword(rs.getString("password"));
				    contractor.setSubscriptionName(rs.getString("subscriptionName"));
				
				
				
				
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
	public List<Lead> getContractorAssignedLeads() {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		
		/*query="SELECT * FROM leads l JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  JOIN contractor_assigned_leads a ON l.LeadID=a.LeadID"; 
		*/
		
		query="select *, count(ass.contractorId) as count from contractor_assigned_leads ass LEFT JOIN leads l On ass.LeadID=l.LeadID JOIN locations loc ON loc.locationId=l.PostalCode JOIN services ser ON ser.serviceId=l.ServiceId GROUP BY l.LeadID";
		
		/*query="SELECT l.LeadID FROM leads l JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  JOIN contractor_assigned_leads a ON l.LeadID=a.LeadID JOIN contractor_employee cemp ON cemp.employee_id=a.estimator_id JOIN contractor_employee ce2 ON ce2.employee_id=a.installer_id     ORDER BY a.LeadID" ;
		*/
		try {
			
			ps=con.prepareStatement(query);
			
			
			rs=ps.executeQuery();
			while(rs.next()){
				
			Lead lead=new Lead();
			
			
			lead.setLeadID(rs.getInt("LeadID"));
			lead.setServiceId(rs.getInt("ServiceId"));
			lead.setTimestamp(rs.getTimestamp("Timestamp"));
			lead.setName(rs.getString("Name"));
			/*lead.setDescription(rs.getString("Description"));
			lead.setEmail(rs.getString("Email"));
			lead.setAddress(rs.getString("Address"));
			lead.setMobile(rs.getLong("Mobile"));
			lead.setPostalCode(rs.getString("PostalCode"));*/
			lead.setServiceName(rs.getString("serviceName"));
			lead.setImage(rs.getString("Image"));
			lead.setLocationName(rs.getString("locationName"));
			lead.setContactorCount(rs.getInt("count"));
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
	public List<Lead> getContractorAppliedLeads() {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		/*query="SELECT * FROM leads l JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  JOIN contractor_applied_leads a ON l.LeadID=a.LeadID" ;
	*/	
		
		query="select *, count(ass.contractorId) as count from contractor_applied_leads ass LEFT JOIN leads l On ass.LeadID=l.LeadID JOIN locations loc ON loc.locationId=l.PostalCode JOIN services ser ON ser.serviceId=l.ServiceId GROUP BY l.LeadID";
		try {
			
			ps=con.prepareStatement(query);
			
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
			lead.setContactorCount(rs.getInt("count"));
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
	public List<Lead> getContractorSoldLeads(int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_sold_leads csl JOIN leads l ON csl.LeadID=l.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  WHERE csl.contractorId=?   ORDER BY csl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
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
			lead.setLead_status(rs.getString("lead_status"));
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
	public List<Lead> getContractorCancledLeads(int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_cancled_leads ccl JOIN leads l ON ccl.LeadID=l.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  WHERE ccl.contractorId=?   ORDER BY ccl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
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
	public List<Lead> getContractorWorkStartedLeads(int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_work_started_leads ccl JOIN leads l ON ccl.LeadID=l.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  WHERE ccl.contractorId=?   ORDER BY ccl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
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
			lead.setLead_status(rs.getString("lead_status"));
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
	public List<Lead> getContractorWorkCompletedLeads(int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_work_completed_leads ccl JOIN leads l ON ccl.LeadID=l.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  WHERE ccl.contractorId=?   ORDER BY ccl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
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
			lead.setLead_status(rs.getString("lead_status"));
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
	public List<Lead> getContractorClosedLeads(int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_closed_leads ccl JOIN leads l ON ccl.LeadID=l.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  WHERE ccl.contractorId=?   ORDER BY ccl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
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
	public List<Lead> getContractorInvoicedLeads(int contractorId) {
		
		con=DBConnection.getConnection();
		
		List<Lead> leadList=new ArrayList<>();
		query="SELECT * FROM contractor_invoiced_leads ccl JOIN leads l ON ccl.LeadID=l.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode  WHERE ccl.contractorId=?   ORDER BY ccl.LeadID" ;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
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
	public List<Lead> geAllContractorLeads(int contractorId) {
		
		con=DBConnection.getConnection();
		
		
		List<Lead> leadList=new ArrayList<>();
/*		query="SELECT * FROM assignedleads asl JOIN leads l ON asl.LeadID=l.LeadID JOIN services s ON l.ServiceId=s.serviceId JOIN locations loc ON loc.locationId=l.PostalCode WHERE contractorId=?";
*/		query="SELECT * FROM contractor_lead_employee_details le "
		+ "JOIN leads l ON l.LeadID=le.LeadID "
		+ "JOIN services s ON l.ServiceId=s.serviceId "
		+ "JOIN locations loc ON loc.locationId=l.PostalCode  "
		+ "WHERE le.contractorId=? "
		+ "ORDER BY le.LeadID";
		
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
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
	public int deleteLeadNote(int notes_id) {
		
		con=DBConnection.getConnection();
		
	  	query="DELETE FROM lead_notes WHERE lead_notes_id=?";
	   
	    
			try {
				
				ps=con.prepareStatement(query);
				ps.setInt(1,notes_id);
				count=ps.executeUpdate();
				
				
				
				}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			return count;
	}

	@Override
	public ContractorLimits getContractorLimits(int contractorId) {
		
		
		ContractorLimits conLimit=new ContractorLimits();

		con=DBConnection.getConnection();
		
		
		query="SELECT * FROM contractor_limits WHERE  contractorId=?";
		
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				conLimit.setContractorLimitsId(rs.getInt("contractorLimitsId"));
				conLimit.setContractorId(rs.getInt("contractorId"));
				conLimit.setRenoLeadLimit(rs.getInt("renoLeadLimit")); 
				conLimit.setPurchaseLeadLimit(rs.getInt("purchaseLeadLimit")); 
				conLimit.setCreateLeadLimit(rs.getInt("createLeadLimit"));
				conLimit.setCreateEmployeeLimit(rs.getInt("createEmployeeLimit"));
				conLimit.setCreateSubConLimit(rs.getInt("createSubConLimit"));
				
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		return conLimit;
	}

	@Override
	public boolean isSubscriptionExpired(int contractorId) {
		
		ContractorLimits conLimit=getContractorLimits(contractorId);
		
		
	       if(conLimit.getRenoLeadLimit()==0){
		    	 
		    	   if(conLimit.getPurchaseLeadLimit()==0 || conLimit.getCreateLeadLimit()==0 ||
		    			   conLimit.getCreateEmployeeLimit()==0 ||
		    			   conLimit.getCreateSubConLimit()==0){
		    		   
		    		  
		    		   status=true;
		    	   } 
			
		     }else if(conLimit.getPurchaseLeadLimit()==0){ 
		    	 
		    	 if(conLimit.getRenoLeadLimit()==0 || conLimit.getCreateLeadLimit()==0 ||
		    			   conLimit.getCreateEmployeeLimit()==0 ||
		    			   conLimit.getCreateSubConLimit()==0){
		    		   
		    		 status=true;
		    	   } 
			
		   }
		     
		     
			return status;
	}

	@Override
	public int changeContractorSubscription(int contractorId,int current_subId,int prev_sub_id) {
			 
		con=DBConnection.getConnection();
		
	  	query="UPDATE contractor SET subscriptionId=?,prevsubscriptionId=? WHERE contractorId=?";
	   
	    
			try {
				
				ps=con.prepareStatement(query);
				ps.setInt(1,current_subId);
				ps.setInt(2,prev_sub_id);
				ps.setInt(3,contractorId);
				
				count=ps.executeUpdate();
				
				
				
				}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			return count;
	}

	@Override
	public boolean validateEmployeeEmail(String employee_email,int contractorId) {
		con=DBConnection.getConnection();
		boolean empAvailable=false;
	     	try {
				
				/*ps=con.prepareStatement("SELECT employee_email FROM contractor_employee WHERE employee_email=? AND contractorId=?");*/
	     		ps=con.prepareStatement("SELECT employee_email FROM contractor_employee WHERE employee_email=?");
				ps.setString(1,employee_email);
				/*ps.setInt(2,contractorId);*/
				rs=ps.executeQuery();
				if(rs.next()){
					
					empAvailable=true;
				
				
				}
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			return empAvailable;
	}

	@Override
	public boolean validateContractorLead(int lead_id,int contractorId) {
		
       con=DBConnection.getConnection();
		boolean leadPresence=false;
			try {
				
				ps=con.prepareStatement("SELECT LeadID FROM contractor_lead_employee_details WHERE LeadID=? AND contractorId=?");
				
			
				ps.setInt(1,lead_id);
				ps.setInt(2,contractorId);
				
				rs=ps.executeQuery();
				
				if(rs.next()){
					
					leadPresence=true;
				
				
				}
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			System.out.println(leadPresence+"=leadPresence");
			return leadPresence;
	}

	@Override
	public List<Integer> getContractorServices(int contractor_id) {
		con=DBConnection.getConnection();
		
		List<Integer> services=new ArrayList<>();
		
			try {
				
				ps=con.prepareStatement("SELECT cs.serviceId FROM contractorservices cs JOIN services s ON cs.serviceId=s.serviceId WHERE cs.contractorId=?");
				ps.setInt(1,contractor_id);
				rs=ps.executeQuery();
				while(rs.next()){
				  services.add(rs.getInt(1));
				}
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			System.out.println("servicesSize="+services.size());
			return services;
	}

	@Override
	public List<Locations> getContractorLocations(int contractor_id) {
		con=DBConnection.getConnection();
		List<Locations> locations=new ArrayList<>();
			try {
				
				ps=con.prepareStatement("SELECT cl.contractorLocationsId,l.locationName  FROM contractorlocations cl JOIN locations l ON cl.locationId=l.locationId  WHERE cl.contractorId=?");
				ps.setInt(1,contractor_id);
			    rs=ps.executeQuery();
				while(rs.next()){
				
					Locations location=new Locations();
					
					location.setLocatonId(rs.getInt(1));
					location.setLocationName(rs.getString(2));
				
					locations.add(location);
				}
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			System.out.println("locationsSize="+locations.size());
			return locations;
	}

	@Override
	public boolean updateContractor(Contractor contractor) {
		con=DBConnection.getConnection();
		boolean update=false;
			try {
				
				ps=con.prepareStatement("UPDATE  contractor SET contractorName=?,contractorMobile=?,contractorCompany=?,contractorAddress=?  WHERE contractorId=?");
				ps.setString(1,contractor.getContractorName());
				ps.setLong(2,contractor.getContractorMobileNumber());
				ps.setString(3,contractor.getContractorCompany());
				ps.setString(4,contractor.getContractorAddress());
				ps.setInt(5,contractor.getContractorId());
			    int i=ps.executeUpdate();
				
			    if(i>0){
			    	
			    	update=true;
			    }
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return update;
	}

	@Override
	public boolean deleteContractorServices(int contractor_id) {
		con=DBConnection.getConnection();
		boolean serDeleted=false;
			try {
				
				ps=con.prepareStatement("DELETE FROM contractorservices  WHERE contractorId=?");
				ps.setInt(1,contractor_id);
			    int i=ps.executeUpdate();
				
			    if(i>0){
			    	
			    	serDeleted=true;
			    }
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return serDeleted;
		
	}

	@Override
	public boolean deleteContractorLocations(int contractor_id) {
		con=DBConnection.getConnection();
		boolean locDeleted=false;
			try {
				
				ps=con.prepareStatement("DELETE FROM contractorlocations  WHERE contractorId=?");
				ps.setInt(1,contractor_id);
				
			    int i=ps.executeUpdate();
				
			    if(i>0){
			    	
			    	locDeleted=true;
			    }
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return locDeleted;
		
	}

	@Override
	public boolean uploadProfilePicture(String finalPath, int contractorId) {
		
		con=DBConnection.getConnection();
		boolean updatePicture=false;
			try {
				
				ps=con.prepareStatement("UPDATE  contractor SET contractorPicture=? WHERE contractorId=?");
				ps.setString(1,finalPath);
				ps.setInt(2,contractorId);
			    int i=ps.executeUpdate();
				
			    if(i>0){
			    	
			    	updatePicture=true;
			    }
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return updatePicture;
	}

	@Override
	public List<DocumentTypes> getDocumentTypes(int contractorId) {
		con=DBConnection.getConnection();
		List<DocumentTypes> docTypes=new ArrayList<>();
			try {
				
				ps=con.prepareStatement("SELECT * FROM document_types");
				/*ps.setInt(1,contractorId);*/
			    rs=ps.executeQuery();
				while(rs.next()){
				
					DocumentTypes docType=new DocumentTypes();
					
					docType.setType_id(rs.getInt(1));
					docType.setDocument_type(rs.getString(2));
				
					docTypes.add(docType);
				}
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return docTypes;
	}

	@Override
	public int deleteDocumentType(int type_id) {
		con=DBConnection.getConnection();
		int dres=0;
			try {
				
				ps=con.prepareStatement("DELETE FROM document_types  WHERE type_id=?");
				ps.setInt(1,type_id);
				dres=ps.executeUpdate();
				
			    
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return dres;
	}

	@Override
	public int addDocumentType(String document_type) {
		con=DBConnection.getConnection();
		int dres=0;
			try {
				
				ps=con.prepareStatement("INSERT INTO  document_types  SET type_name=?");
				ps.setString(1,document_type);
				dres=ps.executeUpdate();
				
			    
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return dres;
	}

	@Override
	public boolean validateDocumentType(String document_type) {
		con=DBConnection.getConnection();
		boolean docTypePresence=true;
			try {
				
				ps=con.prepareStatement("SELECT type_id FROM document_types WHERE type_name=?");
				
			
				ps.setString(1,document_type);
				
				rs=ps.executeQuery();
				
				if(rs.next()){
					
					docTypePresence=false;
				
				
				}
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return docTypePresence;
	}

	@Override
	public int saveFinalWorkReport(FinalWorkReport workReport) {
		con=DBConnection.getConnection();
		int id=0;
		int fres=0;
		query="INSERT INTO final_work_report SET LeadID=?,contractorId=?,receiver_email=?,subject=?,message=? ";
		
			try {
				
				ps=con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
				
				ps.setInt(1,workReport.getLeadId());
				ps.setInt(2,workReport.getContractorId());
				ps.setString(3,workReport.getTo());
				ps.setString(4,workReport.getSubject());
				ps.setString(5,workReport.getMesage());
				
				fres=ps.executeUpdate();
				
				if(fres>0){
					
					rs=ps.getGeneratedKeys();	
				
				
				while(rs.next()){
					
					id=rs.getInt(1);
				}
				
				
				System.out.println("Generated_Id="+id);
				}
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return id;
	}

	@Override
	public int saveFinalWorkReportFiles(FinalWorkReportFiles reportFile) {
		con=DBConnection.getConnection();
		int fres=0;
		query="INSERT INTO final_work_report_files SET report_id=?,file_path_web=?,file_path_actual=? ";
		   try {
				
				ps=con.prepareStatement(query);
				
				ps.setInt(1,reportFile.getReport_id());
				ps.setString(2,reportFile.getFile_path_web());
				ps.setString(3,reportFile.getFile_path_actual());
				
				
				fres=ps.executeUpdate();
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return fres;
	}

	@Override
	public Lead getContracorLeadEmployeeDetails(int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		
        query="SELECT cemp.employee_id AS estimator_id,cemp.employee_name AS estimator_name,ce2.employee_id AS installer_id,ce2.employee_name AS installer_name  "
        		+ "FROM contractor_lead_employee_details ced "
        		+ "JOIN contractor_employee cemp ON cemp.employee_id=ced.estimator_id "
        		+ "JOIN contractor_employee ce2 ON ce2.employee_id=ced.installer_id "
        		+ "WHERE ced.contractorId=? "
        		+ "AND ced.LeadID=?";
        
        
          Lead lead=new Lead();
        
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			ps.setInt(2,leadId);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
			lead.setEstimatorId(rs.getInt("estimator_id"));
			lead.setEstimatorName(rs.getString("estimator_name"));
			lead.setInstallerId(rs.getInt("installer_id"));
			lead.setInstallerName(rs.getString("installer_name"));
			
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return  lead;
	}

	@Override
	public Subscriptions getContractorSubscription(int contractorId) {
        
		con=DBConnection.getConnection();
		Subscriptions sub=new Subscriptions();
		query="SELECT * FROM  subscriptions s LEFT JOIN contractor c ON s.subscriptionId=c.subscriptionId  WHERE c.contractorId=?";
		try {
			
			
			ps=con.prepareStatement(query);
			ps.setInt(1, contractorId);
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
	public Employee getLeadEstimator(int leadId, int contractorId) {
		con=DBConnection.getConnection();
		
        query="SELECT * FROM contractor_employee e JOIN contractor_lead_employee_details ced ON e.contractorId=ced.contractorId WHERE ced.contractorId=? AND ced.LeadID=? AND e.employee_type='estimator'" ;
      
        Employee employee=new Employee();
        
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			ps.setInt(2,leadId);
			
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
	public Employee getLeadInstaller(int leadId, int contractorId) {
		con=DBConnection.getConnection();
		
        query="SELECT * FROM contractor_employee e JOIN contractor_lead_employee_details ced ON e.contractorId=ced.contractorId WHERE ced.contractorId=? AND ced.LeadID=? AND e.employee_type='installer'" ;
        Employee employee=new Employee();
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			ps.setInt(2,leadId);
			
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
	public int uploadCompanyLogo(String webPath, String realPath, int contractorId) {
		con=DBConnection.getConnection();
		int fres=0;
		query="UPDATE contractor SET logo_web_path=?,logo_real_path=? WHERE contractorId=?";
		   try {
				
				ps=con.prepareStatement(query);
				
				ps.setString(1,webPath);
				ps.setString(2,realPath);
				ps.setInt(3,contractorId);
				
				
				fres=ps.executeUpdate();
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return fres;
	}

	@Override
	public String getCompanyLogo(int contractorId) {
		con=DBConnection.getConnection();
		String logo="";
		query="SELECT logo_web_path FROM contractor WHERE contractorId=?";
		   try {
				
				ps=con.prepareStatement(query);
				
				
				ps.setInt(1,contractorId);
				
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					logo=rs.getString(1);
					
					
					}
				
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return logo;
	}

	@Override
	public String getCompanyRealLogo(int contractorId) {
		con=DBConnection.getConnection();
		String logo="";
		query="SELECT logo_real_path FROM contractor WHERE contractorId=?";
		   try {
				
				ps=con.prepareStatement(query);
				
				
				ps.setInt(1,contractorId);
				
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					logo=rs.getString(1);
					
					
					}
				
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return logo;
	}

	@Override
	public int getContractorClosedLeadsCount(int contractorId) {
		con=DBConnection.getConnection();
		int cCount=0;
		query="SELECT COUNT(con_close_id) FROM contractor_closed_leads WHERE contractorId=?";
		
		   try {
				
				ps=con.prepareStatement(query);
				
				
				ps.setInt(1,contractorId);
				
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					cCount=rs.getInt(1);
					
					
					}
				
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return cCount;
	}

	@Override
	public int getContractorByiedLeadsCount(int contractorId) {
		con=DBConnection.getConnection();
		int bCount=0;
		
		query="SELECT COUNT(lead_emp_details_id) FROM contractor_lead_employee_details WHERE contractorId=?";
		   try {
				
				ps=con.prepareStatement(query);
				
				
				ps.setInt(1,contractorId);
				
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					bCount=rs.getInt(1);
					
					
					}
				
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return bCount;
	}

	@Override
	public FinalWorkReport getFinalReport(int leadId, int contractorId) {
		con=DBConnection.getConnection();
		
		 FinalWorkReport report=new FinalWorkReport();
		 
		query="SELECT * FROM final_work_report fr WHERE fr.LeadID=? AND fr.contractorId=?";
		   try {
				
				ps=con.prepareStatement(query);
				
				ps.setInt(1,leadId);
				ps.setInt(2,contractorId);
				
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					report.setReport_id(rs.getInt("report_id"));
					report.setTo(rs.getString("receiver_email"));
					report.setContractorId(rs.getInt("contractorId"));
					report.setSubject(rs.getString("subject"));
					report.setMesage(rs.getString("message"));
					report.setLeadId(rs.getInt("LeadID"));
				}
				
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return report;
	}

	@Override
	public List<FinalWorkReportFiles> getFinalReportFiles(int report_id) {
		con=DBConnection.getConnection();
		
		 List<FinalWorkReportFiles> files=new ArrayList<>();
		 
		query="SELECT * FROM final_work_report_files  WHERE report_id=?";
		   try {
				
				ps=con.prepareStatement(query);
				
				
				ps.setInt(1,report_id);
				
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					FinalWorkReportFiles file=new FinalWorkReportFiles();
					file.setFile_id(rs.getInt("file_id"));
					file.setReport_id(rs.getInt("report_id"));
					file.setFile_path_web(rs.getString("file_path_web"));
					file.setFile_path_actual(rs.getString("file_path_actual"));
					
					files.add(file);
				}
				
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return files;
	}

	@Override
	public int deleteFinalWorkReportFiles(int report_id) {
		con=DBConnection.getConnection();
		
		int resd=0;
		 
		query="DELETE FROM final_work_report_files  WHERE report_id=?";
		   try {
				
				ps=con.prepareStatement(query);
				
				
				ps.setInt(1,report_id);
				
				
				resd=ps.executeUpdate();
			
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return resd;
	}

	@Override
	public int updateFinalWorkReport(FinalWorkReport workReport) {
		con=DBConnection.getConnection();
		
		int fres=0;
		query="UPDATE final_work_report SET message=? WHERE report_id=?";
		
			try {
				
				ps=con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
				
				ps.setString(1,workReport.getMesage());
				ps.setInt(2,workReport.getReport_id());
				
				fres=ps.executeUpdate();
				
				
				
				
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return fres;
	}

	@Override
	public double getContractorTax(int contractorId) {
		con=DBConnection.getConnection();
		
		 double tax = 0;
		 
		query="SELECT t.gst+t.hst+t.pst+t.qst FROM contractor c JOIN   taxation t ON c.tax_id=t.tax_id WHERE contractorId=?";
		   try {
				
				ps=con.prepareStatement(query);
				
			
				ps.setInt(1,contractorId);
				
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
					tax=rs.getDouble(1);
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
	public int shareNote(int notes_id,int status) {
			con=DBConnection.getConnection();
		
		int inote=0;
		
		query="UPDATE lead_notes SET share=? WHERE lead_notes_id=?";
		
			try {
				
				ps=con.prepareStatement(query);
				
				ps.setInt(1,status);
				ps.setInt(2,notes_id);
				
				inote=ps.executeUpdate();
				
				
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return inote;

	}	

}
