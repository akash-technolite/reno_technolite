package com.tlite.dao.contractor;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;

import com.tlite.connection.DBConnection;
import com.tlite.pojo.Employee;
import com.tlite.pojo.Promotion;

public class IPromotionImpl implements IPromotion {

	 Connection con=null;
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	 int count;
	 String result="";
	
	@Override
	public String addPromotion(Promotion promotion) {
     
		con=DBConnection.getConnection();

		query="INSERT INTO promotions (promotion_name,type,discount_amount,expiry_date,description,contractorId,status) values(?,?,?,?,?,?,?)";
		
           try {
			
			ps=con.prepareStatement(query);
			ps.setString(1,promotion.getPromotion_name());
			ps.setString(2, promotion.getType());
			ps.setDouble(3, promotion.getDiscount_amount());	
			ps.setString(4,promotion.getExpiry_date());
			ps.setString(5, promotion.getDescription());
			ps.setInt(6, promotion.getContractorId());
			ps.setString(7, "active");
			ps.executeUpdate();
			
			
			
   		} catch (SQLException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
   		return "Contractor Added";
   	}


	@Override
	public List<Promotion> getAllPromotion(int contractorId) {
		
		con=DBConnection.getConnection();
		
       query="SELECT * FROM promotions WHERE contractorId=? " ;
        
		List<Promotion> employeeList=new ArrayList<Promotion>();
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				Promotion p=new Promotion();
			p.setPromotion_id(rs.getInt("promotion_id"));
			p.setContractorId(rs.getInt("contractorId"));
			p.setPromotion_name(rs.getString("promotion_name"));
			p.setType(rs.getString("type"));
			p.setDescription(rs.getString("description"));	
			p.setDiscount_amount(rs.getDouble("discount_amount"));	
			p.setExpiry_date(rs.getString("expiry_date"));	
			p.setStatus(rs.getString("status"));	
			employeeList.add(p);
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return  employeeList;
	}


	@Override
	public List<Promotion> getAllExipary() {
            
	       	con=DBConnection.getConnection();
		
			query="SELECT * from promotions u where day(u.expiry_date) = day(CURRENT_DATE) and month(u.expiry_date) = month(CURRENT_DATE)";
			List<Promotion> employeeList=new ArrayList<Promotion>();
			try {
				
				ps=con.prepareStatement(query);				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
				Promotion p=new Promotion();
				
				p.setPromotion_id(rs.getInt("promotion_id"));
				p.setContractorId(rs.getInt("contractorId"));
				p.setPromotion_name(rs.getString("promotion_name"));
				p.setType(rs.getString("type"));
				p.setDescription(rs.getString("description"));	
				p.setDiscount_amount(rs.getDouble("discount_amount"));	
				p.setExpiry_date(rs.getString("expiry_date"));	
					
				employeeList.add(p);
				}
				} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
			
			
			return  employeeList;
	}


	@Override
	public String RemoveExpiredPromotion() {
		
		con=DBConnection.getConnection();
      query="UPDATE promotions SET status='expired'  WHERE DATE(expiry_date)<=DATE(NOW()) ";
		
		try {
			
			ps=con.prepareStatement(query);
			 
		  
		    int update=ps.executeUpdate();
		  
		   
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
				
				
		
		
		
		return result;
	}


	@Override
	public List<Promotion> getAllActivePromotion(int contractorId) {
		
		con=DBConnection.getConnection();
		
		query="SELECT * FROM promotions p WHERE contractorId=? AND p.`status`='active'" ;
        
		List<Promotion> promoList=new ArrayList<Promotion>();
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,contractorId);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				Promotion p=new Promotion();
			p.setPromotion_id(rs.getInt("promotion_id"));
			p.setContractorId(rs.getInt("contractorId"));
			p.setPromotion_name(rs.getString("promotion_name"));
			p.setType(rs.getString("type"));
			p.setDescription(rs.getString("description"));	
			p.setDiscount_amount(rs.getDouble("discount_amount"));	
			p.setExpiry_date(rs.getString("expiry_date"));	
			p.setStatus(rs.getString("status"));	
			promoList.add(p);
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return  promoList;
	}



	
	
	
}
