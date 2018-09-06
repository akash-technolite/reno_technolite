package com.tlite.pojo;

public class Employee {
	
	
   @Override
	public String toString() {
		return "Employee [employee_id=" + employee_id + ", employee_name=" + employee_name + ", employee_email="
				+ employee_email + ", employee_password=" + employee_password + ", contractor_id=" + contractor_id
				+ ", employee_mobile=" + employee_mobile + ", employee_type=" + employee_type + "]";
	}

private int employee_id=0;
	
	private String employee_name=null;
	
	private String employee_email=null;
	
	private String employee_password=null;
	
	private int contractor_id=0;
	
	private long employee_mobile=0;
	
	private String employee_type=null;

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getEmployee_email() {
		return employee_email;
	}

	public void setEmployee_email(String employee_email) {
		this.employee_email = employee_email;
	}

	public String getEmployee_password() {
		return employee_password;
	}

	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}

	public int getContractor_id() {
		return contractor_id;
	}

	public void setContractor_id(int contractor_id) {
		this.contractor_id = contractor_id;
	}

	public long getEmployee_mobile() {
		return employee_mobile;
	}

	public void setEmployee_mobile(long employee_mobile) {
		this.employee_mobile = employee_mobile;
	}

	public String getEmployee_type() {
		return employee_type;
	}

	public void setEmployee_type(String employee_type) {
		this.employee_type = employee_type;
	}
	
	
	
	
	

}
