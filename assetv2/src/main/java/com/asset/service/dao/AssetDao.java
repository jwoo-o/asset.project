package com.asset.service.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.asset.vo.AssetDownDto;
import com.asset.vo.AssetDto;
import com.asset.vo.AssetSearchDto;
import com.asset.vo.AssetViewDto;
import com.asset.vo.AssetVo;
import com.asset.vo.ChartDto;
import com.emp.vo.EmpVo;

@Repository
public class AssetDao {

	@Inject
	private SqlSession session;
	
	public List<AssetViewDto> selectList(AssetSearchDto dto){
		return session.selectList("asset.selectList",dto);
	}
	
	public AssetVo select(int aNo) {
		return session.selectOne("asset.select",aNo);
	}
	
	public void insert(AssetVo vo) {
		session.insert("asset.insert",vo);
	}
	public void update(AssetVo vo) {
		session.update("asset.update",vo);
	}
	public void delete(AssetDto dto) {
		session.update("asset.updateDl",dto);
	}

	public String selectAsNo(String category) {
		// TODO Auto-generated method stub
		return session.selectOne("asset.asNo",category);
	}

	public void deleteY(AssetDto dto) {
		// TODO Auto-generated method stub
		session.delete("asset.delete",dto);
	}

	public List<AssetDownDto> selectDown(AssetSearchDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("asset.selectDown",dto);
	}

	public void updateEmpDl(EmpVo vo) {
		// TODO Auto-generated method stub
		session.update("asset.empDl",vo);
	}

	public List<ChartDto> selectRow(ChartDto dto) {
		// TODO Auto-generated method stub
		//System.out.println("dao :"+key);
		
		return session.selectList("asset.row",dto);
	}
}
