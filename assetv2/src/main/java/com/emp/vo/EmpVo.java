package com.emp.vo;

public class EmpVo {

	private String empNo;
	private String name;
	private String division;
	private String position;
	private String gender;
	private String joinDate;
	private String pcode;
	private String dcode;
	private String status;
	
	
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getDcode() {
		return dcode;
	}
	public void setDcode(String dcode) {
		this.dcode = dcode;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "EmpVo [empNo=" + empNo + ", name=" + name + ", division=" + division + ", position=" + position
				+ ", gender=" + gender + ", joinDate=" + joinDate + ", pcode=" + pcode + ", dcode=" + dcode
				+ ", status=" + status + "]";
	}
	
	
	
	
}
