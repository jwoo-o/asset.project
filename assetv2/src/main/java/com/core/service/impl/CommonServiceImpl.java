package com.core.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.core.service.CommonServie;
import com.core.service.dao.CommonDtlDao;
import com.core.service.dao.CommonGrpDao;
import com.core.vo.CmcdDtlmDto;
import com.core.vo.CmcdDtlmVo;
import com.core.vo.CmcdGrpmDto;
import com.core.vo.CmcdGrpmVo;
import com.core.vo.CommonDto;
import com.core.vo.ManagerDto;

@Service
public class CommonServiceImpl implements CommonServie {

	/***/
	@Inject
	private CommonGrpDao dao;
	
	@Inject
	private CommonDtlDao dDao;
	
	
	

	@Override
	public Map<String, Object> selCommonLst() throws Exception{
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<CmcdGrpmVo> commons = new ArrayList<CmcdGrpmVo>();
		commons = dao.selectList();
		for (CmcdGrpmVo vo : commons) {
			map.put(vo.getGrpC(), dDao.selectCode(vo.getGrpC()));
		}
		return map;
	}

	@Override
	public Map<String, Object> selCommonSearch(CommonDto dto) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		dto.setNext((dto.getNext()-1)*10);
		List<CmcdGrpmDto> list = dao.selectGrpC(dto);
		int next = dao.selectGrpCCount(dto);
		
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

	@Override
	public Map<String, Object> selCommonDtl(String grpC) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("cmcdGrpm", dao.selectGrpCDtl(grpC));
		map.put("cmcdDtlm", dDao.selectDtlC(grpC));
		
		return map;
	}

	@Override
	public Map<String, Object> insCommonWriteProc(CmcdGrpmVo vo, ManagerDto manager) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		vo.setFstRgtWkrNm(manager.getmId());
		vo.setLstMdfWkrNm(manager.getmId());
		switch (vo.getVldStC()) {
		case "C":
			dao.insertCommon(vo);
			break;

		case "U":
			dao.updateCommon(vo);
			break;
			
		}
		return map;
	}

	@Override
	public Map<String, Object> insCommonSubWriterProc(List<CmcdDtlmDto> list, ManagerDto manager)throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		CmcdDtlmVo vo = null;
		int idx = 1;
		int applyCount = 0;
		for(CmcdDtlmDto dto : list) {
			vo = new CmcdDtlmVo();
			switch (dto.getVldStC()) {
			
			case "C":
				vo.setDtlC(dto.getDtlC());
				vo.setDtlCNm(dto.getDtlCNm());
				vo.setGrpC(dto.getGrpC());
				vo.setOrdSn(idx++);
				vo.setFstRgtWkrNm(manager.getmId());
				vo.setLstMdfWkrNm(manager.getmId());
				
				dDao.insertDtlC(vo);
				applyCount++;
				break;

			case "U":
				vo.setDtlCNm(dto.getDtlCNm());
				vo.setDtlC(dto.getDtlC());
				vo.setGrpC(dto.getGrpC());
				vo.setOrdSn(idx++);
				vo.setLstMdfWkrNm(manager.getmId());
				
				applyCount += dDao.updateDtlC(vo);
				break;
			case "D":
				vo.setDtlC(dto.getDtlC());
				vo.setGrpC(dto.getGrpC());
				
				applyCount += dDao.deleteDtlC(vo);
				break;
			}
			
			if(applyCount>0) {
				map.put("msg", "0001");
			}
			
		}
		
		return map;
	}

	@Override
	public Map<String, Object> delCommonDeleteProc(String grpC) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		dDao.deleteDtlAll(grpC);
		if(dao.deleteCommon(grpC)>0) {
			map.put("msg", "0001");
		}else {
			map.put("msg", "삭제 할 코드가 존재 하지 않습니다");
		}
		return map;
	}
	
	

}
