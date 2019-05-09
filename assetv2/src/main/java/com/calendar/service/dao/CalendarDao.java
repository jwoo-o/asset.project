package com.calendar.service.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.calendar.vo.CalendarJoinDto;
import com.calendar.vo.CalendarVo;

@Repository
public class CalendarDao {

	@Inject
	private SqlSession session;
	
	public List<CalendarVo> selectLst() throws SQLException{
		
		return session.selectList("calendar.selectLst");
	}
	
	public void insertCal(CalendarVo vo) throws SQLException {
		session.insert("calendar.insertCal",vo);
	}
	
	public int updateCal(CalendarVo vo) throws SQLException {
		return session.update("calendar.updateCal",vo);
	}

	public int updateDate(CalendarVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("calendar.updateDate", vo);
	}

	public int updateDl(CalendarVo vo) throws SQLException {
		// TODO Auto-generated method stub
		return session.delete("calendar.deleteCal", vo);
	}

	public int updateJoin(CalendarJoinDto dto) throws SQLException {
		// TODO Auto-generated method stub
		return session.update("calendar.updateJoin", dto);
	}

	public List<CalendarVo> selectIp() throws SQLException {
		// TODO Auto-generated method stub
		return session.selectList("calendar.selectIp");
	}

	public int updateIp(CalendarVo data) {
		// TODO Auto-generated method stub
		return session.update("calendar.updateIp",data);
	}
}
