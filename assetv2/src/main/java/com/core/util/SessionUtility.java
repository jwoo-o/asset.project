package com.core.util;

import com.core.vo.ManagerDto;
import com.core.vo.ManagerVo;

public class SessionUtility {

	public static ManagerDto setSessionAttribute(ManagerVo vo) {
		
		ManagerDto dto = new ManagerDto();
		
		dto.setmId(vo.getmId());
		dto.setmName(vo.getmName());
		dto.setmNo(vo.getmNo());
		dto.setDivision(vo.getDept());
		dto.setAuth(vo.getAuth());
		dto.setdCode(vo.getdCode());
		
		return dto;
	}
}
