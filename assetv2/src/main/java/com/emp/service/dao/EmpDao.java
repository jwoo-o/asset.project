package com.emp.service.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.calendar.vo.CalendarVo;
import com.core.vo.DeptVo;
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

	public List<EmpVo> selectDeptMgr(Map<String, Object> map) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("emp.selectDeptMgr",map);
	}
	public List<Map<String, Object>> selectOrgList(String country) throws SQLException {
		return session.selectList("emp.selectOrgList",country);
	}

	public List<Map<String, Object>> selectEmpCount(String country) {
		// TODO Auto-generated method stub
		return session.selectList("emp.selectEmpCount",country);
	}

	//최상위 부서 국가 변경시 조직원 전부 변경
	public void updateCountry(DeptVo vo) throws SQLException {
		// TODO Auto-generated method stub
		
		session.update("emp.updateCountry",vo);
		
	}
	
	public int updateHighLevelDept(DeptVo vo) throws SQLException  {
		// TODO Auto-generated method stub
		return session.update("emp.updateHighLevelDept",vo);
		
	}

	public int updateSecondLevelDept(Map<String, Object> data) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("emp.updateSecondLevelDept",data);
	}

	public int updateDownSecondLevelDept(DeptVo vo) throws SQLException {
		// TODO Auto-generated method stub
		
		return session.update("emp.updateDownSecondLevelDept",vo);
	}

	public int updateDownThreeLevelDept(DeptVo vo) throws SQLException {
		// TODO Auto-generated method stub
		
		return session.update("emp.updateDownThreeLevelDept",vo);
	}

	public int updateThreeLevelDept(Map<String, Object> data) throws SQLException {
		
		return session.update("emp.updateThreeLevelDept",data);
	}

	public int updateFourLevelDept(Map<String, Object> data) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("emp.updateFourLevelDept",data);
	}
	public int updateFiveLevelDept(Map<String, Object> data) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("emp.updateFiveLevelDept",data);
	}
	
	public int updateChangefirstLevelDept(DeptVo vo) throws SQLException {
		// TODO Auto-generated method stub
		
		return session.update("emp.updateChangefirstLevelDept",vo);
	}
	public int updateChangeSecondLevelDept(DeptVo vo) throws SQLException {
		// TODO Auto-generated method stub
		
		return session.update("emp.updateChangeSecondLevelDept",vo);
	}
	public int updateChangeThreeLevelDept(DeptVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("emp.updateChangeThreeLevelDept",vo);
	}
	
	public int updateTeamThreeDept(Map<String, Object> data) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("emp.updateTeamThreeDept",data);
	}
	public int updateTeamFourDept(Map<String, Object> data) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("emp.updateTeamFourDept",data);
	}
	

	

	

	
}
