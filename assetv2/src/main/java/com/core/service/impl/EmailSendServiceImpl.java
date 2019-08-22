package com.core.service.impl;

import java.io.File;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

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
		
			for (String toAddr : rcvEmlAddr) {
				sendEml(subject, content,from, toAddr+"@qoo10.com");
			}
	}
	@Override
	public void emailGrpSendProc(String subject, String content, String from, String[] to, String[] cc,
			List<File> file_list) throws Exception {
		// TODO Auto-generated method stub
		sendGrpEml(subject, content, from, to, cc,file_list);
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

	public void sendGrpEml(String subject, String text, String from, String[] to,String[] cc,List<File> file_list) throws Exception {
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	        @Override
	        public void prepare(MimeMessage mimeMessage) throws Exception {
	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	            helper.setFrom(from);
	            helper.setTo(to);
	            helper.setCc(cc);
	            helper.setSubject(subject);
	            helper.setText(text, true);
	            if(file_list.size()>0) {
	            	for (File file : file_list) {
	            		helper.addAttachment(MimeUtility.encodeText(file.getName(), "euc-kr", "b"), file);
					}
	            	/*helper.addAttachment("1.Biz Card.xlsx", file_list.get(0));
	            	helper.addAttachment("2.Giosis instruction.pdf", file_list.get(1));
	            	helper.addAttachment("3.Qnumber 등록.docx", file_list.get(2));
	            	helper.addAttachment("4.신상명세서form.xlsx", file_list.get(3));
	            	helper.addAttachment(new String("5.영업비밀보호경업금지서약.docx".getBytes("UTF-8"),), file_list.get(4));*/		
	            }
	        }
	    };
	    mailSender.send(preparator);
	    }
	

	
}
	


