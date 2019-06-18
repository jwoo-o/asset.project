package com.asset.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asset.service.PhoneService;
import com.asset.vo.PhoneVo;
import com.core.controller.CoreController;
import com.core.service.CommonServie;
import com.core.vo.ManagerDto;
import com.emp.vo.SearchDto;

@Controller
public class PhonebookController extends CoreController {
	

	@Inject
	private PhoneService service;
	
	@Inject
	private CommonServie cService;

	@RequestMapping(value="/phoneBook",method=RequestMethod.GET)
	public String phoneBook(Model model)throws Exception {
		model.addAttribute("common",cService.selCommonLst());
		return "phone";
	}
	@RequestMapping(value="/phone/list/proc",method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> empLst(SearchDto dto) {
		logger.debug(dto.toString());
		Map<String,Object> map = null;
		try {
			map =  service.selPhoneList(dto);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg", "오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		return map;
	}
	
	
	@RequestMapping(value="/phone/register/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empRstProc(@RequestBody PhoneVo vo,HttpServletRequest request) {
		logger.debug(vo.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		ManagerDto manager = (ManagerDto) getSessionAttribute(request, "mgr");
		try {
			service.insPhoneRst(vo,manager);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/phone/update/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empMdfProc(@RequestBody PhoneVo vo,HttpServletRequest request) {
		logger.debug(vo.toString());
		ManagerDto manager = (ManagerDto) getSessionAttribute(request, "mgr");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.updPhoneMdf(vo,manager);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/phone/delete/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empDlProc(@RequestBody PhoneVo vo,HttpServletRequest request) {
		logger.debug(vo.toString());
		ManagerDto manager = (ManagerDto) getSessionAttribute(request, "mgr");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.delPhoneDl(vo,manager);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception		
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}
}
