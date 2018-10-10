package com.core.util;

import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.builder.BuilderException;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.web.servlet.view.AbstractView;

public abstract class AbstractExcelPOIView extends AbstractView {
	
	
	private static final String CONTENT_TYPE_XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
	
	public AbstractExcelPOIView() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected boolean generatesDownloadContent() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	protected final void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		Workbook workbook = createWorkbook();
		
		setContentType(CONTENT_TYPE_XLSX);
		
		buildExcelDocument(model, workbook, request, response);
		
		response.setContentType(getContentType());
		
		ServletOutputStream out = response.getOutputStream();
		out.flush();
		workbook.write(out);
		out.flush();
		if(workbook instanceof SXSSFWorkbook) {
			((SXSSFWorkbook) workbook).dispose();
		}
	
	}

	protected abstract Workbook createWorkbook();
		// TODO Auto-generated method stub

	protected abstract void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request, HttpServletResponse response);
}
