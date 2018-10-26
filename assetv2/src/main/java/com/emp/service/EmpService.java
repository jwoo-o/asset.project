package com.emp.service;


import java.util.Map;

import com.emp.vo.EmpVo;
import com.emp.vo.SearchDto;

public interface EmpService {

	public Map<String, Object> empList(SearchDto dto);
	public EmpVo getEmp(String empNo);
	public void empMdf(EmpVo vo);
	public void empDl(EmpVo vo);
	public void empRst(EmpVo vo);
}
