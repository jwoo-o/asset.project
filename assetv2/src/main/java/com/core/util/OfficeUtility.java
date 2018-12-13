package com.core.util;

import com.emp.vo.EmpVo;

public class OfficeUtility {

	public static void input(EmpVo vo) {
		// TODO Auto-generated method stub
		String division = vo.getDivision();
		
		switch (division) {
		case "1":case"3":case"7":case"9":case"10":case"12":
			vo.setOffice("0");
			break;
		default:
			vo.setOffice("1");
			break;
		}
	}

}
