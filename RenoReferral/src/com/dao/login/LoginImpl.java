package com.dao.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.dbutils.DbUtils;

import com.tlite.connection.DBConnection;
import com.tlite.pojo.Contractor;
import com.tlite.pojo.Login;

public class LoginImpl implements ILogin {
	
 Connection con=null;
 Statement smt=null;
 PreparedStatement ps=null;
 ResultSet rs;
	
	
	
	
	@Override
	public String ValidateUser(Login user) {
		
		con=DBConnection.getConnection();
		
		String returnmsg=" ";
		String email=user.getEmail();
		String password=user.getPassword();
		String userType=user.getUserType();
		
	String query="select * from users where email=? AND password=? And userType=?";
	try {
			ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ps.setString(3, userType);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				
				if ((rs.getString("email").equalsIgnoreCase(email))
						&& (rs.getString("password").equals(password) && (rs.getString("userType").equals(userType)))) {
					returnmsg="success";
				} 
				
				
				else {
					returnmsg="failure";
				}
				
			}
			
			
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
	
	return returnmsg;
		
	
	}




	@Override
	public String ValidateContractor(Contractor contractor) {
		
		con=DBConnection.getConnection();
		
		String returnmsg=" ";
		String email=contractor.getContractorEmail();
		String password=contractor.getPassword();
		
		
	String query="select contractorEmail,password from contractor where contractorEmail=? AND password=?";
	try {
			ps=con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
				
				if ((rs.getString("ContractorEmail").equalsIgnoreCase(email))
						&& (rs.getString("password").equals(password))) {
					returnmsg="success";
				} 
				
				
				else {
					returnmsg="failure";
				}
				
			}
			
			
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
	
	return returnmsg;
		
	}

}
