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
public class CommonGrpDao {

	@Inject
	private SqlSession session;
	
	
	
	/** 그룹코드 리스트검색 10개씩*/
	public List<CmcdGrpmDto> selectGrpC(CommonDto dto)throws SQLException {
		// TODO Auto-generated method stub
		
		 	return session.selectList("common.selectGrpC",dto);
	}
	/** 그룹코드 리스트갯수 (페이징)*/
	public int selectGrpCCount(CommonDto dto)throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("common.selectGrpCCount", dto);
	}
	/** 그룹코드 상세내역*/
	public CmcdGrpmVo selectGrpCDtl(String grpC)throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("selectGrpCDtl",grpC);
	}
	/** 그룹코드 등록*/
	public void insertCommon(CmcdGrpmVo vo)throws SQLException {
		// TODO Auto-generated method stub
		session.insert("insertCommon",vo);
	}
	/** 그룹코드 수정*/
	public int updateCommon(CmcdGrpmVo vo)throws SQLException {
		// TODO Auto-generated method stub
		return session.update("updateCommon",vo); 
	}
	
	/** 그룹코드 코드명 전체리스트*/
	public List<CmcdGrpmVo> selectList() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("common.selectList");
	}
	/** 그룹코드 삭제 */
	public int deleteCommon(String grpC) throws SQLException {
		// TODO Auto-generated method stub
		return session.delete("common.deleteCommon",grpC);
	}
}
