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
	private String email;
	private String manager;
	private String auth;
	private String office;
	private String seat;
	private String profile_name;
	
	
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
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
		
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getProfile_name() {
		return profile_name;
	}
	public void setProfile_name(String profile_name) {
		this.profile_name = profile_name;
	}
	@Override
	public String toString() {
		return "EmpVo [empNo=" + empNo + ", name=" + name + ", division=" + division + ", position=" + position
				+ ", gender=" + gender + ", joinDate=" + joinDate + ", pcode=" + pcode + ", dcode=" + dcode
				+ ", status=" + status + ", email=" + email + ", manager=" + manager + ", auth=" + auth + ", office="
				+ office + ", seat=" + seat + ", profile_name=" + profile_name + "]";
	}
	
	
	
	
}
