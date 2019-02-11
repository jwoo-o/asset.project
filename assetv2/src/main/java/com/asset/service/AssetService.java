package com.asset.service;


import java.util.List;
import java.util.Map;

import com.asset.vo.AssetDownDto;
import com.asset.vo.AssetDto;
import com.asset.vo.AssetSearchDto;
import com.asset.vo.AssetViewDto;
import com.asset.vo.AssetVo;
import com.asset.vo.ChartDto;
import com.core.vo.ManagerDto;

public interface AssetService {

	public List<AssetViewDto> assetLst(AssetSearchDto dto) throws Exception;
	public AssetVo assetDtl(AssetDto dto) throws Exception;
	public void assetRgt(AssetVo vo, ManagerDto manager) throws Exception;
	public void assetMdf(AssetVo vo, ManagerDto manager) throws Exception;
	public void assetDl(AssetDto dto, ManagerDto manager) throws Exception;
	public String assetNo(String category) throws Exception;
	public void assetDlY(AssetDto dto) throws Exception;
	public List<AssetDownDto> assetDown(AssetSearchDto dto) throws Exception;
	public Map<String, Object> assetChart(ChartDto dto) throws Exception;
}
