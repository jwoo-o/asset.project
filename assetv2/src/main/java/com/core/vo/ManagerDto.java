package com.core.vo;

public class ManagerDto {

	private String mNo;
	private String mName;
	private String mId;
	private String division;
	private String auth;
	private String dCode;
	private String office_number;
	
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
	
	public String getOffice_number() {
		return office_number;
	}
	public void setOffice_number(String office_number) {
		this.office_number = office_number;
	}
	@Override
	public String toString() {
		return "ManagerDto [mNo=" + mNo + ", mName=" + mName + ", mId=" + mId + ", division=" + division + ", auth="
				+ auth + ", dCode=" + dCode + ", office_number=" + office_number + ", getmNo()=" + getmNo()
				+ ", getmName()=" + getmName() + ", getmId()=" + getmId() + ", getDivision()=" + getDivision()
				+ ", getAuth()=" + getAuth() + ", getdCode()=" + getdCode() + ", getOffice_number()="
				+ getOffice_number() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
	
	
}
