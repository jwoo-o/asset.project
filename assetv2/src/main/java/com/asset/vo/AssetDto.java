package com.asset.vo;

public class AssetDto {

	private int aNo;
	private String lstMdfWkrNm;
	public int getaNo() {
		return aNo;
	}
	public void setaNo(int aNo) {
		this.aNo = aNo;
	}
	public String getLstMdfWkrNm() {
		return lstMdfWkrNm;
	}
	public void setLstMdfWkrNm(String lstMdfWkrNm) {
		this.lstMdfWkrNm = lstMdfWkrNm;
	}
	@Override
	public String toString() {
		return "AssetDto [aNo=" + aNo + ", lstMdfWkrNm=" + lstMdfWkrNm + "]";
	}
	

	
	
	
}
