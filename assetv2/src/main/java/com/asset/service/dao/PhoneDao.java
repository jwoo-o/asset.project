package com.asset.service.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.asset.vo.PhoneVo;
import com.emp.vo.SearchDto;

@Repository
public class PhoneDao {

	@Inject
	private SqlSession session;
	
	public int selectCount(SearchDto dto) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("phone.count",dto);
		
	}

	public List<PhoneVo> selectList(SearchDto dto) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("phone.list",dto);
	}

	public void insert(PhoneVo vo) throws SQLException {
		// TODO Auto-generated method stub
		session.insert("phone.insert",vo);
	}

	public void update(PhoneVo vo) throws SQLException {
		// TODO Auto-generated method stub
		session.update("phone.update",vo);
	}

	public void delete(PhoneVo vo) throws SQLException {
		// TODO Auto-generated method stub
		session.delete("phone.delete",vo);
	}

}
