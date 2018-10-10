package com.core.service;

import java.util.Map;

import com.core.vo.MgrLgnDto;

public interface ManagerService {

	public Map<String, Object> logonProc(MgrLgnDto dto);

	
}
