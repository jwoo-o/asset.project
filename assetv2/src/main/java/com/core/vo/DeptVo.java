package com.core.vo;


public class DeptVo {

	private int dept_no;
	private String dept_nm;
	private String country;
	private int dept_mgr_no;
	private String emp_no;
	private String use_yn;
	private String org_no;
	private String fstRgtWkrNm;
	private String fstRgtDtm;
	private String lstMdfWkrNm;
	private String lstMdfDtm;
	
	
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getDept_mgr_no() {
		return dept_mgr_no;
	}
	public void setDept_mgr_no(int dept_mgr_no) {
		this.dept_mgr_no = dept_mgr_no;
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
	public String getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getFstRgtWkrNm() {
		return fstRgtWkrNm;
	}
	public void setFstRgtWkrNm(String fstRgtWkrNm) {
		this.fstRgtWkrNm = fstRgtWkrNm;
	}
	public String getFstRgtDtm() {
		return fstRgtDtm;
	}
	public void setFstRgtDtm(String fstRgtDtm) {
		this.fstRgtDtm = fstRgtDtm;
	}
	public String getLstMdfWkrNm() {
		return lstMdfWkrNm;
	}
	public void setLstMdfWkrNm(String lstMdfWkrNm) {
		this.lstMdfWkrNm = lstMdfWkrNm;
	}
	public String getLstMdfDtm() {
		return lstMdfDtm;
	}
	public void setLstMdfDtm(String lstMdfDtm) {
		this.lstMdfDtm = lstMdfDtm;
	}
	public String getOrg_no() {
		return org_no;
	}
	public void setOrg_no(String org_no) {
		this.org_no = org_no;
	}
	@Override
	public String toString() {
		return "DeptVo [dept_no=" + dept_no + ", dept_nm=" + dept_nm + ", country=" + country + ", dept_mgr_no="
				+ dept_mgr_no + ", emp_no=" + emp_no + ", use_yn=" + use_yn + ", org_no=" + org_no + ", fstRgtWkrNm="
				+ fstRgtWkrNm + ", fstRgtDtm=" + fstRgtDtm + ", lstMdfWkrNm=" + lstMdfWkrNm + ", lstMdfDtm=" + lstMdfDtm
				+ "]";
	}
	
	
	
	
	
	
}
