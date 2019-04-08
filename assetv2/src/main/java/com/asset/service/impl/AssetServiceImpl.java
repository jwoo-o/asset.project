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
import com.core.service.dao.CommonDtlDao;
import com.core.service.dao.CommonGrpDao;
import com.core.util.DateUtillity;
import com.core.vo.ManagerDto;

@Service
public class AssetServiceImpl implements AssetService {

	@Inject
	private AssetDao dao;
	
	@Inject
	private CommonGrpDao cDao;
	
	@Override
	public List<AssetViewDto> selAssetLst(AssetSearchDto dto) throws Exception{
		// TODO Auto-generated method stub
		return dao.selectList(dto);
	}

	@Override
	public AssetVo selAssetDtl(AssetDto dto) throws Exception{
		// TODO Auto-generated method stub
		return dao.select(dto.getaNo());
	}

	@Override
	public void insAssetRgt(AssetVo vo,ManagerDto manager) throws Exception {
		
		// TODO Auto-generated method stub
		vo.setFstRgtWkrNm(manager.getmName());
		vo.setLstMdfWkrNm(manager.getmName());
		vo.setRe_time(DateUtillity.yearsInput(vo.getBuying(), vo.getCategory()));
	
		dao.insert(vo);
	}

	@Override
	public void updAssetMdf(AssetVo vo,ManagerDto manager) throws Exception{
		// TODO Auto-generated method stub
		vo.setLstMdfWkrNm(manager.getmName());
		
		dao.update(vo);
	}

	@Override
	public void updAssetDl(AssetDto dto,ManagerDto manager) throws Exception{
		// TODO Auto-generated method stub
		dto.setLstMdfWkrNm(manager.getmName());
		dao.delete(dto);
	}

	@Override
	public String selAssetNo(String category) throws Exception{
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		
		if(category.equals("3")) {
			map.put("category1","0");
		}else if(category.equals("0")) {
			map.put("category1","3");
		}
		
		
		map.put("category", category);
		String assetNo = dao.selectAsNo(map);
		
		
		int no = Integer.parseInt(assetNo.substring(2))+1;
		String nextAsset = assetNo.substring(0, 2)+String.format("%04d", no);
		
		return nextAsset;
	}

	@Override
	public void delAssetDlY(AssetDto dto) throws Exception{
		// TODO Auto-generated method stub
		dao.deleteY(dto);
	}

	@Override
	public List<AssetDownDto> selAssetDown(AssetSearchDto dto) throws Exception{
		// TODO Auto-generated method stub
		return dao.selectDown(dto);
	}

	@Override
	public Map<String, Object> selAssetChart(ChartDto dto) throws Exception{
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<ChartDto> list = dao.selectRow(dto);
		map.put("rows", list);
		
		return map;
	}



}
