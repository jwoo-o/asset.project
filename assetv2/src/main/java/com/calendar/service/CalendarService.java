package com.calendar.service;

import java.util.List;
import java.util.Map;

import com.calendar.vo.CalendarJoinDto;
import com.calendar.vo.CalendarVo;
import com.core.vo.ManagerDto;

public interface CalendarService {

	public List<CalendarVo> calendarList() throws Exception;
	public Map<String, Object> calendarMdf(CalendarVo vo, ManagerDto manager) throws Exception;
	public Map<String, Object> calendarRgt(CalendarVo vo, ManagerDto manager) throws Exception;
	public Map<String, Object> dateMdf(CalendarVo vo, ManagerDto manager) throws Exception;
	public Map<String, Object> calendarDl(CalendarVo vo) throws Exception;
	public Map<String, Object> calendarJoin(CalendarJoinDto dto, ManagerDto manager) throws Exception;
}
