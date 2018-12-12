package com.calendar.vo;


public class CalendarVo {

	private String title;
	private String start;
	private String end;
	private int no;
	private String name;
	private String division;
	private String addNrein;
	private String seat;
	private String id;
	private String divNm;
	private String mgr;
	
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getAddNrein() {
		return addNrein;
	}
	public void setAddNrein(String addNrein) {
		this.addNrein = addNrein;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDivNm() {
		return divNm;
	}
	public void setDivNm(String divNm) {
		this.divNm = divNm;
	}
	
	public String getMgr() {
		return mgr;
	}
	public void setMgr(String mgr) {
		this.mgr = mgr;
	}
	@Override
	public String toString() {
		return "CalendarVo [title=" + title + ", start=" + start + ", end=" + end + ", no=" + no + ", name=" + name
				+ ", division=" + division + ", addNrein=" + addNrein + ", seat=" + seat + ", id=" + id + ", divNm="
				+ divNm + ", mgr=" + mgr + "]";
	}
	
	
	
	
	
	
	
}
