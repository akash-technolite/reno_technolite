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
import com.tlite.pojo.LeadEstimation;
import com.tlite.pojo.LeadEstimationElement;

public class IEstimationImpl implements IEstimation {
	 Connection con=null;
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	 int count;
	 String result="";
	@Override
	public int getNextEstimationId() {
		con=DBConnection.getConnection();
		query="SELECt MAX(le.estimation_id) FROM lead_estimation le;" ;
		int estimation_id=0;
		try {
			
			ps=con.prepareStatement(query);
			
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				estimation_id=rs.getInt(1);
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return estimation_id;
	}
	@Override
	public int getNextItemCode(int estimation_id) {
		
		con=DBConnection.getConnection();
		
		query="SELECt MAX(DISTINCT(le.item_code)) FROM lead_estimation_elements le WHERE le.estimation_id=?" ;
		int item_code=0;
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1, estimation_id);
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				item_code=rs.getInt(1)+1;
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return item_code;
	}
	@Override
	public String addEstimation(LeadEstimation estimation) {
		
		con=DBConnection.getConnection();
		
		query="INSERT INTO lead_estimation SET estimation_date=?,LeadId=?,contractorId=?,total=?,estimation_title=?";
		
			
        try {
			
			ps=con.prepareStatement(query);
			
			ps.setString(1,estimation.getEstimation_date());
			ps.setInt(2,estimation.getLeadId());
			ps.setInt(3,estimation.getContractorId());
			ps.setDouble(4,estimation.getTotal());
			ps.setString(5,estimation.getEstimation_title());
			
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
	public String addEstimationElement(LeadEstimationElement estimationElement) {
		
		con=DBConnection.getConnection();
		
		/*query="INSERT INTO lead_estimation_elements SET estimation_id=?,item_code=?,date=?"
				+ ",service_description=?,quantity=?,price=?"
				+ ",tax=?,amount=?";*/
		
		query="INSERT INTO lead_estimation_elements SET estimation_id=?,item_code=?,date=?"
				+ ",service_description=?,quantity=?,price=?"
				+ ",amount=?";
        try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,estimationElement.getEstimation_id());
			ps.setInt(2,estimationElement.getItem_code());
			ps.setString(3, estimationElement.getDate());
			ps.setString(4, estimationElement.getService_description());	
			ps.setInt(5, estimationElement.getQuantity());	
			ps.setDouble(6, estimationElement.getPrice());	
			/*ps.setDouble(7, estimationElement.getTax());	*/
			ps.setDouble(7, estimationElement.getAmount());	
			
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
	public List<LeadEstimationElement> getEstimationElementById(int estimation_id) {
		
		con=DBConnection.getConnection();
		
		List<LeadEstimationElement> elementList=new ArrayList<>();
		
		query="SELECT * FROM lead_estimation_elements lee WHERE lee.estimation_id=?";
		
		
        try {
        	
			ps=con.prepareStatement(query);
			ps.setInt(1, estimation_id);
	    	rs=ps.executeQuery();
            while(rs.next()){
            	
            	LeadEstimationElement estimationElement=new LeadEstimationElement();
        		
            	estimationElement.setEstimation_element_id(rs.getInt("estimation_element_id"));
            	estimationElement.setEstimation_id(rs.getInt("estimation_id"));
        		estimationElement.setDate(rs.getString("date"));
        		estimationElement.setItem_code(rs.getInt("item_code"));
        		estimationElement.setService_description(rs.getString("service_description"));
        		estimationElement.setQuantity(rs.getInt("quantity"));
        		estimationElement.setPrice(rs.getDouble("price"));
        		/*estimationElement.setTax(rs.getDouble("tax"));*/
        		estimationElement.setAmount(rs.getDouble("amount"));
            	
        		elementList.add(estimationElement);
            }	
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		
		
		return elementList;
	}
	@Override
	public LeadEstimation getEstimationById(int estimation_id) {
		
		con=DBConnection.getConnection();
		
	 	LeadEstimation estimation=new LeadEstimation();
		query="SELECT * FROM lead_estimation le WHERE le.estimation_id=?";
		
		   try {
        	
			ps=con.prepareStatement(query);
			ps.setInt(1, estimation_id);
	    	rs=ps.executeQuery();
            while(rs.next()){
            	estimation.setEstimation_id(rs.getInt("estimation_id"));
            	estimation.setEstimation_date(rs.getString("estimation_date"));
            	estimation.setLeadId(rs.getInt("LeadId"));
            	estimation.setContractorId(rs.getInt("contractorId"));
            	estimation.setTotal(rs.getDouble("total"));
              }	
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		
		
		return estimation;
	}
	@Override
	public String updateEstimationTotal(Double total,int estimation_id) {
		
		con=DBConnection.getConnection();
		
		query="UPDATE lead_estimation SET total=? WHERE estimation_id=?";
		
		
        try {
			
			ps=con.prepareStatement(query);
			ps.setDouble(1,total);
			ps.setInt(2,estimation_id);
			
			
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
	public String deleteEstimationElement(int item_code, int estimation_id) {
		
		con=DBConnection.getConnection();
		
       query="DELETE FROM lead_estimation_elements WHERE estimation_id=? AND item_code=?";
		
		
        try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,estimation_id);
			ps.setInt(2,item_code);
			
			
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
	public List<LeadEstimation> getAllEstimationById(int leadId,int contractorId) {
		
		con=DBConnection.getConnection();
		
		
      List<LeadEstimation> estimationList=new ArrayList<>();
		
		query="SELECT * FROM lead_estimation le WHERE le.LeadId=? AND le.contractorId=?";
		
		
        try {
        	
			ps=con.prepareStatement(query);
			ps.setInt(1, leadId);
			ps.setInt(2, contractorId);
	    	rs=ps.executeQuery();
            while(rs.next()){
            	
            	LeadEstimation estimation=new LeadEstimation();
        		
            	estimation.setEstimation_id(rs.getInt("estimation_id"));
            	estimation.setEstimation_title(rs.getString("estimation_title"));
            	estimation.setEstimation_date(rs.getString("estimation_date"));
            	estimation.setLeadId(rs.getInt("LeadId"));
            	estimation.setContractorId(rs.getInt("contractorId"));
            	estimation.setTotal(rs.getDouble("total"));
            	estimation.setEstimation_status(rs.getString("estimation_status"));
            	estimation.setWeb_path(rs.getString("web_path"));
            	estimation.setReal_path(rs.getString("real_path"));
            	
            	estimationList.add(estimation);
            }	
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		
		
		return estimationList;
	}
	@Override
	public String updateEstimationStatus(String estimation_status,int estimation_id) {
		
		con=DBConnection.getConnection();
		
       query="UPDATE lead_estimation SET estimation_status=? WHERE estimation_id=?";
		
		
        try {
			
			ps=con.prepareStatement(query);
			ps.setString(1,estimation_status);
			ps.setInt(2,estimation_id);
			
			
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
	public int saveEstimationPaths(String webPath, String realPath,int estimation_id) {
     
		con=DBConnection.getConnection();
		
		query="UPDATE lead_estimation SET web_path=?,real_path=? WHERE estimation_id=? ";
		
			
        try {
			
			ps=con.prepareStatement(query);
			
			ps.setString(1,webPath);
			ps.setString(2,realPath);
			ps.setInt(3, estimation_id);
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
	public String getEstimationRealPath(int estimation_id) {
     con=DBConnection.getConnection();
		
	 	String real_path=null;
		query="SELECT real_path FROM lead_estimation  WHERE estimation_id=?";
		
		   try {
        	
			ps=con.prepareStatement(query);
			
			ps.setInt(1, estimation_id);
			
	    	rs=ps.executeQuery();
            while(rs.next()){
            	
            	real_path=rs.getString(1);
              }	
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		
		
		return real_path;
	}

}
