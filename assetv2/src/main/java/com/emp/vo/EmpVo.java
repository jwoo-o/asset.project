package com.emp.vo;

public class EmpVo {

	private String empNo;
	private String userName;
	private String division;
	private String position;
	private String gender;
	private String joinDate;
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
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	@Override
	public String toString() {
		return "EmpVo [empNo=" + empNo + ", userName=" + userName + ", division=" + division + ", position=" + position
				+ ", gender=" + gender + ", joinDate=" + joinDate + "]";
	}
	
	
}
