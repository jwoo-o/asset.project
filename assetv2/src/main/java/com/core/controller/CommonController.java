package com.core.controller;

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

import com.core.service.CommonServie;
import com.core.vo.CmcdDtlmDto;
import com.core.vo.CmcdGrpmVo;
import com.core.vo.CommonDto;
import com.core.vo.ManagerDto;

@Controller
public class CommonController {

	@Inject
	private CommonServie service;
	
	private final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping(value="/common/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> commonProc(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = service.selCommonLst();
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg", "오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		return map;
	}
	@RequestMapping(value="/common")
	public void commonView() throws Exception {
		logger.info("{}  common");
	}
	
	@RequestMapping(value="/common/search/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> commonSearchProc(@RequestBody CommonDto dto){
		logger.debug(dto.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.selCommonSearch(dto);
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.toString());
			map.put("msg", "오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		return map;
	}
	@RequestMapping(value="/common/write")
	public String commonWrite(Model model,String grpC) throws Exception{
		logger.debug(grpC);
		if(grpC!="" && grpC!=null) {
			model.addAttribute("map",service.selCommonDtl(grpC));
		}
		
		return "commonRegister";
		
	}
	@RequestMapping(value="/common/write/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> commonWriteProc(@RequestBody CmcdGrpmVo vo,HttpSession session){
		logger.debug(vo.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		try {
			map = service.insCommonWriteProc(vo,manager);
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.toString(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		return map;
	}
	
	@RequestMapping(value="/common/subWrite/proc")
	public @ResponseBody Map<String, Object> commonSubWriteProc(@RequestBody List<CmcdDtlmDto> list,HttpSession session){
		
		for(CmcdDtlmDto dto : list) {
			logger.debug(dto.toString());
		}
		Map<String, Object> map = new HashMap<String,Object>();
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		try {
			map = service.insCommonSubWriterProc(list,manager);
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.toString(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		return map;
	}
	@RequestMapping(value="/common/delete/proc")
	public @ResponseBody Map<String, Object> commonDeleteProc(@RequestBody String grpC){
		logger.debug(grpC);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.delCommonDeleteProc(grpC);
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.toString(),e);
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		
		return map;
		
	}
	@RequestMapping(value="/seat")
	public void seat() {}
}
