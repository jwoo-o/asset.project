package com.calendar.vo;

public class CalendarJoinDto {

	/**번호*/
	private int no;
	/**입사자명*/
	private String name;
	/**부서넘버*/
	private String division;
	/**사원번호*/
	private String empNo;
	/**직위넘버*/
	private String position;
	/**성별*/
	private String gender;
	/**입사일*/
	private String joinDate;
	/**이메일*/
	private String email;
	/**등록자*/
	private String id;
	/**직위명*/
	private String posNm;
	/**부서명*/
	private String divNm;
	/**좌석*/
	private String seat;	
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
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getPosNm() {
		return posNm;
	}
	public void setPosNm(String posNm) {
		this.posNm = posNm;
	}
	public String getDivNm() {
		return divNm;
	}
	public void setDivNm(String divNm) {
		this.divNm = divNm;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	@Override
	public String toString() {
		return "CalendarJoinDto [no=" + no + ", name=" + name + ", division=" + division + ", empNo=" + empNo
				+ ", position=" + position + ", gender=" + gender + ", joinDate=" + joinDate + ", email=" + email
				+ ", id=" + id + ", posNm=" + posNm + ", divNm=" + divNm + ", seat=" + seat + ", fstRgtWkrNm="
				+ fstRgtWkrNm + ", fstRgtDtm=" + fstRgtDtm + ", lstMdfWkrNm=" + lstMdfWkrNm + ", lstMdfDtm=" + lstMdfDtm
				+ "]";
	}
	
	
	
	
	
}
