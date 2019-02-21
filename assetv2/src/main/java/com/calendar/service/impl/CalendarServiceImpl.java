package com.calendar.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.calendar.service.CalendarService;
import com.calendar.service.dao.CalendarDao;
import com.calendar.vo.CalendarVo;
import com.core.service.EmailSendService;
import com.core.service.dao.ManagerDao;

import com.core.vo.ManagerDto;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Inject
	private CalendarDao dao;
	
	@Inject
	private ManagerDao mDao;
	
	@Inject
	private EmailSendService emailSendService;
	
	@Override
	public List<CalendarVo> calendarList() throws SQLException {
		// TODO Auto-generated method stub
		return dao.selectLst();
	}

	@Override
	public Map<String, Object> calendarRgt(CalendarVo vo,ManagerDto manager) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = mDao.selectManagerId();
		
		map.put("msg", "0001");
		vo.setTitle("["+vo.getAddNrein()+"]"+vo.getName());
		vo.setFstRgtWkrNm(manager.getmName());
		vo.setLstMdfWkrNm(manager.getmName());
		//DateUtillity.calendarFormat(vo);
		dao.insertCal(vo); 
		String subject = "GA_System";
		String content = "<html><body><div style= 'width:500;border:solid #fffff;}'><h2>신규입사자 안내 메일</h2><table border='1'><tr><td style='width:200px;'><b>등록자</b></td><td>"+manager.getmName()+"</td></tr>"
				+ "<tr><td><b>입사예정일</b></td><td>"+vo.getStart()+"</td></tr>"
				+ "<tr><td><b>이름</b></td><td>"+vo.getName()+"</td></tr>"
				+ "<tr><td><b>부서</b></td><td>"+vo.getDivNm()+"</td></tr>"
				+ "<tr><td><b>관리자</b></td><td>"+vo.getMgr()+"</td></tr>"
				+ "<tr><td><b>증원/충원</b></td><td>"+vo.getAddNrein()+"</td></tr>"
				+ "<tr><td><b>예정 좌석</b></td><td>"+vo.getSeat()+"</td></tr></table><hr><div style='text-align: right;'>" + 
						"	    	<img src='https://stcom.image-gmkt.com/css/us/qoo10/front/cm/common/image/logo_qoo10_main.png'>" + 
						"	    	</div></div></body></html>";
		try {
			emailSendService.emailSendProc(subject, content, "ga_kr@qoo10.com",list,manager.getmName(), "system");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return map;
	}

	@Override
	public Map<String, Object> calendarMdf(CalendarVo vo) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		vo.setTitle("["+vo.getAddNrein()+"]"+vo.getName());
		if(dao.updateCal(vo)>0)
			map.put("msg", "0001");
		return map;
	}

	@Override
	public Map<String, Object> dateMdf(CalendarVo vo) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		//DateUtillity.calendarFormat(vo);
		
		if(dao.updateDate(vo)>0)
			map.put("msg", "0001");
		return map;
	}

	@Override
	public Map<String, Object> calendarDl(CalendarVo vo) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		vo.setTitle(vo.getName());
		if(dao.updateDl(vo)>0)
			map.put("msg", "0001");
		return map;
	}

}
