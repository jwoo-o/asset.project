package com.core.util;



import com.emp.vo.EmpVo;

public class OfficeUtility {

	
	public static void input(EmpVo vo) throws Exception {
		// TODO Auto-generated method stub
		String seat = vo.getSeat();
		
		if(seat.contains("n3") || seat.contains("n13")) {
			StringBuilder build = new StringBuilder(seat);
			build.delete(seat.length()-4, seat.length());
			vo.setOffice(build+"");
		}
	}
	

}
