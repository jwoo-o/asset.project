package com.calendar.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.calendar.service.CalendarService;
import com.calendar.service.dao.CalendarDao;
import com.calendar.vo.CalendarJoinDto;
import com.calendar.vo.CalendarVo;
import com.core.service.EmailSendService;
import com.core.service.dao.ManagerDao;
import com.core.util.OfficeUtility;
import com.core.vo.ManagerDto;
import com.emp.service.dao.EmpDao;
import com.emp.vo.EmpVo;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Inject
	private CalendarDao dao;
	
	@Inject
	private ManagerDao mDao;
	
	@Inject
	private EmailSendService emailSendService;
	
	@Inject
	private EmpDao eDao;
	
	@Resource(name="velocityEngine")
    VelocityEngine velocityEngine;
	
	
	@Override
	public List<CalendarVo> selCalendarList() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectLst();
	}

	@Override
	public Map<String, Object> insCalendarRgt(CalendarVo vo,ManagerDto manager) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = mDao.selectManagerId();
		list.add(vo.getMgr_email().split("@")[0]);
		vo.setTitle("["+vo.getAddNrein()+"]"+vo.getName());
		vo.setFstRgtWkrNm(manager.getmName());
		vo.setLstMdfWkrNm(manager.getmName());
		//DateUtillity.calendarFormat(vo);
		dao.insertCal(vo); 
		String subject = "[GA]입사예정 안내 메일";
		map.put("mName", manager.getmName());
		map.put("start", vo.getStart());
		map.put("name", vo.getName());
		map.put("mgr", vo.getMgr());
		map.put("divNm", vo.getDivNm());
		map.put("addNRein", vo.getAddNrein());
		map.put("type", "emp_pl");
		map.put("content", "신규 입사 예정자 안내 메일<br/>");
		@SuppressWarnings("deprecation")
		String content = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "email_template/mail.vm","UTF-8",map);
		/*String content = "<html><body><div style= 'width:500;border:solid #fffff;}'><h2>신규 입사예정자 안내 메일</h2><table border='1'><tr><td style='width:200px;'><b>등록자</b></td><td>"+manager.getmName()+"</td></tr>"
				+ "<tr><td><b>입사예정일</b></td><td>"+vo.getStart()+"</td></tr>"
				+ "<tr><td><b>이름</b></td><td>"+vo.getName()+"</td></tr>"
				+ "<tr><td><b>부서</b></td><td>"+vo.getDivNm()+"</td></tr>"
				+ "<tr><td><b>관리자</b></td><td>"+vo.getMgr()+"</td></tr>"
				+ "<tr><td><b>증원/충원</b></td><td>"+vo.getAddNrein()+"</td></tr>"
				+ "<tr><td><b>예정 좌석</b></td><td>"+vo.getSeat()+"</td></tr></table><hr><div style='text-align: right;'>" + 
						"	    	<img src='https://stcom.image-gmkt.com/css/us/qoo10/front/cm/common/image/logo_qoo10_main.png'>" + 
						"	    	</div></div></body></html>";
		*/
		emailSendService.emailSendProc(subject, content, "ga_kr@qoo10.com",list,manager.getmName(), "system");
		map.clear();
		return map;
	}

	@Override
	public Map<String, Object> updCalendarMdf(CalendarVo vo,ManagerDto manager) throws Exception{
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		vo.setTitle("["+vo.getAddNrein()+"]"+vo.getName());
		vo.setLstMdfWkrNm(manager.getmName());
		dao.updateCal(vo);
			
		return map;
	}

	@Override
	public Map<String, Object> updDateMdf(CalendarVo vo,ManagerDto manager) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		//DateUtillity.calendarFormat(vo);
		vo.setLstMdfWkrNm(manager.getmName());
		dao.updateDate(vo);
		return map;
	}

	@Override
	public Map<String, Object> delCalendarDl(CalendarVo vo) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		vo.setTitle(vo.getName());
		dao.updateDl(vo);
		return map;
	}

	@Override
	public Map<String, Object> updCalendarJoin(CalendarJoinDto dto, ManagerDto manager) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		EmpVo vo = new EmpVo();
		
		vo.setEmpNo(dto.getEmpNo());
		vo.setName(dto.getName());
		vo.setGender(dto.getGender());
		vo.setDivision(dto.getDivision());
		vo.setPosition(dto.getPosition());
		vo.setJoinDate(dto.getJoinDate());
		vo.setEmail(dto.getEmail());
		vo.setSeat(dto.getSeat());
		OfficeUtility.input(vo);
		dto.setLstMdfWkrNm(manager.getmName());
		List<String> list = mDao.selectManagerId();	
		eDao.insert(vo);
		if(dao.updateJoin(dto)>0) {
			
			
			String subject = "GA_System";
			String content = "<html><body><div style= 'width:500;border:solid #fffff;}'><h2>신규입사자 등록 확인 메일</h2><table border='1'><tr><td style='width:200px;'><b>등록자</b></td><td>"+manager.getmName()+"</td></tr>"
					+ "<tr><td><b>사번</b></td><td>"+dto.getEmpNo()+"</td></tr>"
					+ "<tr><td><b>이름</b></td><td>"+dto.getName()+"</td></tr>"
					+ "<tr><td><b>부서</b></td><td>"+dto.getDivNm()+"</td></tr>"
					+ "<tr><td><b>직위</b></td><td>"+dto.getPosNm()+"</td></tr>"
					+ "<tr><td><b>이메일</b></td><td>"+dto.getEmail()+"</td></tr>"
					+ "<tr><td><b>성별</b></td><td>"+dto.getGender()+"</td></tr></table><hr><div style='text-align: right;'>" + 
							"	    	<img src='https://stcom.image-gmkt.com/css/us/qoo10/front/cm/common/image/logo_qoo10_main.png'>" + 
							"	    	</div></div></body></html>";
			
				
			emailSendService.emailSendProc(subject, content, "ga_kr@qoo10.com",list,manager.getmName(), "system");
			
		}
					
		return map;
	}

	@Override
	public Map<String, Object> selIpConfirm() throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", dao.selectIp());
		return map;
	}

}
