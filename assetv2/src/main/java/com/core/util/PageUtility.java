package com.core.util;

import com.emp.vo.SearchDto;

public class PageUtility {

	public static void calc(SearchDto dto) {
		// TODO Auto-generated method stub
		
		dto.setPage((dto.getPage()-1)*dto.getLimit());
		
	}

	
}
