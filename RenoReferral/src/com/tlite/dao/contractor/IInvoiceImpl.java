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
import com.tlite.pojo.LeadInvoice;
import com.tlite.pojo.LeadInvoiceElement;

public class IInvoiceImpl implements IInvoice {
	 Connection con=null;
	 Statement smt=null;
	 PreparedStatement ps=null;
	 ResultSet rs;
	 String query="";
	 int count;
	 String result="";
	 
	 
	@Override
	public int getNextInvoiceId() {
		
		con=DBConnection.getConnection();
		
		query="SELECt MAX(li.invoice_id) FROM lead_invoice li;" ;
		int invoice_id=0;
		try {
			
			ps=con.prepareStatement(query);
			
			
			rs=ps.executeQuery();
			while(rs.next()){
				
				invoice_id=rs.getInt(1);
			}
			} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
		
		return invoice_id;
	}

	@Override
	public int getNextItemCode(int invoice_id) {
		
		con=DBConnection.getConnection();
		
		query="SELECt MAX(DISTINCT(le.item_code)) FROM lead_invoice_elements le WHERE le.invoice_id=?" ;
		int item_code=0;
		try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1, invoice_id);
			
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
	public String addInvoice(LeadInvoice invoice) {
		
		con=DBConnection.getConnection();
		
		query="INSERT INTO lead_invoice SET invoice_date=?,invoice_title=?,"
				+ "LeadId=?,contractorId=?,estimation_id=?,subTotal=?,"
				+ "promoDiscount=?,taxRate=?,taxDueAmount=?,grossTotal=?,"
				+ "dueAmount=?,paymentAmount=?,tax_due_date=?,invoice_status=?,oldDueAmount=?,due_status=?";
		
		 try {
			
			ps=con.prepareStatement(query);
			
			ps.setString(1,invoice.getInvoice_date());
			ps.setString(2,invoice.getInvoice_title());
			ps.setInt(3,invoice.getLeadId());
			ps.setInt(4,invoice.getContractorId());
			ps.setInt(5,invoice.getEstimation_id());
			ps.setDouble(6,invoice.getSubTotal());
			ps.setString(7,invoice.getPromoDiscount());
			ps.setString(8,invoice.getTaxRate());
			ps.setDouble(9,invoice.getTaxDueAmount());
			ps.setDouble(10,invoice.getGrossTotal());
			ps.setDouble(11,invoice.getDueAmount());
			ps.setDouble(12,invoice.getPaymentAmount());
			ps.setString(13,invoice.getTax_due_date());
			ps.setString(14,invoice.getInvoice_status());
			ps.setDouble(15,invoice.getOldDueAmount());
			ps.setInt(16,invoice.getDue_status());
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
	public String addInvoiceElement(LeadInvoiceElement invoiceElement) {
		
		con=DBConnection.getConnection();
		
		query="INSERT INTO lead_invoice_elements SET invoice_id=?,item_code=?,service_date=?"
				+ ",service_description=?,quantity=?,price=?"
				+ ",amount=?";
		
        try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,invoiceElement.getInvoice_id());
			ps.setInt(2,invoiceElement.getItem_code());
			ps.setString(3, invoiceElement.getService_date());
			ps.setString(4, invoiceElement.getService_description());	
			ps.setInt(5, invoiceElement.getQuantity());	
			ps.setDouble(6, invoiceElement.getPrice());	
			/*ps.setDouble(7, estimationElement.getTax());	*/
			ps.setDouble(7, invoiceElement.getAmount());	
			
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
	public List<LeadInvoiceElement> getInvoiceElementById(int invoice_id) {
		
		con=DBConnection.getConnection();
		
		
   List<LeadInvoiceElement> elementList=new ArrayList<>();
		
		query="SELECT * FROM lead_invoice_elements lie WHERE lie.invoice_id=?";
		
		
        try {
        	
			ps=con.prepareStatement(query);
			ps.setInt(1, invoice_id);
	    	rs=ps.executeQuery();
            while(rs.next()){
            	
            	LeadInvoiceElement invoiceElement=new LeadInvoiceElement();
        		
            	invoiceElement.setInvoice_element_id(rs.getInt("invoice_element_id"));
            	invoiceElement.setInvoice_id(rs.getInt("invoice_id"));
        		invoiceElement.setService_date(rs.getString("service_date"));
        		invoiceElement.setItem_code(rs.getInt("item_code"));
        		invoiceElement.setService_description(rs.getString("service_description"));
        		invoiceElement.setQuantity(rs.getInt("quantity"));
        		invoiceElement.setPrice(rs.getDouble("price"));
        		/*invoiceElement.setTax(rs.getDouble("tax"));*/
        		invoiceElement.setAmount(rs.getDouble("amount"));
            	
        		
        		elementList.add(invoiceElement);
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
	public LeadInvoice getinvoiceById(int invoice_id) {
		
		con=DBConnection.getConnection();
		
		LeadInvoice invoice=new LeadInvoice();
		query="SELECT * FROM lead_invoice li WHERE li.invoice_id=?";
		
		   try {
        	
			ps=con.prepareStatement(query);
			ps.setInt(1, invoice_id);
	    	rs=ps.executeQuery();
            while(rs.next()){
            	
            	invoice.setInvoice_id(rs.getInt("invoice_id"));
            	invoice.setInvoice_date(rs.getString("invoice_date"));
            	invoice.setInvoice_title(rs.getString("invoice_title"));
            	invoice.setLeadId(rs.getInt("LeadId"));
            	invoice.setContractorId(rs.getInt("contractorId"));
            	invoice.setEstimation_id(rs.getInt("estimation_id"));
            	invoice.setSubTotal(rs.getDouble("subTotal"));
            	invoice.setPromoDiscount(rs.getString("promoDiscount"));
            	invoice.setTaxRate(rs.getString("taxRate"));
            	invoice.setTaxDueAmount(rs.getDouble("taxDueAmount"));
            	invoice.setGrossTotal(rs.getDouble("grossTotal"));
            	invoice.setPaymentAmount(rs.getDouble("paymentAmount"));
            	invoice.setDueAmount(rs.getDouble("dueAmount"));
            	invoice.setTax_due_date(rs.getString("tax_due_date"));
            	invoice.setOldDueAmount(rs.getDouble("oldDueAmount"));
            	invoice.setInvoice_status(rs.getString("invoice_status"));
            	invoice.setDue_status(rs.getInt("due_status"));
              }	 
            
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		
		
		return invoice;
	}

	@Override
	public String updateInvoiceTotal(Double total, int invoice_id) {
     
		con=DBConnection.getConnection();
		
		query="UPDATE lead_invoice SET subTotal=? WHERE invoice_id=?";
		
		
        try {
			
			ps=con.prepareStatement(query);
			ps.setDouble(1,total);
			ps.setInt(2,invoice_id);
			
			
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
	public String deleteInvoiceElement(int item_code, int invoice_id) {

		con=DBConnection.getConnection();
		
		 query="DELETE FROM lead_invoice_elements WHERE invoice_id=? AND item_code=?";
		
		
        try {
			
			ps=con.prepareStatement(query);
			ps.setInt(1,invoice_id);
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
	public String updateInvoice(LeadInvoice invoice) {
		
		con=DBConnection.getConnection();
		
		query="UPDATE lead_invoice SET subTotal=?,promoDiscount=?,taxRate=?,taxDueAmount=?,grossTotal=?,dueAmount=?,paymentAmount=?,tax_due_date=?,oldDueAmount=?,invoice_status=?,invoice_title=? WHERE invoice_id=?;";
		
		 try {
			
			ps=con.prepareStatement(query);
			ps.setDouble(1,invoice.getSubTotal());
			ps.setString(2,invoice.getPromoDiscount());
			ps.setString(3,invoice.getTaxRate());
			ps.setDouble(4,invoice.getTaxDueAmount());
			ps.setDouble(5,invoice.getGrossTotal());
			ps.setDouble(6,invoice.getDueAmount());
			ps.setDouble(7,invoice.getPaymentAmount());
			ps.setString(8,invoice.getTax_due_date());
			ps.setDouble(9,invoice.getOldDueAmount());
			ps.setString(10,invoice.getInvoice_status());
			ps.setString(11,invoice.getInvoice_title());
			ps.setInt(12,invoice.getInvoice_id());
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
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		return result;
	}
	
	
	
	
	
	
	
	
	
	

	@Override
	public List<LeadInvoice> getAllInvoiceById(int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		
           List<LeadInvoice> invoiceList=new ArrayList<>();
		
           /*query="SELECT * FROM lead_invoice li WHERE li.LeadId=? AND li.contractorId=? AND li.invoice_status <>'Trash' AND li.invoice_status <>'Paid'";*/
           
		query="SELECT * FROM lead_invoice li WHERE li.LeadId=? AND li.contractorId=? AND li.invoice_status <>'Trash' ORDER BY li.invoice_id DESC";
		
		
        try {
        	
			ps=con.prepareStatement(query);
			ps.setInt(1, leadId);
			ps.setInt(2, contractorId);
	    	rs=ps.executeQuery();
            while(rs.next()){
            	
            	LeadInvoice invoice=new LeadInvoice();
        		
            	invoice.setInvoice_id(rs.getInt("invoice_id"));
            	invoice.setInvoice_date(rs.getString("invoice_date"));
            	invoice.setInvoice_title(rs.getString("invoice_title"));
            	invoice.setLeadId(rs.getInt("LeadId"));
            	invoice.setContractorId(rs.getInt("contractorId"));
            	invoice.setEstimation_id(rs.getInt("estimation_id"));
            	invoice.setSubTotal(rs.getDouble("subTotal"));
            	invoice.setPromoDiscount(rs.getString("promoDiscount"));
            	invoice.setTaxRate(rs.getString("taxRate"));
            	invoice.setTaxDueAmount(rs.getDouble("taxDueAmount"));
            	invoice.setGrossTotal(rs.getDouble("grossTotal"));
            	invoice.setPaymentAmount(rs.getDouble("paymentAmount"));
            	invoice.setDueAmount(rs.getDouble("dueAmount"));
            	invoice.setTax_due_date(rs.getString("tax_due_date"));
            	invoice.setInvoice_status(rs.getString("invoice_status"));
            	invoice.setOldDueAmount(rs.getDouble("oldDueAmount"));
            	invoice.setDue_status(rs.getInt("due_status"));
            	invoice.setWeb_path(rs.getString("web_path"));
            	invoice.setReal_path(rs.getString("real_path"));
            	
            	invoiceList.add(invoice);
            }	
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		
		
		return invoiceList;
	}

	@Override
	public String updateInvoiceStatus(String invoice_status, int invoice_id) {
		
		con=DBConnection.getConnection();
		
   query="UPDATE lead_invoice SET invoice_status=? WHERE invoice_id=?";
		
		
        try {
			
			ps=con.prepareStatement(query);
			ps.setString(1,invoice_status);
			ps.setInt(2,invoice_id);
			
			
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
	public List<LeadInvoice> getAllInvoiceByContractor(int contractorId) {
		
		con=DBConnection.getConnection();
		
		  List<LeadInvoice> invoiceList=new ArrayList<>();
			
			query="SELECT * FROM lead_invoice li WHERE li.contractorId=? ORDER BY li.dueAmount DESC";
			
			
	        try {
	        	
				ps=con.prepareStatement(query);
				ps.setInt(1, contractorId);
		    	rs=ps.executeQuery();
	            while(rs.next()){
	            	
	            	LeadInvoice invoice=new LeadInvoice();
	        		
	            	invoice.setInvoice_id(rs.getInt("invoice_id"));
	            	invoice.setInvoice_date(rs.getString("invoice_date"));
	            	invoice.setInvoice_title(rs.getString("invoice_title"));
	            	invoice.setLeadId(rs.getInt("LeadId"));
	            	invoice.setContractorId(rs.getInt("contractorId"));
	            	invoice.setEstimation_id(rs.getInt("estimation_id"));
	            	invoice.setSubTotal(rs.getDouble("subTotal"));
	            	invoice.setPromoDiscount(rs.getString("promoDiscount"));
	            	invoice.setTaxRate(rs.getString("taxRate"));
	            	invoice.setTaxDueAmount(rs.getDouble("taxDueAmount"));
	            	invoice.setGrossTotal(rs.getDouble("grossTotal"));
	            	invoice.setPaymentAmount(rs.getDouble("paymentAmount"));
	            	invoice.setDueAmount(rs.getDouble("dueAmount"));
	            	invoice.setTax_due_date(rs.getString("tax_due_date"));
	            	invoice.setInvoice_status(rs.getString("invoice_status"));
	            	invoice.setOldDueAmount(rs.getDouble("oldDueAmount"));
	            	invoice.setDue_status(rs.getInt("due_status"));
	            	invoiceList.add(invoice);
	            }	
			
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
				
			
			
			return invoiceList;
	}

	@Override
	public LeadInvoice getInvoiceById(int invoice_id) {
		
		con=DBConnection.getConnection();
		
		LeadInvoice invoice=new LeadInvoice();
			query="SELECT * FROM lead_invoice li WHERE li.invoice_id=?";
			
			
	        try {
	        	
				ps=con.prepareStatement(query);
				ps.setInt(1, invoice_id);
		    	rs=ps.executeQuery();
	            while(rs.next()){
	            	
	            	invoice.setInvoice_id(rs.getInt("invoice_id"));
	            	invoice.setInvoice_date(rs.getString("invoice_date"));
	            	invoice.setInvoice_title(rs.getString("invoice_title"));
	            	invoice.setLeadId(rs.getInt("LeadId"));
	            	invoice.setContractorId(rs.getInt("contractorId"));
	            	invoice.setEstimation_id(rs.getInt("estimation_id"));
	            	invoice.setSubTotal(rs.getDouble("subTotal"));
	            	invoice.setPromoDiscount(rs.getString("promoDiscount"));
	            	invoice.setTaxRate(rs.getString("taxRate"));
	            	invoice.setTaxDueAmount(rs.getDouble("taxDueAmount"));
	            	invoice.setGrossTotal(rs.getDouble("grossTotal"));
	            	invoice.setPaymentAmount(rs.getDouble("paymentAmount"));
	            	invoice.setDueAmount(rs.getDouble("dueAmount"));
	            	invoice.setTax_due_date(rs.getString("tax_due_date"));
	            	invoice.setInvoice_status(rs.getString("invoice_status"));
	            	invoice.setOldDueAmount(rs.getDouble("oldDueAmount"));
	            	invoice.setDue_status(rs.getInt("due_status"));
	            }	
			
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
				
			
			
			return invoice;
	}

	@Override
	public double getOldDueAmount(int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		
		double dueAmt=0.0;
		   query="SELECT li.dueAmount  FROM lead_invoice li  WHERE li.invoice_id=(SELECT MAX(li.invoice_id )FROM lead_invoice li WHERE li.invoice_status='Paid')  AND li.LeadId=? AND li.contractorId=?";
		   		
			
			
	        try {
				
				ps=con.prepareStatement(query);
				ps.setInt(1,leadId);
				ps.setInt(2,contractorId);
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
				    dueAmt=rs.getDouble(1);
				   }
	        }catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
				
			
		return dueAmt;
	}

	@Override
	public String trashOldInvoices() {

		con=DBConnection.getConnection();
		
     query="UPDATE lead_invoice SET invoice_status='Trash' WHERE invoice_status<>'Paid'";
		
		
        try {
			
			ps=con.prepareStatement(query);
			
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
	public List<LeadInvoice> getAllPaidInvoiceById(int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		
		  List<LeadInvoice> invoiceList=new ArrayList<>();
			
			query="SELECT * FROM lead_invoice li WHERE li.LeadId=? AND li.contractorId=? AND li.invoice_status='Paid'";
			
			
	        try {
	        	
				ps=con.prepareStatement(query);
				ps.setInt(1, leadId);
				ps.setInt(2, contractorId);
		    	rs=ps.executeQuery();
	            while(rs.next()){
	            	
	            	LeadInvoice invoice=new LeadInvoice();
	        		
	            	invoice.setInvoice_id(rs.getInt("invoice_id"));
	            	invoice.setInvoice_date(rs.getString("invoice_date"));
	            	invoice.setInvoice_title(rs.getString("invoice_title"));
	            	invoice.setLeadId(rs.getInt("LeadId"));
	            	invoice.setContractorId(rs.getInt("contractorId"));
	            	invoice.setEstimation_id(rs.getInt("estimation_id"));
	            	invoice.setSubTotal(rs.getDouble("subTotal"));
	            	invoice.setPromoDiscount(rs.getString("promoDiscount"));
	            	invoice.setTaxRate(rs.getString("taxRate"));
	            	invoice.setTaxDueAmount(rs.getDouble("taxDueAmount"));
	            	invoice.setGrossTotal(rs.getDouble("grossTotal"));
	            	invoice.setPaymentAmount(rs.getDouble("paymentAmount"));
	            	invoice.setDueAmount(rs.getDouble("dueAmount"));
	            	invoice.setTax_due_date(rs.getString("tax_due_date"));
	            	invoice.setInvoice_status(rs.getString("invoice_status"));
	            	invoice.setOldDueAmount(rs.getDouble("oldDueAmount"));
	            	invoice.setDue_status(rs.getInt("due_status"));
	            	
	            	invoiceList.add(invoice);
	            }	
			
				} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
				
			
			
			return invoiceList;
	}

	@Override
	public Boolean checkInvoiceAvaibility(int leadId, int contractorId) {
		
		con=DBConnection.getConnection();
		
		Boolean status=false;
		
		   query=" SELECT  li.LeadId  FROM contractor_invoiced_leads li WHERE li.LeadId=? AND li.contractorId=?";
		   		
		  	
	        try {
				
				ps=con.prepareStatement(query);
				ps.setInt(1,leadId);
				ps.setInt(2,contractorId);
				
				rs=ps.executeQuery();
				
				while(rs.next()){
					
				   /* if(rs.getInt(1)!=0){
				    	
				    	System.out.println("status="+rs.getInt(1));*/
				    	status=true;
				    		System.out.println("status"+status);	
//				    }else{
//				    	break;
//				    }
				    
				    
				   }
	        }catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				DbUtils.closeQuietly(con, ps, rs);
			}
				
			
		
		
		return status;
	}

	@Override
	public String updateInvoiceDueStatus(int invoice_due_status, int invoice_id) {
		
		con=DBConnection.getConnection();
		
		 query="UPDATE lead_invoice SET due_status=? WHERE invoice_id=?";
			
			
	        try {
				
				ps=con.prepareStatement(query);
				ps.setInt(1,invoice_due_status);
				ps.setInt(2,invoice_id);
				
				
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
	public List<LeadInvoice> getAllContractorInvoice(int contractorId) {
		con=DBConnection.getConnection();
		
        List<LeadInvoice> invoiceList=new ArrayList<>();
		
        /*query="SELECT * FROM lead_invoice li WHERE li.LeadId=? AND li.contractorId=? AND li.invoice_status <>'Trash' AND li.invoice_status <>'Paid'";*/
        
		query="SELECT * FROM lead_invoice li WHERE  li.contractorId=? AND li.invoice_status <>'Trash' ORDER BY li.invoice_id";
		
		
     try {
     	
			ps=con.prepareStatement(query);
			ps.setInt(1, contractorId);
	    	rs=ps.executeQuery();
         while(rs.next()){
         	
         	LeadInvoice invoice=new LeadInvoice();
     		
         	invoice.setInvoice_id(rs.getInt("invoice_id"));
         	invoice.setInvoice_date(rs.getString("invoice_date"));
         	invoice.setInvoice_title(rs.getString("invoice_title"));
         	invoice.setLeadId(rs.getInt("LeadId"));
         	invoice.setContractorId(rs.getInt("contractorId"));
         	invoice.setEstimation_id(rs.getInt("estimation_id"));
         	invoice.setSubTotal(rs.getDouble("subTotal"));
         	invoice.setPromoDiscount(rs.getString("promoDiscount"));
         	invoice.setTaxRate(rs.getString("taxRate"));
         	invoice.setTaxDueAmount(rs.getDouble("taxDueAmount"));
         	invoice.setGrossTotal(rs.getDouble("grossTotal"));
         	invoice.setPaymentAmount(rs.getDouble("paymentAmount"));
         	invoice.setDueAmount(rs.getDouble("dueAmount"));
         	invoice.setTax_due_date(rs.getString("tax_due_date"));
         	invoice.setInvoice_status(rs.getString("invoice_status"));
         	invoice.setOldDueAmount(rs.getDouble("oldDueAmount"));
         	invoice.setDue_status(rs.getInt("due_status"));
         	invoiceList.add(invoice);
         }	
		
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DbUtils.closeQuietly(con, ps, rs);
		}
			
		
		
		return invoiceList;
	}

	@Override
	public int saveInvoicePaths(String webPath, String realPath, int invoice_id) {
         
		con=DBConnection.getConnection();
		
		query="UPDATE lead_invoice SET web_path=?,real_path=? WHERE invoice_id=? ";
		
			
        try {
			
			ps=con.prepareStatement(query);
			
			ps.setString(1,webPath);
			ps.setString(2,realPath);
			ps.setInt(3, invoice_id);
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
	public String getInvocieRealPath(int invoice_id) {
      con=DBConnection.getConnection();
 		
	 	String real_path=null;
	 	
		query="SELECT real_path FROM lead_invoice  WHERE invoice_id=?";
		
		   try {
        	
			ps=con.prepareStatement(query);
			
			ps.setInt(1, invoice_id);
			
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
