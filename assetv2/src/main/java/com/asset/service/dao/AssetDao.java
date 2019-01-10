package com.asset.service.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

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
	
	public List<AssetViewDto> selectList(AssetSearchDto dto) throws SQLException{
		return session.selectList("asset.selectList",dto);
	}
	
	public AssetVo select(int aNo) throws SQLException{
		return session.selectOne("asset.select",aNo);
	}
	
	public void insert(AssetVo vo) throws SQLException{
		session.insert("asset.insert",vo);
	}
	public void update(AssetVo vo) throws SQLException{
		session.update("asset.update",vo);
	}
	public void delete(AssetDto dto) throws SQLException{
		session.update("asset.updateDl",dto);
	}

	public String selectAsNo(Map<String, Object> map) throws SQLException{
		// TODO Auto-generated method stub
		return session.selectOne("asset.asNo",map);
	}

	public void deleteY(AssetDto dto) throws SQLException{
		// TODO Auto-generated method stub
		session.delete("asset.delete",dto);
	}

	public List<AssetDownDto> selectDown(AssetSearchDto dto) throws SQLException{
		// TODO Auto-generated method stub
		return session.selectList("asset.selectDown",dto);
	}

	public void updateEmp(Map<String, Object> map) throws SQLException{
		// TODO Auto-generated method stub
		session.update("asset.empMdf",map);
	}

	public List<ChartDto> selectRow(ChartDto dto) throws SQLException{
		// TODO Auto-generated method stub
		//System.out.println("dao :"+key);
		
		return session.selectList("asset.row",dto);
	}

}
