package com.asset.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.asset.service.AssetService;
import com.asset.service.dao.AssetDao;
import com.asset.vo.AssetDownDto;
import com.asset.vo.AssetDto;
import com.asset.vo.AssetSearchDto;
import com.asset.vo.AssetViewDto;
import com.asset.vo.AssetVo;
import com.asset.vo.ChartDto;
import com.core.util.DateUtillity;
import com.core.vo.ManagerDto;

@Service
public class AssetServiceImpl implements AssetService {

	@Inject
	private AssetDao dao;
	
	@Override
	public List<AssetViewDto> assetLst(AssetSearchDto dto) {
		// TODO Auto-generated method stub
		return dao.selectList(dto);
	}

	@Override
	public AssetVo assetDtl(AssetDto dto) {
		// TODO Auto-generated method stub
		return dao.select(dto.getaNo());
	}

	@Override
	public void assetRgt(AssetVo vo,ManagerDto manager) {
		
		// TODO Auto-generated method stub
		vo.setFstRgtWkrNm(manager.getmName());
		vo.setLstMdfWkrNm(manager.getmName());
		vo.setRe_time(DateUtillity.yearsInput(vo.getBuying(), vo.getCategory()));
	
		dao.insert(vo);
	}

	@Override
	public void assetMdf(AssetVo vo,ManagerDto manager) {
		// TODO Auto-generated method stub
		vo.setLstMdfWkrNm(manager.getmName());
		
		dao.update(vo);
	}

	@Override
	public void assetDl(AssetDto dto,ManagerDto manager) {
		// TODO Auto-generated method stub
		dto.setLstMdfWkrNm(manager.getmName());
		dao.delete(dto);
	}

	@Override
	public String assetNo(String category) {
		// TODO Auto-generated method stub
		if(category.equals("3"))
			category = "0";
		
		String assetNo = dao.selectAsNo(category);
		
		if(category.equals("2"))
			return "";
		int no = Integer.parseInt(assetNo.substring(2))+1;
		String nextAsset = assetNo.substring(0, 2)+String.format("%04d", no);
		
		return nextAsset;
	}

	@Override
	public void assetDlY(AssetDto dto) {
		// TODO Auto-generated method stub
		dao.deleteY(dto);
	}

	@Override
	public List<AssetDownDto> assetDown(AssetSearchDto dto) {
		// TODO Auto-generated method stub
		return dao.selectDown(dto);
	}

	@Override
	public Map<String, Object> assetChart(ChartDto dto) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<ChartDto> list = dao.selectRow(dto);
		map.put("rows", list);
		
		return map;
	}


}
