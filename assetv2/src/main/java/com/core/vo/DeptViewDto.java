package com.core.vo;

public class DeptViewDto {

	private int dept_no;
	private String dept_nm;
	private String org_nm;
	private String country;
	private int dept_mgr_no;
	private String dept_mgr_nm;
	private String mgr_org_nm;
	private String emp_nm;
	private String color;
	private String lstMdfDtm;	
	private String emp_no;
	private String org_no;
	private int level;
	
	
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
	
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
	}
	public String getMgr_org_nm() {
		return mgr_org_nm;
	}
	public void setMgr_org_nm(String mgr_org_nm) {
		this.mgr_org_nm = mgr_org_nm;
	}
	
	public String getOrg_no() {
		return org_no;
	}
	public void setOrg_no(String org_no) {
		this.org_no = org_no;
	}
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "DeptViewDto [dept_no=" + dept_no + ", dept_nm=" + dept_nm + ", org_nm=" + org_nm + ", country="
				+ country + ", dept_mgr_no=" + dept_mgr_no + ", dept_mgr_nm=" + dept_mgr_nm + ", mgr_org_nm="
				+ mgr_org_nm + ", emp_nm=" + emp_nm + ", color=" + color + ", lstMdfDtm=" + lstMdfDtm + ", emp_no="
				+ emp_no + ", org_no=" + org_no + ", level=" + level + "]";
	}
	
	
	
	
	
	
	
	
}
