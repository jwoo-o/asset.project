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
	@Override
	public String toString() {
		return "CalendarVo [name=" + name + ", division=" + division + ", addNrein=" + addNrein + ", seat=" + seat
				+ ", title=" + title + ", start=" + start + ", end=" + end + "]";
	}
	
	
	
}
