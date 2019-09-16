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
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.service.CommonServie;
import com.core.service.DeptService;
import com.core.vo.CommonDto;
import com.core.vo.DeptVo;
import com.core.vo.ManagerDto;

@Controller
public class DeptController extends CoreController{

	
	@Inject
	private CommonServie cService;
	
	@Inject
	private DeptService service;
	
	@GetMapping("/dept/register")
	public String deptRegister(Model model) throws Exception{
		model.addAttribute("common",cService.selCommonLst());
		return "deptRegister";
	}
	
	@PostMapping("/dept/search/proc")
	public @ResponseBody Map<String, Object> deptSearchProc(@RequestBody CommonDto dto){
		
		Map<String, Object> map = new HashMap<String, Object>();
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
		logger.debug("DeptVo {}",vo.toString());
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
}
