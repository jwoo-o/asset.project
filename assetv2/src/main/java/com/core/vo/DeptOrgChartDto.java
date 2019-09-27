package com.core.vo;

import java.util.List;

public class DeptOrgChartDto {

	private String dept_nm;
	private String dept_mgr_emp_no;
	private String dept_no;
	
	private List<DeptOrgChartDto> children;
	
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getDept_mgr_emp_no() {
		return dept_mgr_emp_no;
	}
	public void setDept_mgr_emp_no(String dept_mgr_emp_no) {
		this.dept_mgr_emp_no = dept_mgr_emp_no;
	}
	public String getDept_no() {
		return dept_no;
	}
	public void setDept_no(String dept_no) {
		this.dept_no = dept_no;
	}
	public List<DeptOrgChartDto> getChildren() {
		return children;
	}
	public void setChildren(List<DeptOrgChartDto> children) {
		this.children = children;
	}
	
	
	
}
