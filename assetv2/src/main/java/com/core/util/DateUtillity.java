package com.core.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtillity {

	public static String yearsInput(String date,String category) {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date d = null;
		try {
			d = format.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(d);
		if(category.equals("0"))
			cal.add(Calendar.YEAR, 5);
		else if(category.equals("1"))
			cal.add(Calendar.YEAR, 8);
		
		return cal.get(Calendar.YEAR)+"";
		
	}
}
