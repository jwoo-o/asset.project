package com.core.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.core.service.CommonServie;
import com.core.service.dao.CommonServiceDao;

@Service
public class CommonServiceImpl implements CommonServie {

	@Inject
	private CommonServiceDao dao;

	@Override
	public Map<String, Object> commonLst() {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("division", dao.selectDiv());
		map.put("position", dao.selectPos());
		map.put("category", dao.selectCat());
		map.put("status", dao.selectStt());
		map.put("office", dao.selectOfc());
		return map;
	}
	
	

}
