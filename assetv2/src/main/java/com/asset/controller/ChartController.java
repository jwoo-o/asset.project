package com.asset.controller;



import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.asset.service.AssetService;
import com.asset.vo.ChartDto;

@Controller
public class ChartController {

	private static final Logger logger = LoggerFactory.getLogger(ChartController.class);
	
	@Inject
	private AssetService service;
	
	@RequestMapping("/chart")
	public void chartView() {
		
	}
	@RequestMapping(value="/chart/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> chartData(@RequestBody ChartDto dto) {
		logger.info(dto.toString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = service.assetChart(dto);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
		}
		return map;
	}
}
