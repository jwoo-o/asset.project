package com.emp.service.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.core.vo.ManagerVo;
import com.emp.vo.EmpVo;
import com.emp.vo.SearchDto;

@Repository
public class EmpDao {

	@Inject
	private SqlSession session;
	
	public List<EmpVo> selectList(SearchDto dto){
	
		return session.selectList("emp.list",dto);
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

	public int selectCount(SearchDto dto) {
		// TODO Auto-generated method stub
		return session.selectOne("emp.count",dto);
	}

	public void updateMgt(ManagerVo vo) {
		// TODO Auto-generated method stub
		session.update("emp.mgt",vo);
	}

	public String exiManager(String empNo) {
		// TODO Auto-generated method stub
		return session.selectOne("emp.exiManager",empNo);
	}
}
