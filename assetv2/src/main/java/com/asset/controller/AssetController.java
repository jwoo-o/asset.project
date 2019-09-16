package com.asset.controller;

import java.util.HashMap;

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

import com.asset.service.AssetService;
import com.asset.vo.AssetDto;
import com.asset.vo.AssetSearchDto;
import com.asset.vo.AssetVo;
import com.asset.vo.ChartDto;
import com.core.service.CommonServie;
import com.core.vo.ManagerDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AssetController {

	private static final Logger logger = LoggerFactory.getLogger(AssetController.class);

	@Inject
	private AssetService service;
	
	@Inject
	private CommonServie cService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/home")
	public void home(Model model) throws Exception {
		model.addAttribute("common",cService.selCommonLst());
		
	}
	/**자산 리스트 검색*/
	@RequestMapping(value = "/asset/list/proc", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> assetLst(@RequestBody AssetSearchDto dto) {
		logger.debug(dto.toString());
		

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("list", service.selAssetLst(dto));
			map.put("msg", "0001");
		} catch (Exception e) {
			// TODO: handle exception
			map.put("msg", "목록을 가져오는데 실패하셨습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}
	/*
	@RequestMapping(value = "/asset/register", method = RequestMethod.GET)
	public String assetRst(Model model) throws Exception{
		model.addAttribute("common",cService.selCommonLst());
		return "register";
	}*/

	@RequestMapping(value = "/asset/register/proc", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> assetRst(@RequestBody AssetVo vo, HttpSession session) {
		logger.debug(vo.toString());
		
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.insAssetRgt(vo, manager);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;

	}

	@RequestMapping("/asset/detail")
	public String assetDtl(@RequestParam int aNo, Model model)throws Exception {
		AssetDto dto = new AssetDto();
		dto.setaNo(aNo);
		logger.debug(dto.toString());
		model.addAttribute("common",cService.selCommonLst());
		model.addAttribute("vo", service.selAssetDtl(dto));
		return "/register";
	}

	@RequestMapping(value = "/asset/update/proc", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> assetMdf(@RequestBody AssetVo vo, HttpSession session) {
		logger.debug(vo.toString());
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.updAssetMdf(vo, manager);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}

	@RequestMapping(value = "/asset/delete/proc", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> assetDl(@RequestBody AssetDto dto, HttpSession session) {
		
		logger.debug(dto.toString());
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.updAssetDl(dto, manager);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}
	@RequestMapping(value = "/asset/deleteY/proc", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> assetDlY(@RequestBody AssetDto dto) {

		logger.debug(dto.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.delAssetDlY(dto);
			map.put("msg","0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}
	@RequestMapping(value="/asset/noSearch/proc",method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> assetNo(@RequestBody String category){
		logger.debug(category);
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("assetNo", service.selAssetNo(category));
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
			logger.error(e.getMessage());
		}
		return map;
	}
	@RequestMapping("/asset/chart")
	public String chartView() {
		return "chart";
	}
	@RequestMapping(value="/asset/chart/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> chartData(@RequestBody ChartDto dto) {
		logger.debug(dto.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.selAssetChart(dto);
			map.put("msg", "0001");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		return map;
	}

}
