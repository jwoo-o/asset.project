package com.core.service.impl;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.core.service.ManagerService;
import com.core.service.dao.ManagerDao;
import com.core.vo.ManagerVo;
import com.core.vo.MgrLgnDto;
import com.core.vo.MgrPwdDto;
import com.emp.service.dao.EmpDao;

@Service
public class ManagerServiceImpl implements ManagerService{

	@Inject
	private ManagerDao dao;
	
	@Inject 
	private EmpDao eDao;
	
	
	@Override
	public Map<String, Object> logonProc(MgrLgnDto dto) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		ManagerVo vo = dao.selectLogon(dto);
		if(vo != null) {
			
			map.put("managerVo",vo);
			map.put("msg", "0001");
		}else
			map.put("msg", "0000");
		
		return map;
	}

	
	@Override
	public String DeleteProc(ManagerVo vo) throws SQLException {
		// TODO Auto-generated method stub
		String mgr = "0000";
		if(dao.deleteMgt(vo.getEmpNo())>0) {
			mgr = "0001";		
		}
		eDao.updateMgt(vo);
		return mgr;
	}


	@Override
	public Map<String, Object> pwdMdf(MgrPwdDto dto) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("msg", "0000");
		if(dao.updatePwd(dto)>0)
				map.put("msg", "0001");
			return map;
		
		
	}

}
