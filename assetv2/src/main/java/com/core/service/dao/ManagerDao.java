package com.core.service.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.core.vo.ManagerVo;
import com.core.vo.MgrLgnDto;

@Repository
public class ManagerDao {

	@Inject
	private SqlSession session;
	
	public ManagerVo selectLogon(MgrLgnDto dto) {
		// TODO Auto-generated method stub
		return session.selectOne("manager.login",dto);
	}

}
