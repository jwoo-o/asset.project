package com.emp.service;

import java.util.List;

import com.emp.vo.EmpVo;

public interface EmpService {

	public List<EmpVo> empList();
	public EmpVo getEmp(String empNo);
	public void empMdf(EmpVo vo);
	public void empDl(String empNo);
	public void empRst(EmpVo vo);
}
