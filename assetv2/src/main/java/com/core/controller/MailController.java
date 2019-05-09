package com.core.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.core.service.MailService;
import com.core.vo.MailVo;
import com.core.vo.ManagerDto;

@Controller
public class MailController {

	private static final Logger logger = LoggerFactory.getLogger(MailController.class);
	
	@Inject
	private MailService servivce;
	
	@RequestMapping("/mail")
	public void mailView() throws Exception {
		
		logger.debug("mail send... open");
	}
	
	@RequestMapping(value="/mail/preview")
	public String mailPreview() throws Exception {
		
		logger.debug("preview... open");
		return "preview";
	}
	@RequestMapping(value="/mail/send/proc",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> mailSendProc(@RequestBody MailVo vo,HttpSession session){
		Map<String, Object> map = new HashMap<String,Object>();
		logger.debug(vo.toString());
		ManagerDto manager = (ManagerDto) session.getAttribute("mgr");
		try {
			map.put("msg", "0001");
			servivce.insMailSend(vo,manager);
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getMessage());
			map.put("msg","오류가 발생하였습니다. 관리자에게 문의하세요");	
		}
		return map;
	}
}
