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

	public List<AssetViewDto> selAssetLst(AssetSearchDto dto) throws Exception;
	public AssetVo selAssetDtl(AssetDto dto) throws Exception;
	public void insAssetRgt(AssetVo vo, ManagerDto manager) throws Exception;
	public void updAssetMdf(AssetVo vo, ManagerDto manager) throws Exception;
	public void updAssetDl(AssetDto dto, ManagerDto manager) throws Exception;
	public String selAssetNo(String category) throws Exception;
	public void delAssetDlY(AssetDto dto) throws Exception;
	public List<AssetDownDto> selAssetDown(AssetSearchDto dto) throws Exception;
	public Map<String, Object> selAssetChart(ChartDto dto) throws Exception;
}
