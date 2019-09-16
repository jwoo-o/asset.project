package com.core.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.core.service.DeptService;
import com.core.service.dao.DeptDao;
import com.core.vo.CommonDto;
import com.core.vo.DeptViewDto;
import com.core.vo.DeptVo;
import com.core.vo.ManagerDto;

@Service
public class DeptServiceImpl implements DeptService{

	@Inject
	private DeptDao dao;
	
	@Override
	public Map<String, Object> insDept(DeptVo vo, ManagerDto manager) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		vo.setFstRgtWkrNm(manager.getmName());
		vo.setLstMdfWkrNm(manager.getmName());
		dao.insert(vo);
		
		map.put("dept",vo);
		map.put("msg", "0001");
		return map;
	}

	@Override
	public Map<String, Object> selDept(CommonDto dto) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		dto.setNext((dto.getNext()-1)*10);
		List<DeptViewDto> list = dao.select(dto);
		int next = dao.selectDCount(dto);
		
		if(next%10>0) {
			next = next/10+1;
		}else {
			next = next/10;
		}
		
		if(list != null) {
			map.put("msg", "0001");
			map.put("list", list);
			map.put("next", next);
		}
		return map;
	}

	
}
