package com.emp.service.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.calendar.vo.CalendarVo;
import com.core.vo.ManagerVo;
import com.emp.vo.EmpVo;
import com.emp.vo.ProfileDto;
import com.emp.vo.SearchDto;
import com.emp.vo.SeatDto;

@Repository
public class EmpDao {

	@Inject
	private SqlSession session;
	
	public List<EmpVo> selectList(SearchDto dto) throws SQLException{
	
		return session.selectList("emp.list",dto);
	}
	
	public EmpVo selectEmp(String empNo) throws SQLException{
		
		return session.selectOne("emp.detail",empNo);
	}
	
	public void insert(EmpVo vo)throws SQLException {
		
		session.insert("emp.insert",vo);
	}
	
	public void update(EmpVo vo) throws SQLException{
		
		session.update("emp.update",vo);
	}
	
	public void delete(String empNo) throws SQLException{
		
		session.delete("emp.delete",empNo);
	}

	public int selectCount(SearchDto dto) throws SQLException{
		// TODO Auto-generated method stub
		return session.selectOne("emp.count",dto);
	}

	public void updateMgt(ManagerVo vo)throws SQLException {
		// TODO Auto-generated method stub
		session.update("emp.mgt",vo);
	}

	public String exiManager(String empNo)throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne("emp.exiManager",empNo);
	}

	public List<EmpVo> selectMgr(CalendarVo vo)throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("emp.mgrList",vo);
	}

	public List<SeatDto> selectSeatCount()throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("emp.seatCount");
	}

	public void updateImg(ProfileDto dto)throws SQLException {
		// TODO Auto-generated method stub
		session.update("emp.updateImg",dto);
	}
}
