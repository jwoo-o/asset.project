package com.asset.vo;

public class AssetSearchDto {

	private String userName;
	private String assetNo;
	private String category;
	private String position;
	private String division;
	private String status;
	private String re_time;
	private String note;
	private String key;
	private String sort;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRe_time() {
		return re_time;
	}
	public void setRe_time(String re_time) {
		this.re_time = re_time;
	}
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	@Override
	public String toString() {
		return "AssetSearchDto [userName=" + userName + ", assetNo=" + assetNo + ", category=" + category
				+ ", position=" + position + ", division=" + division + ", status=" + status + ", re_time=" + re_time
				+ ", note=" + note + ", key=" + key + ", sort=" + sort + "]";
	}
	
	
	
	
}
