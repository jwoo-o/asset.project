package com.emp.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.asset.service.dao.AssetDao;
import com.calendar.vo.CalendarVo;
import com.core.service.dao.ManagerDao;
import com.core.util.ManagerUtility;
import com.core.util.OfficeUtility;
import com.core.util.PageUtility;
import com.core.vo.ManagerDto;
import com.core.vo.ManagerVo;
import com.emp.service.EmpService;
import com.emp.service.dao.EmpDao;
import com.emp.vo.EmpVo;
import com.emp.vo.ProfileDto;
import com.emp.vo.SearchDto;

@Service
public class EmpServiceImpl implements EmpService {

	@Inject
	private EmpDao dao;
	@Inject 
	private AssetDao assetDao;
	@Inject
	private ManagerDao managerDao;
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	
	@Override
	public Map<String, Object> selEmpList(SearchDto dto) throws Exception {
		// TODO Auto-generated method stub
		PageUtility.calc(dto);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", dao.selectCount(dto));
		map.put("records", dao.selectList(dto));
		return map;
	}

	@Override
	public EmpVo selGetEmp(String empNo)throws Exception {
		// TODO Auto-generated method stub
		return dao.selectEmp(empNo);
	}

	@Override
	public void updEmpMdf(EmpVo vo,ManagerDto dto) throws Exception {
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
		OfficeUtility.input(vo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lstMdfWkrNm", dto.getmName());
		map.put("empNo", vo.getEmpNo());
		map.put("division", vo.getDivision());
		map.put("position", vo.getPosition());
		map.put("name", vo.getName());
		map.put("office", vo.getOffice());
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
	public void delEmpDl(EmpVo vo,ManagerDto dto)  throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
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
	public void insEmpRst(EmpVo vo) throws Exception {
		// TODO Auto-generated method stub
		OfficeUtility.input(vo);
		dao.insert(vo);
	}

	@Override
	public List<String> selMgrList(CalendarVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectMgr(vo);
	}

	@Override
	public Map<String, Object> selSeatList(SearchDto dto) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("records", dao.selectList(dto));
		map.put("count",dao.selectSeatCount());
		return map;
	}

	@Override
	public Map<String, Object> updImgUpload(ProfileDto dto) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		if(dto.getOriginal_name()!="" || dto.getOriginal_name()!=null) {
			File file = new File(uploadPath+"/"+dto.getOriginal_name());
			file.delete();
		}
		
		UUID uid = UUID.randomUUID();
		dto.setProfile_name(uid.toString()+dto.getProfile().getOriginalFilename());
		dao.updateImg(dto);
		File file = new File(uploadPath+"/"+dto.getProfile_name());
		FileOutputStream fos = new FileOutputStream(file);
		fos.write(dto.getProfile().getBytes());
		fos.close();
		
		
		
		return map;
	}

}
