package com.core.service;

import java.util.List;

public interface EmailSendService {
	
	public void emailSendProc(String subject, String content, String from, List<String> rcvEmlAddr, String rcvNm, String wkrId) throws Exception;
	public void emailGrpSendProc(String subject, String content, String from, String[] to,String[] cc) throws Exception;
	
}
