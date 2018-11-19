package com.core.vo;

public class ManagerDto {

	private String mNo;
	private String mName;
	private String mId;
	private String division;
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
	
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
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
		return "ManagerDto [mNo=" + mNo + ", mName=" + mName + ", mId=" + mId + ", division=" + division + ", auth="
				+ auth + ", dCode=" + dCode + "]";
	}
	
	
	
	
	
}
