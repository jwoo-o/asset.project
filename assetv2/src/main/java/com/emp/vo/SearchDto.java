package com.emp.vo;

public class SearchDto {

	private int page;
	private int limit;
	private String sortBy;
	private String direction;
	private String search;
	private String keyword;
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getSortBy() {
		return sortBy;
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchDto [page=" + page + ", limit=" + limit + ", sortBy=" + sortBy + ", direction=" + direction
				+ ", search=" + search + ", keyword=" + keyword + "]";
	}
	
	
}
