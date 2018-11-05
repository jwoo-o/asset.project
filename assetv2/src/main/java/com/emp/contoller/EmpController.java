package com.emp.contoller;

import java.util.HashMap;
import java.util.List;
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

import com.core.service.CommonServie;
import com.core.vo.ManagerDto;
import com.emp.service.EmpService;
import com.emp.vo.EmpDto;
import com.emp.vo.EmpVo;
import com.emp.vo.SearchDto;

@Controller
public class EmpController {

	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
	
	@Inject
	private EmpService service;
	@Inject CommonServie cService;
	
	@RequestMapping(value="/empSC/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> searchEmp(@RequestBody EmpDto dto){
		logger.info(dto.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("emp", service.getEmp(dto.getUserName()));
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		
		return map;
	}
	
	@RequestMapping(value="/emp")
	public String emp(Model model) {
		model.addAttribute("common", cService.commonLst());
		return "manager";
	}
	@RequestMapping(value="/empLst/proc")
	public @ResponseBody Map<String,Object> empLst(SearchDto dto) {
		logger.info(dto.toString());
		Map<String,Object> map = null;
		try {
			map =  service.empList(dto);
		}catch (Exception e) {
			// TODO: handle exception
			logger.debug(e.getMessage());
		}
		return map;
	}
	
	
	@RequestMapping(value="/empRgt/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empRstProc(@RequestBody EmpVo vo) {
		logger.info(vo.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.empRst(vo);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.debug(e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/empMdf/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empMdfProc(@RequestBody EmpVo vo,HttpSession session) {
		logger.info(vo.toString());
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.empMdf(vo,manager);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.debug(e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/empDl/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empDlProc(@RequestBody EmpVo vo,HttpSession session) {
		logger.info(vo.toString());
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.empDl(vo,manager);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.debug(e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/empDtl")
	public String empDtl(String empNo,Model model) throws Exception {
		
		model.addAttribute("vo", service.getEmp(empNo));
		return "emp";
	}
}
