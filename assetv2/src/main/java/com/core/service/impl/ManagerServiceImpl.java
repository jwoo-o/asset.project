package com.core.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.core.service.ManagerService;
import com.core.service.dao.ManagerDao;
import com.core.vo.ManagerVo;
import com.core.vo.MgrLgnDto;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Inject
	private ManagerDao dao;
	
	@Override
	public Map<String, Object> logonProc(MgrLgnDto dto) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		ManagerVo vo = dao.selectLogon(dto);
		if(vo != null) {
			
			map.put("managerVo",vo);
			map.put("msg", "0001");
		}else
			map.put("msg", "0000");
		
		return map;
	}

}
