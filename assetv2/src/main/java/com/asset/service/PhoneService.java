package com.asset.service;

import java.util.Map;

import com.asset.vo.PhoneVo;
import com.core.vo.ManagerDto;
import com.emp.vo.SearchDto;

public interface PhoneService {

	public Map<String, Object> selPhoneList(SearchDto dto) throws Exception;

	public void insPhoneRst(PhoneVo vo, ManagerDto manager) throws Exception;

	public void updPhoneMdf(PhoneVo vo, ManagerDto manager) throws Exception;

	public void delPhoneDl(PhoneVo vo, ManagerDto manager) throws Exception;

}
