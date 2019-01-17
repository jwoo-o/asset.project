package com.core.vo;

public class CmcdGrpmVo {

	/** 그룹코드 */
	private String grpC;
	/** 그룹코드명 */
	private String grpCNm;
	/** 업무코드 */
	private String wkC;
	/** 그룹코드설명 */
	private String grpCExpl;
	/** 유효상태코드 */
	private String vldStC;
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
	public String getGrpCNm() {
		return grpCNm;
	}
	public void setGrpCNm(String grpCNm) {
		this.grpCNm = grpCNm;
	}
	public String getWkC() {
		return wkC;
	}
	public void setWkC(String wkC) {
		this.wkC = wkC;
	}
	public String getGrpCExpl() {
		return grpCExpl;
	}
	public void setGrpCExpl(String grpCExpl) {
		this.grpCExpl = grpCExpl;
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
	public String getVldStC() {
		return vldStC;
	}
	public void setVldStC(String vldStC) {
		this.vldStC = vldStC;
	}
	@Override
	public String toString() {
		return "CmcdGrpmVo [grpC=" + grpC + ", grpCNm=" + grpCNm + ", wkC=" + wkC + ", grpCExpl=" + grpCExpl
				+ ", vldStC=" + vldStC + ", fstRgtWkrNm=" + fstRgtWkrNm + ", fstRgtDtm=" + fstRgtDtm + ", lstMdfWkrNm="
				+ lstMdfWkrNm + ", lstMdfDtm=" + lstMdfDtm + "]";
	}
	
	
	
	
	
}
