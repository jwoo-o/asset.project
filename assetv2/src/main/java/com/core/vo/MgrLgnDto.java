package com.core.vo;

public class MgrLgnDto {

	private String mId;
	private String pwd;
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "MgrLgnDto [mId=" + mId + ", pwd=" + pwd + "]";
	}
	
	
}
