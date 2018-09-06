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
import com.tlite.pojo.LeadInvoiceElement;
import com.tlite.pojo.WorkOrder;
import com.tlite.pojo.WorkOrderElement;

public class IWorkOrderImpl implements IWorkOrder {
	
	 Connection con=null;
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	  int res=0;
	 String result="";
	
	
	
	@Override
	public int saveWorkOrderElement(WorkOrderElement element) {
		
		con=DBConnection.getConnection();
		
		query="INSERT INTO work_order_element SET work_order_id=?,item_no=?,"
				+ "product=?,product_description=?,quantity=?,other=?";
		
		
		 try {
			
			ps=con.prepareStatement(query);
			
			ps.setInt(1,element.getWork_order_id());
			ps.setInt(2,element.getItem_no());
			ps.setString(3,element.getProduct());
			ps.setString(4,element.getProduct_description());
			ps.setInt(5,element.getQuantity());
			ps.setString(6,element.getOther());
			
			res=ps.executeUpdate();
			
			 
			
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		return res;
	}

	@Override
	public int saveWorkOrder(WorkOrder order) {
          
		con=DBConnection.getConnection();
		
		query="INSERT INTO work_order SET LeadId=?,contractorId=?,"
				+ "title=?,special_notes=?";
		
		
		
		 try {
			
			ps=con.prepareStatement(query);
			
			ps.setInt(1,order.getLeadId());
			ps.setInt(2,order.getContractorId());
			ps.setString(3,order.getTitle());
			ps.setString(4,order.getSpecial_notes());
			
			
			res=ps.executeUpdate();
			
			 
			
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		return res;
	}

	@Override
	public int deleteWorkOrderElement(int work_order_id,int item_no) {
		con=DBConnection.getConnection();
		
		 query="DELETE FROM work_order_element WHERE work_order_id=? AND item_no=?";
		
		
            try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,work_order_id);
			ps.setInt(2,item_no);
			
			
			res=ps.executeUpdate();
			
			 
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}	
		return res;
	}

	@Override
	public List<WorkOrderElement> getWorkOrderElement(int work_order_id) {
		    
		   con=DBConnection.getConnection();
		
		
		   List<WorkOrderElement> elementList=new ArrayList<>();
				
				query="SELECT * FROM work_order_element  WHERE work_order_id=?";
				
				
		            try {
		        	
					ps=con.prepareStatement(query);
					ps.setInt(1, work_order_id);
			    	rs=ps.executeQuery();
			    	
		            while(rs.next()){
		            	
		            	WorkOrderElement element=new WorkOrderElement();
		        		
		            	element.setWork_order_element_id(rs.getInt("work_order_element_id"));
		            	element.setWork_order_id(rs.getInt("work_order_id"));
		            	element.setItem_no(rs.getInt("item_no"));
		            	element.setProduct(rs.getString("product"));
		            	element.setProduct_description(rs.getString("product_description"));
		            	element.setQuantity(rs.getInt("quantity"));
		            	element.setOther(rs.getString("other"));
		            	
		        		elementList.add(element);
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
	public WorkOrder getWorkOrder(int work_order_id) {
		 con=DBConnection.getConnection();
			
		 WorkOrder order=new WorkOrder();
		 
				
				  query="SELECT * FROM work_order  WHERE work_order_id=?";
				
				
		            try {
		        	
					ps=con.prepareStatement(query);
					ps.setInt(1, work_order_id);
					
			    	rs=ps.executeQuery();
			    	
		            while(rs.next()){
		            	
		            	
		        		
                       order.setWork_order_id(rs.getInt("work_order_id"));
                       order.setLeadId(rs.getInt("LeadId"));
                       order.setContractorId(rs.getInt("contractorId"));
                       order.setTitle(rs.getString("title"));
                       order.setSpecial_notes(rs.getString("special_notes"));
                      
                   
		            	
		            }	
				
					} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DbUtils.closeQuietly(con, ps, rs);
				}
				
				
				return order;
	}

	@Override
	public int getItemNumber(int work_order_id) {
		
      con=DBConnection.getConnection();
		
		query="SELECT MAX(DISTINCT(we.item_no)) FROM work_order_element we WHERE we.work_order_id=?" ;
		
		int item_code=0;
		
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1, work_order_id);
			
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
	public int getNewWorkOrderId() {
		
        con=DBConnection.getConnection();
		
		query="SELECt MAX(work_order_id) FROM work_order;" ;
		int work_order_id=0;
		try {
			
			ps=con.prepareStatement(query);
			
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				work_order_id=rs.getInt(1);
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return work_order_id;
	}

	@Override
	public int updateWorkOrder(WorkOrder order) {
		
           con=DBConnection.getConnection();
		
		query="UPDATE work_order SET title=?,special_notes=? WHERE work_order_id=?;";
		
		
		
		 try {
			
			ps=con.prepareStatement(query);
			
			ps.setString(1,order.getTitle());
			ps.setString(2,order.getSpecial_notes());
			ps.setInt(3,order.getWork_order_id());
			
			res=ps.executeUpdate();
			
			
			} catch (SQLException e) {
				
		   e.printStackTrace();
		 
		}finally {
			
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		return res;
	}

	@Override
	public List<WorkOrder> getWorkOrdersByLeadId(int lead_id, int contractor_id) {
		
		   con=DBConnection.getConnection();
			
			    List<WorkOrder> ordersList=new ArrayList<>();
				
				query="SELECT * FROM work_order  WHERE LeadId=? AND contractorId=?";
				
				
		            try {
		        	
					ps=con.prepareStatement(query);
					ps.setInt(1, lead_id);
					ps.setInt(2, contractor_id);
			    	rs=ps.executeQuery();
			    	
		            while(rs.next()){
		            	
		            	 WorkOrder order=new WorkOrder();
		        		 order.setWork_order_id(rs.getInt("work_order_id"));
		                 order.setLeadId(rs.getInt("LeadId"));
		                 order.setContractorId(rs.getInt("contractorId"));
		                 order.setTitle(rs.getString("title"));
		                 order.setSpecial_notes(rs.getString("special_notes"));
		                 order.setWeb_path(rs.getString("web_path"));		
		                 order.setReal_path(rs.getString("real_path"));
		                 
		                 ordersList.add(order);
		            }	
				
					} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DbUtils.closeQuietly(con, ps, rs);
				}
				
				
				return ordersList;
	}

	@Override
	public int deleteWorkOrder(int work_order_id) {
		   
		   con=DBConnection.getConnection();
			
			query="DELETE FROM work_order  WHERE work_order_id=?;";
			
			
			
			 try {
				
				ps=con.prepareStatement(query);
				ps.setInt(1,work_order_id);
				res=ps.executeUpdate();
				
				
				} catch (SQLException e) {
					
			   e.printStackTrace();
			 
			}finally {
				
				DbUtils.closeQuietly(con, ps, rs);
			}
				
			return res;
	}

	@Override
	public int saveWorkOrderPaths(String webPath, String realPath, int work_order_id) {
         con=DBConnection.getConnection();
		int count=0;
		query="UPDATE work_order SET web_path=?,real_path=? WHERE work_order_id=? ";
		
			
        try {
			
			ps=con.prepareStatement(query);
			
			ps.setString(1,webPath);
			ps.setString(2,realPath);
			ps.setInt(3, work_order_id);
			count=ps.executeUpdate();
			
			  
			
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		return count;
	}

}
