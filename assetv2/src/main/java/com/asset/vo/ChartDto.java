package com.asset.vo;

public class ChartDto {

	private String categorys;
	private int count;
	
	public String getCategorys() {
		return categorys;
	}
	public void setCategorys(String categorys) {
		this.categorys = categorys;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ChartDto [categorys=" + categorys + ", count=" + count + "]";
	}
	
	
	
	
}
