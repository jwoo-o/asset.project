package com.core.vo;

public class CmcdDtlmDto {

	/** 유효상태코드 */
	private String vldStC;
	
	/** 그룹코드 */
	private String grpC;
	
	/** 상세코드 */
	private String dtlC;
	
	/** 상세코드명 */
	private String dtlCNm;

	public String getVldStC() {
		return vldStC;
	}

	public void setVldStC(String vldStC) {
		this.vldStC = vldStC;
	}

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

	@Override
	public String toString() {
		return "CmcdDtlmDto [vldStC=" + vldStC + ", grpC=" + grpC + ", dtlC=" + dtlC + ", dtlCNm=" + dtlCNm + "]";
	}

	
	
	
}
