package com.calendar.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.calendar.vo.CalendarVo;

public interface CalendarService {

	public List<CalendarVo> calendarList() throws SQLException;
	public Map<String, Object> calendarMdf(CalendarVo vo) throws SQLException;
	public Map<String, Object> calendarRgt(CalendarVo vo) throws SQLException;
	public Map<String, Object> dateMdf(CalendarVo vo) throws SQLException;
	public Map<String, Object> calendarDl(CalendarVo vo) throws SQLException;
}
