package com.emp.service;


import java.util.List;
import java.util.Map;

import com.calendar.vo.CalendarVo;
import com.core.vo.ManagerDto;
import com.emp.vo.EmpVo;
import com.emp.vo.ProfileDto;
import com.emp.vo.SearchDto;

public interface EmpService {

	public Map<String, Object> selEmpList(SearchDto dto) throws Exception;
	public EmpVo selGetEmp(String empNo) throws Exception;
	public void updEmpMdf(EmpVo vo, ManagerDto manager) throws Exception;
	public void delEmpDl(EmpVo vo, ManagerDto manager) throws Exception;
	public void insEmpRst(EmpVo vo) throws Exception;
	public List<String> selMgrList(CalendarVo vo) throws Exception;
	public Map<String, Object> selSeatList(SearchDto dto) throws Exception;
	public Map<String, Object> updImgUpload(ProfileDto dto) throws Exception;
}
