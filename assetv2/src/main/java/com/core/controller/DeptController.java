package com.core.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.service.CommonServie;
import com.core.service.DeptService;
import com.core.vo.CommonDto;
import com.core.vo.DeptViewDto;
import com.core.vo.DeptVo;
import com.core.vo.ManagerDto;

@Controller
public class DeptController extends CoreController{

	
	@Inject
	private CommonServie cService;
	
	@Inject
	private DeptService service;
	
	
	@GetMapping("/dept/register")
	public String deptRegister(Model model,String dept_no) throws Exception{
		
		model.addAttribute("common",cService.selCommonLst());
		if(dept_no!=null) {
			model.addAttribute("dept_no", dept_no);
		}
		return "deptRegister";
	}
	@PostMapping("/dept/dtl/proc")
	public @ResponseBody  Map<String, Object> deptDtlPorc(@RequestBody DeptViewDto dto){
		Map<String, Object> map = new HashMap<String, Object>();
		logger.debug("DeptViewDto : {}",dto);
		try {
			map = service.selDeptDtl(dto);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		return map;
	}
	
	
	@PostMapping("/dept/search/proc")
	public @ResponseBody Map<String, Object> deptSearchProc(@RequestBody CommonDto dto){
		
		Map<String, Object> map = new HashMap<String, Object>();
		logger.debug("CommonDto : {}",dto);
		try {
			map = service.selDept(dto);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		
		
		return map;
	}
	
	@PostMapping("/dept/register/proc")
	public @ResponseBody Map<String, Object> deptRegisterProc(@RequestBody DeptVo vo,HttpSession session){
		logger.debug("DeptVo : {}",vo.toString());
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			map = service.insDept(vo,manager);			
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		return map;
	}
	
	@PostMapping("/dept/mgrSearch/proc")
	public @ResponseBody Map<String, Object> deptMgrSearchProc(@RequestBody DeptVo vo){
		
		logger.debug("deptVo : {}",vo.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.selMgrDept(vo);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		
		
		return map;
	}
	
	
	@GetMapping("/dept")
	public String dept(Model model) throws Exception{
		logger.debug("{}  dept");
		model.addAttribute("common",cService.selCommonLst());
		return "common";
		
	}
	
	@PostMapping("/dept/emp-edit/search/proc")
	public @ResponseBody Map<String, Object> empEditDeptSearchProc(@RequestBody Map<String, Object> data){
		
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			map = service.selEmpEditDept(data);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		
		return map;
	}
	@PostMapping("/dept/delete/proc")
	public @ResponseBody Map<String, Object> deptDeleteProc(@RequestBody DeptViewDto dto,HttpSession session){
		
		logger.debug("DeptViewDto : {}",dto);
		Map<String, Object> map = new HashMap<String, Object>();
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		try {
			map = service.delDept(dto,manager);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		return map;
	}
	
}
