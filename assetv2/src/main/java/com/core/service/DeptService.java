package com.core.service;

import java.util.Map;

import com.core.vo.CommonDto;
import com.core.vo.DeptVo;
import com.core.vo.ManagerDto;

public interface DeptService {

	public Map<String, Object> insDept(DeptVo vo, ManagerDto manager) throws Exception;

	public Map<String, Object> selDept(CommonDto dto) throws Exception;

}
