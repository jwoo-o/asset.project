package com.core.vo;

public class CommonDto {

	
	private int next;
	private String keyword;
	private String search;
	
	
	
	
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "CommonDto [next=" + next + ", keyword=" + keyword + ", search=" + search + "]";
	}
	
	
	
	
	
	
}
