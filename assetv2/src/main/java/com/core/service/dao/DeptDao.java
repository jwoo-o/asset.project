package com.core.service.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.core.vo.CommonDto;
import com.core.vo.DeptViewDto;
import com.core.vo.DeptVo;

	

@Repository
public class DeptDao {

	@Inject
	private SqlSession session;
	
	public void insert(DeptVo vo) throws SQLException {
		// TODO Auto-generated method stub
		
		session.insert("dept.insert",vo);
	}

	public List<DeptViewDto> select(CommonDto dto) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("dept.select",dto);
	}

	public int selectDCount(CommonDto dto) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("dept.selectCount",dto);
	}

}
