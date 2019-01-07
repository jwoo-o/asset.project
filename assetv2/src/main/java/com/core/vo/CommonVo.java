package com.core.vo;

public class CommonVo {

	private String cCode;
	private String cName;
	public String getcCode() {
		return cCode;
	}
	public void setcCode(String cCode) {
		this.cCode = cCode;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	@Override
	public String toString() {
		return "CommonVo [cCode=" + cCode + ", cName=" + cName + "]";
	}
	
	
}
