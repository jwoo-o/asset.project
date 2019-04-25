package com.emp.contoller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.calendar.vo.CalendarVo;
import com.core.service.CommonServie;
import com.core.vo.ManagerDto;
import com.emp.service.EmpService;
import com.emp.vo.EmpDto;
import com.emp.vo.EmpVo;
import com.emp.vo.ProfileDto;
import com.emp.vo.SearchDto;

@Controller
public class EmpController {

	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
	
	@Inject
	private EmpService service;
	@Inject CommonServie cService;
	
	@RequestMapping(value="/empSC/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> searchEmp(@RequestBody EmpDto dto){
		logger.debug(dto.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("emp", service.selGetEmp(dto.getUserName()));
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		
		return map;
	}
	
	@RequestMapping(value="/emp")
	public String emp(Model model) throws Exception {
		model.addAttribute("common", cService.selCommonLst());
		return "manager";
	}
	@RequestMapping(value="/empLst/proc")
	public @ResponseBody Map<String,Object> empLst(SearchDto dto) {
		logger.debug(dto.toString());
		Map<String,Object> map = null;
		try {
			map =  service.selEmpList(dto);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		return map;
	}
	
	
	@RequestMapping(value="/empRgt/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empRstProc(@RequestBody EmpVo vo) {
		logger.debug(vo.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.insEmpRst(vo);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/empMdf/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empMdfProc(@RequestBody EmpVo vo,HttpSession session) {
		logger.debug(vo.toString());
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.updEmpMdf(vo,manager);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/empDl/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empDlProc(@RequestBody EmpVo vo,HttpSession session) {
		logger.debug(vo.toString());
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.delEmpDl(vo,manager);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/empDtl")
	public String empDtl(String empNo,Model model) throws Exception {
		
		model.addAttribute("vo", service.selGetEmp(empNo));
		return "emp";
	}
	
	@RequestMapping(value="/mgrSearch/proc",method=RequestMethod.POST)
	public @ResponseBody List<EmpVo> mgrSearchProc(@RequestBody CalendarVo vo){
		logger.debug(vo.toString());
		List<EmpVo> list = new ArrayList<EmpVo>();
		try {
			list = service.selMgrList(vo);
		}catch (Exception e) {
			// TODO: handle exception
			
			logger.error(e.getMessage());
		}
		return list;
	}
	@RequestMapping(value="/empSeat/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> empSeatProc(@RequestBody SearchDto dto) {
		logger.debug(dto.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map =  service.selSeatList(dto);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/empImgUld/proc")
	public @ResponseBody Map<String, Object> empImgUldProc(@RequestParam(value="profile",required=false)MultipartFile profile,String empNo,String original_name){
		logger.debug("file name : "+profile.getOriginalFilename()+", empNo : "+empNo+", original_name : "+original_name);
		ProfileDto dto = new ProfileDto();
		dto.setProfile(profile);
		dto.setEmpNo(empNo);
		dto.setOriginal_name(original_name);
		Map<String, Object> map = new HashMap<String, Object>();
		try {			
			map = service.updImgUpload(dto);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
		
	}
	
	
}
