package com.emp.contoller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.calendar.vo.CalendarVo;
import com.core.service.CommonServie;
import com.core.service.DeptService;
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
	@Inject 
	private CommonServie cService;
	@Inject
	private DeptService dService;
	
	@RequestMapping(value="/emp/assetSearch/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> searchEmp(@RequestBody EmpDto dto){
		logger.debug(dto.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("emp", service.selGetEmp(dto.getUserName()));
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		
		return map;
	}
	
	@RequestMapping(value="/emp")
	public String emp(Model model) throws Exception {
		model.addAttribute("common", cService.selCommonLst());
		model.addAttribute("dept", dService.selDeptSearch());
		return "manager";
	}
	@RequestMapping(value="/emp/list/proc")
	public @ResponseBody Map<String,Object> empLst(SearchDto dto) {
		logger.debug(dto.toString());
		Map<String,Object> map = null;
		try {
			map =  service.selEmpList(dto);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
		}
		return map;
	}
	
	
	@RequestMapping(value="/emp/register/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empRstProc(@RequestBody EmpVo vo) {
		logger.debug(vo.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.insEmpRst(vo);
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage(),e);
		}
		return map;
	}
	@RequestMapping(value="/emp/update/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empMdfProc(@RequestBody EmpVo vo,HttpSession session) {
		logger.debug(vo.toString());
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.updEmpMdf(vo,manager);
			
		}catch (Exception e) {
			// TODO: handle exception
			if(e.getMessage().equals("부서장인 상태에서 부서를 변경 할 수 없습니다")) {
				map.put("msg", "부서장인 상태에서 부서를 변경 할 수 없습니다");
				
			}else {
				map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			}
			
			logger.error(e.getMessage(),e);
		}
		return map;
	}
	@RequestMapping(value="/emp/delete/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> empDlProc(@RequestBody EmpVo vo,HttpSession session) {
		logger.debug(vo.toString());
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.delEmpDl(vo,manager);
		}catch (Exception e) {
			// TODO: handle exception	
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage(),e);
		}
		return map;
	}
	
	@RequestMapping(value="/emp/mgrSearch/proc",method=RequestMethod.POST)
	public @ResponseBody List<EmpVo> mgrSearchProc(@RequestBody CalendarVo vo){
		logger.debug(vo.toString());
		List<EmpVo> list = new ArrayList<EmpVo>();
		try {
			list = service.selMgrList(vo);
		}catch (Exception e) {
			// TODO: handle exception
			
			logger.error(e.getMessage(),e);
		}
		return list;
	}
	@RequestMapping(value="/seat")
	public void seat() {}
	
	@RequestMapping(value="/seat/list/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> empSeatProc(@RequestBody SearchDto dto) {
		logger.debug(dto.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map =  service.selSeatList(dto);
		
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage(),e);
		}
		return map;
	}
	@RequestMapping(value="/emp/imgUpload/proc")
	public @ResponseBody Map<String, Object> empImgUldProc(@RequestParam(value="profile",required=false)MultipartFile profile,String empNo,String original_name){
		logger.debug("file name : "+profile.getOriginalFilename()+", empNo : "+empNo+", original_name : "+original_name);
		ProfileDto dto = new ProfileDto();
		dto.setProfile(profile);
		dto.setEmpNo(empNo);
		dto.setOriginal_name(original_name);
		Map<String, Object> map = new HashMap<String, Object>();
		try {			
			map = service.updImgUpload(dto);
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage(),e);
		}
		return map;
		
	}
	
	@RequestMapping(value="/emp/organization",method=RequestMethod.GET)
	public String organization(Model model) throws Exception{
		model.addAttribute("common", cService.selCommonLst());
		return "organization";
	}
	@RequestMapping(value="/emp/organization/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> organizationProc(@RequestBody String country) throws Exception{
	
		logger.debug("country : {}",country);
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			map = dService.selOrgChart(country);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		
		return map;
	}
	@RequestMapping(value="/emp/detail/proc",method=RequestMethod.POST)
	public  @ResponseBody Map<String, Object> empDetailProc(@RequestBody String empNo){
	
		logger.debug("empNo : {}",empNo);
		Map<String, Object> map = new HashMap<String,Object>();
		try {
			map = service.selEmpDetail(empNo);
			
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		return map;
	}
	
}
