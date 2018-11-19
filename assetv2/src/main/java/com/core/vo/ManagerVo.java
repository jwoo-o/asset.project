package com.core.vo;

public class ManagerVo {

	private String mNo;
	private String mName;
	private String mId;
	private String empNo;
	private String dept;
	private String position;
	private String pwd;
	private String auth;
	private String dCode;
	
	public String getmNo() {
		return mNo;
	}
	public void setmNo(String mNo) {
		this.mNo = mNo;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	
	
	
	public String getdCode() {
		return dCode;
	}
	public void setdCode(String dCode) {
		this.dCode = dCode;
	}
	@Override
	public String toString() {
		return "ManagerVo [mNo=" + mNo + ", mName=" + mName + ", mId=" + mId + ", empNo=" + empNo + ", dept=" + dept
				+ ", position=" + position + ", pwd=" + pwd + ", auth=" + auth + ", dCode=" + dCode + "]";
	}
	
	
	
	
	
	
}
