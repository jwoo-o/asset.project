package com.emp.service;


import java.util.List;
import java.util.Map;

import com.calendar.vo.CalendarVo;
import com.core.vo.ManagerDto;
import com.emp.vo.EmpVo;
import com.emp.vo.SearchDto;

public interface EmpService {

	public Map<String, Object> empList(SearchDto dto) throws Exception;
	public EmpVo getEmp(String empNo) throws Exception;
	public void empMdf(EmpVo vo, ManagerDto manager) throws Exception;
	public void empDl(EmpVo vo, ManagerDto manager) throws Exception;
	public void empRst(EmpVo vo) throws Exception;
	public List<String> mgrList(CalendarVo vo) throws Exception;
	public Map<String, Object> seatList(SearchDto dto) throws Exception;
}
