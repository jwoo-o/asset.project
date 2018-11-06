package com.core.vo;

public class MgrPwdDto {

	private String pwd;
	private String newPwd;
	private String mId;
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	@Override
	public String toString() {
		return "MgrPwdDto [pwd=" + pwd + ", newPwd=" + newPwd + ", mId=" + mId + "]";
	}
	
	
	
	
}
