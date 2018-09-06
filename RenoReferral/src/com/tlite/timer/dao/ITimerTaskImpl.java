package com.tlite.timer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.tlite.connection.DBConnection;

public class ITimerTaskImpl implements ITimerTask {

	 Connection con=DBConnection.getConnection();
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	
	
	@Override
	public int getDefaultHours() {
		
		int hours=0;
		
		query="SELECT timeout FROM defaultleadsetting";
		
		
		try {
			ps=con.prepareStatement(query);
		
		rs=ps.executeQuery();
		
	   while(rs.next()){
		
		
		hours=rs.getInt(1);
		
		
	     }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return hours ;
	}

}
