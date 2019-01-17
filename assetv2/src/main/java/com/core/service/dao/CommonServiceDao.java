package com.core.service.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.core.vo.CmcdGrpmDto;
import com.core.vo.CmcdGrpmVo;
import com.core.vo.CommonDto;
import com.core.vo.CommonVo;

@Repository
public class CommonServiceDao {

	@Inject
	private SqlSession session;
	
	public List<CommonVo> selectDiv()throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("common.selectDiv");
	}
	public List<CommonVo> selectPos()throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("common.selectPos");
	}
	public List<CommonVo> selectCat()throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("common.selectCat");
	}
	public List<CommonVo> selectStt()throws SQLException{
		
		return session.selectList("common.selectStt");
	}
	public List<CommonVo> selectOfc()throws SQLException{
			
			return session.selectList("common.selectOfc");
		}
	
	public List<CmcdGrpmDto> selectGrpC(CommonDto dto)throws SQLException {
		// TODO Auto-generated method stub
		
		 	return session.selectList("common.selectGrpC",dto);
	}
	public int selectGrpCCount(CommonDto dto)throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("common.selectGrpCCount", dto);
	}
	public CmcdGrpmVo selectGrpCDtl(String grpC)throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("selectGrpCDtl",grpC);
	}
	public void insertCommon(CmcdGrpmVo vo)throws SQLException {
		// TODO Auto-generated method stub
		session.insert("insertCommon",vo);
	}
	public int updateCommon(CmcdGrpmVo vo)throws SQLException {
		// TODO Auto-generated method stub
		return session.update("updateCommon",vo); 
	}
}
