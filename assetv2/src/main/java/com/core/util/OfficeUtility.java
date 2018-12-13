package com.core.util;

import com.emp.vo.EmpVo;

public class OfficeUtility {

	public static void input(EmpVo vo) {
		// TODO Auto-generated method stub
		String division = vo.getDivision();
		
		if(division.equals("1") || division.equals("1") || division.equals("3") || division.equals("7") || division.equals("9") || division.equals("10") || division.equals("12"))
			vo.setOffice("0");
		else
			vo.setOffice("1");
	}

}
