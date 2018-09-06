package com.tlite.pojo;

public class LeadInvoice {
	
	private int invoice_id=0;
	private int estimation_id=0;
	private String invoice_date=null;
	private String tax_due_date=null;
	private String invoice_status=null;
	private String invoice_title=null;
	private int LeadId=0;
	private int contractorId=0;
	private Double subTotal=0.0;
	private String promoDiscount=null;
	private String taxRate=null;
	private Double taxDueAmount=0.0;
	private Double grossTotal=0.0;
	private Double dueAmount=0.0;
	private Double paymentAmount=0.0;
	private Double oldDueAmount=0.0;
	private int  due_status=0;
	private String web_path=null;
	private String real_path=null;
	
	public int getInvoice_id() {
		return invoice_id;
	}
	
	public void setInvoice_id(int invoice_id) {
		this.invoice_id = invoice_id;
	}
	public int getEstimation_id() {
		return estimation_id;
	}
	public void setEstimation_id(int estimation_id) {
		this.estimation_id = estimation_id;
	}
	public String getInvoice_date() {
		return invoice_date;
	}
	public void setInvoice_date(String invoice_date) {
		this.invoice_date = invoice_date;
	}
	
	public String getTax_due_date() {
		return tax_due_date;
	}

	public void setTax_due_date(String tax_due_date) {
		this.tax_due_date = tax_due_date;
	}

	public String getInvoice_status() {
		return invoice_status;
	}
	public void setInvoice_status(String invoice_status) {
		this.invoice_status = invoice_status;
	}
	public String getInvoice_title() {
		return invoice_title;
	}
	public void setInvoice_title(String invoice_title) {
		this.invoice_title = invoice_title;
	}
	public int getLeadId() {
		return LeadId;
	}
	public void setLeadId(int leadId) {
		LeadId = leadId;
	}
	public int getContractorId() {
		return contractorId;
	}
	public void setContractorId(int contractorId) {
		this.contractorId = contractorId;
	}
	public Double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}

	public String getPromoDiscount() {
		return promoDiscount;
	}

	public void setPromoDiscount(String promoDiscount) {
		this.promoDiscount = promoDiscount;
	}

	public String getTaxRate() {
		return taxRate;
	}
	public void setTaxRate(String taxRate) {
		this.taxRate = taxRate;
	}
	public Double getTaxDueAmount() {
		return taxDueAmount;
	}
	public void setTaxDueAmount(Double taxDueAmount) {
		this.taxDueAmount = taxDueAmount;
	}
	public Double getGrossTotal() {
		return grossTotal;
	}
	public void setGrossTotal(Double grossTotal) {
		this.grossTotal = grossTotal;
	}
	public Double getDueAmount() {
		return dueAmount;
	}
	public void setDueAmount(Double dueAmount) {
		this.dueAmount = dueAmount;
	}
	public Double getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(Double paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public Double getOldDueAmount() {
		return oldDueAmount;
	}

	public void setOldDueAmount(Double oldDueAmount) {
		this.oldDueAmount = oldDueAmount;
	}

	public int getDue_status() {
		return due_status;
	}

	public void setDue_status(int due_status) {
		this.due_status = due_status;
	}

	public String getWeb_path() {
		return web_path;
	}

	public void setWeb_path(String web_path) {
		this.web_path = web_path;
	}

	public String getReal_path() {
		return real_path;
	}

	public void setReal_path(String real_path) {
		this.real_path = real_path;
	}

	
	
	
	
	
}
