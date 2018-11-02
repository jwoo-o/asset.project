package com.emp.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.asset.service.dao.AssetDao;
import com.core.service.dao.ManagerDao;
import com.core.util.ManagerUtility;
import com.core.util.PageUtility;
import com.core.vo.ManagerDto;
import com.core.vo.ManagerVo;
import com.emp.service.EmpService;
import com.emp.service.dao.EmpDao;
import com.emp.vo.EmpVo;
import com.emp.vo.SearchDto;

@Service
public class EmpServiceImpl implements EmpService {

	@Inject
	private EmpDao dao;
	@Inject 
	private AssetDao assetDao;
	@Inject
	private ManagerDao managerDao;
	
	
	@Override
	public Map<String, Object> empList(SearchDto dto) throws SQLException {
		// TODO Auto-generated method stub
		PageUtility.calc(dto);
		Map<String, Object> map = new HashMap<>();
		map.put("total", dao.selectCount(dto));
		map.put("records", dao.selectList(dto));
		return map;
	}

	@Override
	public EmpVo getEmp(String empNo) {
		// TODO Auto-generated method stub
		return dao.selectEmp(empNo);
	}

	@Override
	public void empMdf(EmpVo vo,ManagerDto dto) throws SQLException {
		// TODO Auto-generated method stub
		
		if(dao.exiManager(vo.getEmpNo()).equals("n")) {
			if(vo.getManager()!=null) {
				ManagerVo mVo = ManagerUtility.create(vo);
				managerDao.insertMgt(mVo);
			}else {
				vo.setManager("n");
			}
		}else {
			managerDao.updateMgt(vo);
		}
		Map<String, Object> map = new HashMap<>();
		map.put("lstMdfWkrNm", dto.getmName());
		map.put("empNo", vo.getEmpNo());
		map.put("division", vo.getDivision());
		map.put("position", vo.getPosition());
		map.put("name", vo.getName());
		if(vo.getStatus().equals("n")) {
			map.put("note", vo.getName()+" 휴직");
			map.put("status", "s");
		}else {
			map.put("note", "");
			map.put("status", "y");
		}
		assetDao.updateEmp(map);
		dao.update(vo);
		
	}

	@Override
	public void empDl(EmpVo vo,ManagerDto dto)  throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("lstMdfWkrNm", dto.getmName());
		map.put("empNo", vo.getEmpNo());
		map.put("note", vo.getName()+" 퇴사");
		map.put("status", "s");
		map.put("division", "");
		map.put("position", "");
		map.put("name", "");
		assetDao.updateEmp(map);
		dao.delete(vo.getEmpNo());
		if(vo.getManager().equals("y"))
			managerDao.deleteMgt(vo.getEmpNo());
	}

	@Override
	public void empRst(EmpVo vo) throws SQLException {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

}
