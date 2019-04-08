package com.core.service.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.core.vo.ManagerVo;
import com.core.vo.MgrLgnDto;
import com.core.vo.MgrPwdDto;
import com.emp.vo.EmpVo;

@Repository
public class ManagerDao {

	@Inject
	private SqlSession session;
	
	public ManagerVo selectLogon(MgrLgnDto dto) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("manager.login",dto);
	}

	public void insertMgt(ManagerVo vo)throws SQLException {
		// TODO Auto-generated method stub
		session.insert("manager.insert",vo);
	}

	public int deleteMgt(String empNo)throws SQLException {
		// TODO Auto-generated method stub
		return session.delete("manager.delete",empNo);
	}

	public void updateMgt(EmpVo vo)throws SQLException {
		// TODO Auto-generated method stub
		session.update("manager.update",vo);
	}

	public int updatePwd(MgrPwdDto dto)throws SQLException {
		// TODO Auto-generated method stub
		return session.update("manager.updatePwd",dto);
	}

	public List<String> selectManagerId()throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("manager.selectId");
	}

}
