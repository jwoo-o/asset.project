package com.emp.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.emp.service.EmpService;
import com.emp.service.dao.EmpDao;
import com.emp.vo.EmpVo;

@Service
public class EmpServiceImpl implements EmpService {

	@Inject
	private EmpDao dao;
	
	@Override
	public List<EmpVo> empList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public EmpVo getEmp(String empNo) {
		// TODO Auto-generated method stub
		return dao.selectEmp(empNo);
	}

	@Override
	public void empMdf(EmpVo vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void empDl(String empNo) {
		// TODO Auto-generated method stub
		dao.delete(empNo);
	}

	@Override
	public void empRst(EmpVo vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

}
