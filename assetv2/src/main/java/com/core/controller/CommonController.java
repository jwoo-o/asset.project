package com.core.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.service.CommonServie;

@Controller
public class CommonController {

	@Inject
	private CommonServie service;
	
	private final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping(value="/common/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> commonList(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map = service.commonLst();
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg", "오류가 발생하였습니다. 관리자에게 문의하세요");
		}
		return map;
	}
}
