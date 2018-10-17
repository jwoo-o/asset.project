package com.asset.service;

import java.util.List;

import com.asset.vo.AssetDownDto;
import com.asset.vo.AssetDto;
import com.asset.vo.AssetSearchDto;
import com.asset.vo.AssetViewDto;
import com.asset.vo.AssetVo;
import com.core.vo.ManagerDto;

public interface AssetService {

	public List<AssetViewDto> assetLst(AssetSearchDto dto);
	public AssetVo assetDtl(AssetDto dto);
	public void assetRgt(AssetVo vo, ManagerDto manager);
	public void assetMdf(AssetVo vo, ManagerDto manager);
	public void assetDl(AssetDto dto, ManagerDto manager);
	public String assetNo(String category);
	public void assetDlY(AssetDto dto);
	public List<AssetDownDto> assetDown(AssetSearchDto dto);
}
