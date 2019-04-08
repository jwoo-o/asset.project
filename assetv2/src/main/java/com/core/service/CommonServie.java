package com.core.service;

import java.util.List;
import java.util.Map;

import com.core.vo.CmcdDtlmDto;
import com.core.vo.CmcdGrpmVo;
import com.core.vo.CommonDto;
import com.core.vo.ManagerDto;

public interface CommonServie {

	
	public Map<String, Object> selCommonLst() throws Exception;

	public Map<String, Object> selCommonSearch(CommonDto dto) throws Exception;

	public Map<String, Object> selCommonDtl(String grpC) throws Exception;

	public Map<String, Object> insCommonWriteProc(CmcdGrpmVo vo, ManagerDto manager)throws Exception;

	public Map<String, Object> insCommonSubWriterProc(List<CmcdDtlmDto> list, ManagerDto manager) throws Exception;

	public Map<String, Object> delCommonDeleteProc(String grpC) throws Exception;
	

}
