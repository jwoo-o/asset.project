package com.emp.service.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.emp.vo.EmpVo;

@Repository
public class EmpDao {

	@Inject
	private SqlSession session;
	
	public List<EmpVo> selectList(){
	
		return session.selectList("emp.list");
	}
	
	public EmpVo selectEmp(String empNo) {
		
		return session.selectOne("emp.detail",empNo);
	}
	
	public void insert(EmpVo vo) {
		
		session.insert("emp.insert",vo);
	}
	
	public void update(EmpVo vo) {
		
		session.update("emp.update",vo);
	}
	
	public void delete(String empNo) {
		
		session.delete("emp.delete",empNo);
	}
}
