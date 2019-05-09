package com.core.service;

import java.util.Map;

import com.core.vo.MailVo;
import com.core.vo.ManagerDto;

public interface MailService {

	public Map<String, Object> insMailSend(MailVo vo, ManagerDto manager)throws Exception;
}
