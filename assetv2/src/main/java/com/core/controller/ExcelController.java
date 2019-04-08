package com.core.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.asset.service.AssetService;
import com.asset.vo.AssetDownDto;
import com.asset.vo.AssetSearchDto;

@Controller
public class ExcelController {

	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);
	
	@Inject
	private AssetService service;
	
	@RequestMapping(value="/excelDownload",method=RequestMethod.POST)
	public String excelForm(AssetSearchDto dto,HttpServletResponse response,Map<String, Object> map) {
		logger.info(dto.toString());
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd.");
		String fileName = format.format(date)+"Giosis.asset";
		
		response.setHeader("Content-disposition", "attachment; filename="+fileName+".xlsx");
		
		List<AssetDownDto> excelList = null;
		try {
			excelList = service.selAssetDown(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error(e.getMessage());
		}
		map.put("list",excelList);
		return "excelView";
	}
}
