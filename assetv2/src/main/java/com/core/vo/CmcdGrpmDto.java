package com.core.vo;

public class CmcdGrpmDto {

	/** 그룹코드 */
	private String grpC;
	/** 그룹코드명 */
	private String grpCNm;
	/** 업무코드 */
	private String wkC;
	/** 그룹코드설명 */
	private String grpCExpl;
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
	public String getLstMdfDtm() {
		return lstMdfDtm;
	}
	public void setLstMdfDtm(String lstMdfDtm) {
		this.lstMdfDtm = lstMdfDtm;
	}
	@Override
	public String toString() {
		return "CmcdGrpmDto [grpC=" + grpC + ", grpCNm=" + grpCNm + ", wkC=" + wkC + ", grpCExpl=" + grpCExpl
				+ ", lstMdfDtm=" + lstMdfDtm + "]";
	}
	
	
}
