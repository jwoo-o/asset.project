package com.core.service;

import java.sql.SQLException;
import java.util.Map;

import com.core.vo.ManagerVo;
import com.core.vo.MgrLgnDto;
import com.core.vo.MgrPwdDto;

public interface ManagerService {

	public Map<String, Object> logonProc(MgrLgnDto dto) throws SQLException;

	public String DeleteProc(ManagerVo vo) throws SQLException;

	public Map<String, Object> pwdMdf(MgrPwdDto dto) throws SQLException;

	
}
