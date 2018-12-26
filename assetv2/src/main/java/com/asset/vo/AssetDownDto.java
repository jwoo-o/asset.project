package com.asset.vo;

public class AssetDownDto {

	private int aNo;
	private String assetNo;
	private String category;
	private String status;
	private String modelNm;
	private String userName;
	private String position;
	private String division;
	private String buying;
	private String mInch;
	private String note;
	private String serialNo;
	private String price;
	
	public int getaNo() {
		return aNo;
	}
	public void setaNo(int aNo) {
		this.aNo = aNo;
	}
	public String getAssetNo() {
		return assetNo;
	}
	public void setAssetNo(String assetNo) {
		this.assetNo = assetNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getModelNm() {
		return modelNm;
	}
	public void setModelNm(String modelNm) {
		this.modelNm = modelNm;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getBuying() {
		return buying;
	}
	public void setBuying(String buying) {
		this.buying = buying;
	}
	public String getmInch() {
		return mInch;
	}
	public void setmInch(String mInch) {
		this.mInch = mInch;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "AssetDownDto [aNo=" + aNo + ", assetNo=" + assetNo + ", category=" + category + ", status=" + status
				+ ", modelNm=" + modelNm + ", userName=" + userName + ", position=" + position + ", division="
				+ division + ", buying=" + buying + ", mInch=" + mInch + ", note=" + note + ", serialNo=" + serialNo
				+ ", price=" + price + "]";
	}
	
	
	
	
	
	
	
}
