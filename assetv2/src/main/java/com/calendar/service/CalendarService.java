package com.calendar.service;

import java.util.List;
import java.util.Map;

import com.calendar.vo.CalendarJoinDto;
import com.calendar.vo.CalendarVo;
import com.core.vo.ManagerDto;

public interface CalendarService {

	public List<CalendarVo> selCalendarList() throws Exception;
	public Map<String, Object> updCalendarMdf(CalendarVo vo, ManagerDto manager) throws Exception;
	public Map<String, Object> insCalendarRgt(CalendarVo vo, ManagerDto manager) throws Exception;
	public Map<String, Object> updDateMdf(CalendarVo vo, ManagerDto manager) throws Exception;
	public Map<String, Object> delCalendarDl(CalendarVo vo) throws Exception;
	public Map<String, Object> updCalendarJoin(CalendarJoinDto dto, ManagerDto manager) throws Exception;
	public Map<String, Object> selIpConfirm() throws Exception;
}