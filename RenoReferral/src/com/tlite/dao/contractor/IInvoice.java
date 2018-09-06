package com.tlite.dao.contractor;

import java.util.List;

import com.tlite.pojo.LeadInvoice;
import com.tlite.pojo.LeadInvoiceElement;

public interface IInvoice {

	
	
	public int getNextInvoiceId();
	
	public int getNextItemCode(int invoice_id);
	
	public String addInvoice(LeadInvoice invoice);
	
	public String updateInvoice(LeadInvoice invoice);
	
	
	public String addInvoiceElement(LeadInvoiceElement invoiceElement);

	public List<LeadInvoiceElement> getInvoiceElementById(int invoice_id);

	public LeadInvoice getinvoiceById(int invoice_id);

	public String updateInvoiceTotal(Double total,int invoice_id);

	public String deleteInvoiceElement(int item_code,int invoice_id);

	public LeadInvoice getInvoiceById(int invoice_id);
	
	public List<LeadInvoice> getAllInvoiceById(int leadId,int contractorId);

	
	public List<LeadInvoice> getAllInvoiceByContractor(int contractorId);
	
	public List<LeadInvoice> getAllPaidInvoiceById(int leadId,int contractorId);
	
	public String updateInvoiceStatus(String invoice_status,int invoice_id);
	
	public double getOldDueAmount(int leadId,int contractorId);
	
	public String trashOldInvoices();
	
	public Boolean checkInvoiceAvaibility(int leadId,int contractorId);
	
	public String updateInvoiceDueStatus(int invoice_due_status,int invoice_id);

	public List<LeadInvoice> getAllContractorInvoice(int contractorId);

	public int saveInvoicePaths(String webPath, String realPath, int invoice_id);

	public String getInvocieRealPath(int invoice_id);
}
