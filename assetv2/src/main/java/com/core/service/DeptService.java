package com.core.service;

import java.util.List;
import java.util.Map;

import com.core.vo.CommonDto;
import com.core.vo.DeptViewDto;
import com.core.vo.DeptVo;
import com.core.vo.ManagerDto;

public interface DeptService {

	public Map<String, Object> insDept(DeptVo vo, ManagerDto manager) throws Exception;

	public Map<String, Object> selDept(CommonDto dto) throws Exception;

	public Map<String, Object> selMgrDept(DeptVo vo) throws Exception;

	public Map<String, Object> selOrgChart(String country) throws Exception;

	public Map<String, Object> selDeptDtl(DeptViewDto dto) throws Exception;

	public List<DeptViewDto> selDeptSearch() throws Exception;

	public Map<String, Object> selEmpEditDept(Map<String, Object> data) throws Exception;

	public List<DeptViewDto> selDivisionSearch() throws Exception;

	public Map<String, Object> delDept(DeptViewDto dto, ManagerDto manager)  throws Exception;

	public void selOrgChartDownload() throws Exception;

}
