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
import com.tlite.pojo.Document;
import com.tlite.pojo.Employee;

public class IDocumentImpl implements IDocument{
	 Connection con=null;
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	 int res;
	 String result="";
	 boolean status=false;
	@Override
	public List<Document> getAllDocuments(int contractor_id) {

		 List<Document> documentList=new ArrayList<>();
		 con=DBConnection.getConnection();
		query="SELECT * FROM contractor_documents WHERE contractorId=? AND document_status='active' ";
		
	        try {
        	
			ps=con.prepareStatement(query);
			ps.setInt(1, contractor_id);
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
	public int saveDocument(Document document) {
		
        con=DBConnection.getConnection();
		
		query="INSERT INTO contractor_documents(contractorId,"
				+ "document_name,document_type,document_path,document_description,document_status) "
				+ "VALUES(?,?,?,?,?,?)";
		
		
	
		try {
			
		ps=con.prepareStatement(query);
		ps.setInt(1, document.getContractor_id());
		ps.setString(2, document.getDocument_name());
		ps.setString(3, document.getDocument_type());
		ps.setString(4, document.getDocument_path());
		ps.setString(5, document.getDocument_description());
		ps.setString(6, "active");
		res=ps.executeUpdate();	
	   
	    	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return res;
	}
	@Override
	public int disableDocument(int document_id) {
          con=DBConnection.getConnection();
		
		query="UPDATE contractor_documents  SET document_status='disabled' WHERE contractor_documents_id=?";
		
		
	
		try {
			
		ps=con.prepareStatement(query);
		ps.setInt(1,document_id);
		
		res=ps.executeUpdate();	
	   
	    	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return res;
	}
	@Override
	public Document getDocument(int document_id) {
		
	 	Document document=new Document();
		 con=DBConnection.getConnection();
		 
		 query="SELECT * FROM contractor_documents WHERE contractor_documents_id=?";
		
	        try {
       	
			ps=con.prepareStatement(query);
			
			ps.setInt(1, document_id);
	    	rs=ps.executeQuery();
	    	
           while(rs.next()){
        	   
           	document.setDocument_id(rs.getInt("contractor_documents_id"));
           	document.setContractor_id(rs.getInt("contractorId"));
           	document.setDocument_name(rs.getString("document_name"));
           	document.setDocument_type(rs.getString("document_type"));
           	document.setDocument_description(rs.getString("document_description"));
           	document.setDocument_path(rs.getString("document_path"));
           	document.setDocument_status(rs.getString("document_status"));
           
           }	
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return document;
	}
	@Override
	public int updateDocument(Document document) {
		
		System.out.println();
		 con=DBConnection.getConnection();
			
	query="UPDATE contractor_documents SET document_name=?,document_type=?,document_path=?,document_description=? WHERE contractor_documents_id=? ";
			
			try {
				
			ps=con.prepareStatement(query);
			
			ps.setString(1, document.getDocument_name());
			ps.setString(2, document.getDocument_type());
			ps.setString(3, document.getDocument_path());
			ps.setString(4, document.getDocument_description());
			ps.setInt(5, document.getDocument_id());
			
			res=ps.executeUpdate();	
		   
		    	
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			
			return res;
	}
	@Override
	public int shareDocument(int document_id, int employee_id) {
		con=DBConnection.getConnection();
		
		query="INSERT INTO contractor_shared_documents(contractor_documents_id,employee_id) VALUES(?,?)";
		
		
	
		try {
			
		ps=con.prepareStatement(query);
		ps.setInt(1,document_id);
		ps.setInt(2,employee_id);
		res=ps.executeUpdate();	
	   
	    	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return res;
	}
	@Override
	public boolean validateSharing(int document_id, int employee_id) {
		
		  con=DBConnection.getConnection();
			
			query="SELECT share_id FROM contractor_shared_documents  WHERE contractor_documents_id=? AND employee_id=?" ;
			    
			        try {
				
				    ps=con.prepareStatement(query);
				       
						ps.setInt(1,document_id);  
						ps.setInt(2,employee_id);  
						
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
	public List<Employee> getSharedList(int document_id) {
		 con=DBConnection.getConnection();
			
         query="SELECT ce.employee_id,ce.employee_name,ce.employee_type FROM contractor_employee ce JOIN contractor_shared_documents csd ON ce.employee_id=csd.employee_id  WHERE csd.contractor_documents_id=?" ;
       
		List<Employee> employeeList=new ArrayList<>();
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,document_id);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				
			Employee employee=new Employee();
			
			employee.setEmployee_id(rs.getInt("ce.employee_id"));
		
			employee.setEmployee_name(rs.getString("ce.employee_name"));
			
			employee.setEmployee_type(rs.getString("ce.employee_type"));	
				
			employeeList.add(employee);
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		
		return  employeeList;
	}

}
