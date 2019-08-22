package com.core.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

@SuppressWarnings("deprecation")
@Service
public class MailServiceImpl implements MailService {

	@Inject
	private EmailSendService service;
	@Inject
	private CalendarDao dao;
	
	@Resource(name="velocityEngine")
    VelocityEngine velocityEngine;
	
	@Resource(name="mailPath")
	private String mailPath;
	
	
	@Override
	public Map<String, Object> insMailSend(MailVo vo,ManagerDto dto) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		List<File> file_list = new ArrayList<File>();
		String sender = "ga_kr@qoo10.com";
		map.put("list", vo.getList());
		map.put("type", vo.getType());
		map.put("content", vo.getContent());
		if(vo.getType().equals("pass")) {
			map.put("name",dto.getmName());
			map.put("division", dto.getDivision());
			map.put("entry_date", vo.getEntry_date());
			map.put("entry_time", vo.getEntry_time());
			map.put("office_number", dto.getOffice_number());
			sender = "hr_kr@qoo10.com";
		}
		if(vo.getType().equals("document")) {
			sender = "hr_kr@qoo10.com";
			File bizCard = new File(mailPath+"/v1.Biz Card.xlsx");
			File instruction = new File(mailPath+"/2.Giosis instruction.pdf");
			File qnumber = new File(mailPath+"/3.Qnumber 등록.docx");
			File info = new File(mailPath+"/4.신상명세서form.xlsx");
			File pledge = new File(mailPath+"/5.영업비밀보호경업금지서약.docx");
			
			
			file_list.add(bizCard);
			file_list.add(instruction);
			file_list.add(qnumber);
			file_list.add(info);
			file_list.add(pledge);
		}
		String content = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "email_template/mail.vm","UTF-8",map);
		service.emailGrpSendProc(vo.getSubject(), content, sender, vo.getTo(), vo.getCc(),file_list);
		if(vo.getList()!=null) {
			for(CalendarVo data : vo.getList()) {
				data.setLstMdfWkrNm(dto.getmName());
				dao.updateIp(data);
			}
			map.clear();
		}
		
		return map;
	}

}
