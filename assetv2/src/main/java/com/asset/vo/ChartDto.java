package com.asset.vo;

public class ChartDto {

	private String category;
	private int count;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ChartDto [category=" + category + ", count=" + count + "]";
	}
	
	
	
}
