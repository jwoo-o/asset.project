package com.asset.service;

import java.sql.SQLException;
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

	public List<AssetViewDto> assetLst(AssetSearchDto dto) throws SQLException;
	public AssetVo assetDtl(AssetDto dto) throws SQLException;
	public void assetRgt(AssetVo vo, ManagerDto manager) throws SQLException;
	public void assetMdf(AssetVo vo, ManagerDto manager) throws SQLException;
	public void assetDl(AssetDto dto, ManagerDto manager) throws SQLException;
	public String assetNo(String category) throws SQLException;
	public void assetDlY(AssetDto dto) throws SQLException;
	public List<AssetDownDto> assetDown(AssetSearchDto dto) throws SQLException;
	public Map<String, Object> assetChart(ChartDto dto) throws SQLException;
}
