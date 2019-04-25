package com.core.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.service.ManagerService;
import com.core.util.SessionUtility;
import com.core.vo.ManagerDto;
import com.core.vo.ManagerVo;
import com.core.vo.MgrLgnDto;
import com.core.vo.MgrPwdDto;


@Controller
public class ManagerController {

	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	@Inject
	private ManagerService service;
	
	@RequestMapping(value = {"/","/login"}, method = RequestMethod.GET)
	public String home(Locale locale,HttpSession session)throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		if(session.getAttribute("mgr") != null)
			session.removeAttribute("mgr");
		return "login";
	}
	
	@RequestMapping(value="/login/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> managerLogonProc(@RequestBody MgrLgnDto dto,HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.logonProc(dto);
			if(map != null) {
				if(map.get("msg").equals("0001")) {
					ManagerVo vo= (ManagerVo) map.get("managerVo");
					
					ManagerDto sDto = SessionUtility.setSessionAttribute(vo);
							
					request.getSession().setAttribute("mgr", sDto);
					logger.debug(sDto.toString());
				}else {
					map.put("msg", "아이디 또는 패스워드를 확인하세요");
				}
			}
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg","오류가 발생하였습니다 관리자에게 문의하세요");
		}
		return map;
	}
	
	@RequestMapping(value="/managerDl/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> managerDlProc(@RequestBody ManagerVo vo){
		Map<String, Object> map = new HashMap<String, Object>();
		logger.debug(vo.toString());
		try {
			map.put("msg", service.DeleteProc(vo));
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg", "오류가 발생하였습니다 관리자에게 문의하세요");
			
		}
		return map;
	}
	@RequestMapping("/password")
	public String pwdChange() throws Exception {
		return "password";
	}
	@RequestMapping(value="/password/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> pwdChange(@RequestBody MgrPwdDto dto){
		Map<String, Object> map = new HashMap<String,Object>();
		logger.debug(dto.toString());
		try {
			map = service.pwdMdf(dto);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg", "오류가 발생하였습니다 관리자에게 문의하세요");
		}
		return map;
		
	}
}
