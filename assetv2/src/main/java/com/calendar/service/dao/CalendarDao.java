package com.calendar.service.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.calendar.vo.CalendarVo;

@Repository
public class CalendarDao {

	@Inject
	private SqlSession session;
	
	public List<CalendarVo> selectLst(){
		
		return session.selectList("calendar.selectLst");
	}
	
	public void insertCal(CalendarVo vo) {
		session.insert("calendar.insertCal",vo);
	}
	
	public int updateCal(CalendarVo vo) {
		return session.update("calendar.updateCal",vo);
	}

	public int updateDate(CalendarVo vo) {
		// TODO Auto-generated method stub
		return session.update("calendar.updateDate", vo);
	}

	public int updateDl(CalendarVo vo) {
		// TODO Auto-generated method stub
		return session.delete("calendar.deleteCal", vo);
	}
}
