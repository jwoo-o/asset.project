package com.core.util;

import java.util.regex.Pattern;

import com.emp.vo.EmpVo;

public class OfficeUtility {

	public static void input(EmpVo vo) throws Exception {
		// TODO Auto-generated method stub
		String seat = vo.getSeat();
		Pattern p = Pattern.compile("^[n]");
		if(p.equals(seat)) {
			StringBuilder build = new StringBuilder(seat);
			build.delete(seat.length()-4, seat.length());
			vo.setOffice(build.toString());
		}
	}

}
