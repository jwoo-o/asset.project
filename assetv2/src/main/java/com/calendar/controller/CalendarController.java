package com.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.calendar.service.CalendarService;
import com.calendar.vo.CalendarJoinDto;
import com.calendar.vo.CalendarVo;
import com.core.service.CommonServie;
import com.core.vo.ManagerDto;

@Controller
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	
	@Inject
	private CommonServie cService;
	
	@Inject
	private CalendarService service;
	
	@RequestMapping("/calendar")
	public void joinEmp(Model model) throws Exception {
		model.addAttribute("common", cService.selCommonLst());
	}
	@RequestMapping(value="/calendarRgt/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> calendarRgtProc(@RequestBody CalendarVo vo,HttpSession session){
		logger.debug(vo.toString());
		Map<String, Object> map = new HashMap<String,Object>();
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		try {
			map = service.insCalendarRgt(vo,manager);
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");	
		}
		return map;
	}
	
	@RequestMapping(value="/calendarMdf/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> calendarMdfProc(@RequestBody CalendarVo vo,HttpSession session){
		logger.debug(vo.toString());
		Map<String, Object> map = new HashMap<String,Object>();
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		try {
			map = service.updCalendarMdf(vo,manager);
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");	
		}
		return map;
	}
	@RequestMapping(value="/calendarLst/proc",method=RequestMethod.POST)
	public @ResponseBody List<CalendarVo> calendarLstProc(){
		List<CalendarVo> list = null;
		try {
			list = service.selCalendarList();
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		return list;
	}
	@RequestMapping(value="/calendarDate/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> calendarDateProc(@RequestBody CalendarVo vo,HttpSession session){
		logger.debug(vo.toString());
		Map<String, Object> map = new HashMap<String,Object>();
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		try {
			map = service.updDateMdf(vo,manager);
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");	
		}
		return map;
	}
	
	@RequestMapping(value="/calendarDl/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> calendarDlProc(@RequestBody CalendarVo vo){
		logger.debug(vo.toString());
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			map = service.delCalendarDl(vo);
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");	
		}
		return map;
	}
	@RequestMapping(value="/calendarJoin/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> calendarJoinProc(@RequestBody CalendarJoinDto dto,HttpSession session){
		logger.debug(dto.toString());
		Map<String, Object> map = new HashMap<String,Object>();
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		try {
			map = service.updCalendarJoin(dto,manager);
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");	
		}
		return map;
	}
	@RequestMapping(value="/ipConfirm/proc")
	public @ResponseBody Map<String, Object> ipConfirmProc(){
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			map = service.selIpConfirm();
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");	
		}
		return map;
	}
	
}
