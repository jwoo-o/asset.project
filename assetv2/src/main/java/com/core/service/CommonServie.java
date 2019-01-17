package com.core.service;

import java.util.List;
import java.util.Map;

import com.core.vo.CmcdDtlmDto;
import com.core.vo.CmcdGrpmVo;
import com.core.vo.CommonDto;
import com.core.vo.ManagerDto;

public interface CommonServie {

	
	public Map<String, Object> commonLst() throws Exception;

	public Map<String, Object> commonSearch(CommonDto dto) throws Exception;

	public Map<String, Object> commonDtl(String grpC) throws Exception;

	public Map<String, Object> commonWriteProc(CmcdGrpmVo vo, ManagerDto manager)throws Exception;

	public Map<String, Object> commonSubWriterProc(List<CmcdDtlmDto> list, ManagerDto manager);
	

}
