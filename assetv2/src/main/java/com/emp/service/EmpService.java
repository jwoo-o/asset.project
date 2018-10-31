package com.emp.service;


import java.sql.SQLException;
import java.util.Map;

import com.emp.vo.EmpVo;
import com.emp.vo.SearchDto;

public interface EmpService {

	public Map<String, Object> empList(SearchDto dto) throws SQLException;
	public EmpVo getEmp(String empNo) throws SQLException;
	public void empMdf(EmpVo vo) throws SQLException;
	public void empDl(EmpVo vo) throws SQLException;
	public void empRst(EmpVo vo) throws SQLException;
}
