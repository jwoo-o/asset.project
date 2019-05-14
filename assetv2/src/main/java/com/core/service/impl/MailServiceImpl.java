package com.core.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.calendar.service.dao.CalendarDao;
import com.calendar.vo.CalendarVo;
import com.core.service.EmailSendService;
import com.core.service.MailService;
import com.core.vo.MailVo;
import com.core.vo.ManagerDto;

@Service
public class MailServiceImpl implements MailService {

	@Inject
	private EmailSendService service;
	@Inject
	private CalendarDao dao;
	
	@Resource(name="velocityEngine")
    VelocityEngine velocityEngine;
	
	
	@Override
	public Map<String, Object> insMailSend(MailVo vo,ManagerDto dto) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("list", vo.getList());
		map.put("type", vo.getType());
		map.put("content", vo.getContent());
		@SuppressWarnings("deprecation")
		String content = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "email_template/mail.vm","UTF-8",map);
		service.emailGrpSendProc(vo.getSubject(), content, "ga_kr@qoo10.com", vo.getTo(), vo.getCc());
		if(vo.getList()!=null) {
			for(CalendarVo data : vo.getList()) {
				data.setLstMdfWkrNm(dto.getmName());
				dao.updateIp(data);
			}
			map.clear();
			map.put("msg", "0001");
		}
		
		return map;
	}

}
