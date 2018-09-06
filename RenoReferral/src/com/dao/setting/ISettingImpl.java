package com.dao.setting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.dbutils.DbUtils;

import com.tlite.connection.DBConnection;
import com.tlite.pojo.BudgetRanges;
import com.tlite.pojo.Services;

public class ISettingImpl implements ISetting {
	Connection con=null;
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	 int res;
	 String result="";
	 
	@Override
	public int addService(String service_name) {
		
		if(validateService(service_name)==0){
			
		con=DBConnection.getConnection();
		
		query="INSERT INTO services(serviceName) VALUES(?)";
		
	
				try {
					
				ps=con.prepareStatement(query);
				
				ps.setString(1,service_name);
				
				res=ps.executeUpdate();	
			   
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					DbUtils.closeQuietly(con, ps, rs);
				}
				
			}else{
				
				res=2;
			}
		
		return res;
	}

	@Override
	public int addBudgetRange(BudgetRanges range) {

		if(validateBudgetRange(range)==0){
		
		con=DBConnection.getConnection();
		
		query="INSERT INTO budget_ranges(min_value,max_value) VALUES(?,?)";

			
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setInt(1,range.getMin_value());
		ps.setInt(2,range.getMax_value());
	
		
		res=ps.executeUpdate();	
	   
		
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		}else{
				res=2;
				
			}	
	
		
		return res;
	}

	@Override
	public int validateBudgetRange(BudgetRanges range) {
		con=DBConnection.getConnection();

		      query="SELECT EXISTS(SELECT 1 FROM budget_ranges br WHERE br.min_value=? AND br.max_value=?);";

	
					try {
						
					ps=con.prepareStatement(query);
					
					ps.setInt(1,range.getMin_value());
					ps.setInt(2,range.getMax_value());
					
					
					rs=ps.executeQuery();	
					
					while(rs.next()){
						
					res=rs.getInt(1);
					
					}
					
					} catch (SQLException e) {
						e.printStackTrace();
					}finally {
						DbUtils.closeQuietly(con, ps, rs);
					}
					
					System.out.println("result"+res);
					
					return res;
	}
	
	public int validateService(String service_name) {
		con=DBConnection.getConnection();

		      query="SELECT EXISTS(SELECT 1 FROM services WHERE serviceName=?);";

					try {
						
					ps=con.prepareStatement(query);
					
					ps.setString(1,service_name);
					
					
					
					rs=ps.executeQuery();	
					
					while(rs.next()){
						
					res=rs.getInt(1);
					
					}
					
					} catch (SQLException e) {
						e.printStackTrace();
					}finally {
						DbUtils.closeQuietly(con, ps, rs);
					}
					
					System.out.println("result"+res);
					
					return res;
	}

	@Override
	public int deleteService(int service_id) {
		
			con=DBConnection.getConnection();
			
			query="DELETE  FROM  services  WHERE serviceId=? ";

				
			try {
				
			ps=con.prepareStatement(query);
			
			ps.setInt(1,service_id);
		
		    res=ps.executeUpdate();	
		   
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return res;
	}

	@Override
	public int deleteBudgetRange(int range_id) {
		con=DBConnection.getConnection();
		
		query="DELETE  FROM  budget_ranges  WHERE budget_ranges_id=? ";

			
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setInt(1,range_id);
	
	    res=ps.executeUpdate();	
	   
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return res;
	}

	@Override
	public int updateLeadPrice(double price) {

		con=DBConnection.getConnection();
		
		query="UPDATE defaultleadsetting SET lead_price=? WHERE defaultLeadSettingId=1";

			
		try {
			
		ps=con.prepareStatement(query);
		
		ps.setDouble(1,price);
	
	    res=ps.executeUpdate();	
	   
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return res;
	}

}
