package com.core.util;

import com.core.vo.ManagerVo;
import com.emp.vo.EmpVo;

public class ManagerUtility {

	public static ManagerVo create(EmpVo vo) {
		ManagerVo mVo = new ManagerVo();
		mVo.setmId(vo.getEmail().substring(0, vo.getEmail().indexOf("@")));
		mVo.setPwd("global1!");
		mVo.setDept(vo.getDivision());
		mVo.setPosition(vo.getPosition());
		mVo.setEmpNo(vo.getEmpNo());
		mVo.setAuth(vo.getAuth());
		mVo.setmName(vo.getName());
		return mVo;
	}
}
