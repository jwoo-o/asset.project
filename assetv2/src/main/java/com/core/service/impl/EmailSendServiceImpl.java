package com.core.service.impl;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.core.service.EmailSendService;

@Service
public class EmailSendServiceImpl implements EmailSendService {

	@Autowired 
	private JavaMailSender mailSender;
	
	Logger logger = LoggerFactory.getLogger(EmailSendServiceImpl.class);
	
	@Override
	public void emailSendProc(String subject, String content, String from, List<String> rcvEmlAddr, String rcvNm,
			String wkrId) throws Exception {
		// TODO Auto-generated method stub
		try{
			// 이메일 발송
			for (String toAddr : rcvEmlAddr) {
				sendEml(subject, content,from, toAddr+"@qoo10.com");
			}
		}catch(MailException e){
			logger.error(e.getMessage(), e);
			
		}
	}
	
	public void sendEml(String subject, String text, String from, String to) throws Exception {
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	        @Override
	        public void prepare(MimeMessage mimeMessage) throws Exception {
	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	            helper.setFrom(from);
	            helper.setTo(to);
	            helper.setSubject(subject);
	            helper.setText(text, true);
	        }
	    };
	    mailSender.send(preparator);
	    }

}
	


