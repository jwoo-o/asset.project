package com.core.service;

import java.io.File;
import java.util.List;

public interface EmailSendService {
	
	public void emailSendProc(String subject, String content, String from, List<String> rcvEmlAddr) throws Exception;
	public void emailGrpSendProc(String subject, String content, String from, String[] to,String[] cc, List<File> file_list) throws Exception;
	
}
