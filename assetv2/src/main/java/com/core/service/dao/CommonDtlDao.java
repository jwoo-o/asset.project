package com.core.service.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.core.vo.CmcdDtlmVo;
import com.core.vo.CommonVo;

@Repository
public class CommonDtlDao {

	@Inject
	SqlSession session;
	
	public List<CmcdDtlmVo> selectDtlC(String grpC)throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("selectDtlC", grpC);
	}

	public void insertDtlC(CmcdDtlmVo vo)throws SQLException {
		// TODO Auto-generated method stub
		session.insert("insertDtlC",vo);
	}

	public int updateDtlC(CmcdDtlmVo vo)throws SQLException {
		// TODO Auto-generated method stub
		return session.update("updateDtlC", vo);
	}

	public int deleteDtlC(CmcdDtlmVo vo)throws SQLException {
		// TODO Auto-generated method stub
		return session.delete("deleteDtlC",vo);
	}
	/**그룹코드의 하위코드 내역*/
	public List<CommonVo> selectCode(String grpC)throws SQLException{
		
		return session.selectList("common.selectCode",grpC);
	}

	public void deleteDtlAll(String grpC)throws SQLException {
		// TODO Auto-generated method stub
		session.delete("common.deleteDtlAll",grpC);
	}

}
