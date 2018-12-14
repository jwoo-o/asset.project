package com.core.util;

import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;

import com.calendar.vo.CalendarVo;
import com.core.vo.ManagerVo;

public class MailUtility {

	private JavaMailSender sender;
	
		
	public void setSender(JavaMailSender sender) {
		this.sender = sender;
	}

	private Logger logger = LoggerFactory.getLogger(MailUtility.class);
	
	public void send(List<ManagerVo> list, CalendarVo vo) throws Exception {
		
		MimeMessage message = sender.createMimeMessage();
		
			for (ManagerVo managerVo : list) {
				message.setSubject("[공지] - 입사 예정 안내","UTF-8");
				String body = "<h2>ASSET</h2><br><table>"
						+ "<tr><td>입사자</td><td>"+vo.getName()+"</td><tr>"
						+ "<tr><td>부서</td><td>"+vo.getDivNm()+"</td><tr>"
						+ "<tr><td>입사일</td><td>"+vo.getStart()+"</td><tr>"
						+ "<tr><td>증원/충원</td><td>"+vo.getSeat()+"</td><tr>"
						+ "<tr><td>부서</td><td>"+vo.getName()+"</td><tr>"
						+ "</table>";
				message.setText(body, "UTF-8","html");
				message.setFrom(new InternetAddress("ga@qoo10.com"));
			    message.addRecipient(RecipientType.TO, new InternetAddress("ghkt741@qoo10.com"));
			    logger.info(vo.toString());
			    logger.info(sender.toString());
			    sender.send(message);
			}
		
	}
}
