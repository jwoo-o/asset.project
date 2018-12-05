package com.core.service.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.core.vo.CommonVo;

@Repository
public class CommonServiceDao {

	@Inject
	private SqlSession session;
	
	public List<CommonVo> selectDiv() {
		// TODO Auto-generated method stub
		return session.selectList("common.selectDiv");
	}
	public List<CommonVo> selectPos() {
		// TODO Auto-generated method stub
		return session.selectList("common.selectPos");
	}
	public List<CommonVo> selectCat() {
		// TODO Auto-generated method stub
		return session.selectList("common.selectCat");
	}
	public List<CommonVo> selectStt(){
		
		return session.selectList("common.selectStt");
	}
public List<CommonVo> selectOfc(){
		
		return session.selectList("common.selectOfc");
	}
}
