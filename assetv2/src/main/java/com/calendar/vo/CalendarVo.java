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
	/**최초등록작업자이름*/
	private String fstRgtWkrNm;
	/**최초등록일시*/
	private String fstRgtDtm;
	/**최종변경작업자이름*/
	private String lstMdfWkrNm;
	/**최종변경일시*/
	private String lstMdfDtm;
	
	
	
	
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
	
	public String getFstRgtWkrNm() {
		return fstRgtWkrNm;
	}
	public void setFstRgtWkrNm(String fstRgtWkrNm) {
		this.fstRgtWkrNm = fstRgtWkrNm;
	}
	public String getFstRgtDtm() {
		return fstRgtDtm;
	}
	public void setFstRgtDtm(String fstRgtDtm) {
		this.fstRgtDtm = fstRgtDtm;
	}
	public String getLstMdfWkrNm() {
		return lstMdfWkrNm;
	}
	public void setLstMdfWkrNm(String lstMdfWkrNm) {
		this.lstMdfWkrNm = lstMdfWkrNm;
	}
	public String getLstMdfDtm() {
		return lstMdfDtm;
	}
	public void setLstMdfDtm(String lstMdfDtm) {
		this.lstMdfDtm = lstMdfDtm;
	}
	@Override
	public String toString() {
		return "CalendarVo [title=" + title + ", start=" + start + ", end=" + end + ", no=" + no + ", name=" + name
				+ ", division=" + division + ", addNrein=" + addNrein + ", seat=" + seat + ", id=" + id + ", divNm="
				+ divNm + ", mgr=" + mgr + "]";
	}
	
	
	
	
	
	
	
}
