package com.core.vo;

public class CmcdDtlmVo {

	/** 그룹코드 */
	private String grpC;
	
	/** 상세코드 */
	private String dtlC;
	
	/** 상세코드명 */
	private String dtlCNm;
	
	/** 비활성여부 */
	private String dactFl;
	
	/** 정렬순번 */
	private int ordSn;
	
	/**최초등록작업자이름*/
	private String fstRgtWkrNm;
	/**최초등록일시*/
	private String fstRgtDtm;
	/**최종변경작업자이름*/
	private String lstMdfWkrNm;
	/**최종변경일시*/
	private String lstMdfDtm;
	
	
	public String getGrpC() {
		return grpC;
	}
	public void setGrpC(String grpC) {
		this.grpC = grpC;
	}
	public String getDtlC() {
		return dtlC;
	}
	public void setDtlC(String dtlC) {
		this.dtlC = dtlC;
	}
	public String getDtlCNm() {
		return dtlCNm;
	}
	public void setDtlCNm(String dtlCNm) {
		this.dtlCNm = dtlCNm;
	}
	public String getDactFl() {
		return dactFl;
	}
	public void setDactFl(String dactFl) {
		this.dactFl = dactFl;
	}
	public int getOrdSn() {
		return ordSn;
	}
	public void setOrdSn(int ordSn) {
		this.ordSn = ordSn;
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
		return "CmcdDtlmVo [grpC=" + grpC + ", dtlC=" + dtlC + ", dtlCNm=" + dtlCNm + ", dactFl=" + dactFl + ", ordSn="
				+ ordSn + ", fstRgtWkrNm=" + fstRgtWkrNm + ", fstRgtDtm=" + fstRgtDtm + ", lstMdfWkrNm=" + lstMdfWkrNm
				+ ", lstMdfDtm=" + lstMdfDtm + "]";
	}
	
	
	
}
