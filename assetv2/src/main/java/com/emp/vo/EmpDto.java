package com.emp.vo;

public class EmpDto {

	private String empNo;
	private String userName;
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "EmpDto [empNo=" + empNo + ", userName=" + userName + "]";
	}
	
	
}
