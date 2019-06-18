package com.asset.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.asset.service.PhoneService;
import com.asset.service.dao.PhoneDao;
import com.asset.vo.PhoneVo;
import com.core.util.PageUtility;
import com.core.vo.ManagerDto;
import com.emp.vo.SearchDto;

@Service
public class PhoneServiceImpl implements PhoneService {

	@Inject
	private PhoneDao dao;
	
	
	@Override
	public Map<String, Object> selPhoneList(SearchDto dto) throws Exception {
		// TODO Auto-generated method stub
		PageUtility.calc(dto);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", dao.selectCount(dto));
		map.put("records", dao.selectList(dto));
		return map;
	}

	@Override
	public void insPhoneRst(PhoneVo vo, ManagerDto manager) throws Exception {
		// TODO Auto-generated method stub

		vo.setFstRgtWkrNm(manager.getmName());
		vo.setLstMdfWkrNm(manager.getmName());
		
		dao.insert(vo);
	}

	@Override
	public void updPhoneMdf(PhoneVo vo, ManagerDto manager) throws Exception {
		// TODO Auto-generated method stub

		
		vo.setLstMdfWkrNm(manager.getmName());
		dao.update(vo);
	}

	@Override
	public void delPhoneDl(PhoneVo vo, ManagerDto manager) throws Exception {
		// TODO Auto-generated method stub

		vo.setLstMdfWkrNm(manager.getmName());
		dao.delete(vo);
	}

}
