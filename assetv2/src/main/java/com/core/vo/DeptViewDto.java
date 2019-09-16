package com.core.vo;

public class DeptViewDto {

	private int dept_no;
	private String dept_nm;
	private String country;
	private int dept_mgr_no;
	private String dept_mgr_nm;
	private String emp_nm;
	private String lstMdfDtm;	
	private String emp_no;
	
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getDept_mgr_no() {
		return dept_mgr_no;
	}
	public void setDept_mgr_no(int dept_mgr_no) {
		this.dept_mgr_no = dept_mgr_no;
	}
	public String getEmp_nm() {
		return emp_nm;
	}
	public void setEmp_nm(String emp_nm) {
		this.emp_nm = emp_nm;
	}
	public String getLstMdfDtm() {
		return lstMdfDtm;
	}
	public void setLstMdfDtm(String lstMdfDtm) {
		this.lstMdfDtm = lstMdfDtm;
	}
	public String getDept_mgr_nm() {
		return dept_mgr_nm;
	}
	public void setDept_mgr_nm(String dept_mgr_nm) {
		this.dept_mgr_nm = dept_mgr_nm;
	}
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	@Override
	public String toString() {
		return "DeptViewDto [dept_no=" + dept_no + ", dept_nm=" + dept_nm + ", country=" + country + ", dept_mgr_no="
				+ dept_mgr_no + ", dept_mgr_nm=" + dept_mgr_nm + ", emp_nm=" + emp_nm + ", lstMdfDtm=" + lstMdfDtm
				+ ", emp_no=" + emp_no + "]";
	}
	
	
	
	
}
