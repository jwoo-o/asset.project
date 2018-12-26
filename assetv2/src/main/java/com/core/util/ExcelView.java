package com.core.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.asset.vo.AssetDownDto;
import com.asset.vo.AssetViewDto;

public class ExcelView extends AbstractExcelPOIView{
	
	@Override
	protected Workbook createWorkbook() {
		// TODO Auto-generated method stub
		return new XSSFWorkbook();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		List<AssetDownDto> list = (List<AssetDownDto>) model.get("list");
		
		Sheet sheet = workbook.createSheet("asset");
		Row row = null;
		int rowCount = 0;
		int cellCount = 0;
		
		row = sheet.createRow(rowCount++);
		
		row.createCell(cellCount++).setCellValue("자산번호");
		row.createCell(cellCount++).setCellValue("종류");
		row.createCell(cellCount++).setCellValue("상태");
		row.createCell(cellCount++).setCellValue("모델명");
		row.createCell(cellCount++).setCellValue("시리얼번호");
		row.createCell(cellCount++).setCellValue("사용자");
		row.createCell(cellCount++).setCellValue("직위");
		row.createCell(cellCount++).setCellValue("부서");
		row.createCell(cellCount++).setCellValue("구매일");
		row.createCell(cellCount++).setCellValue("모니터크기");
		row.createCell(cellCount++).setCellValue("가격");
		row.createCell(cellCount++).setCellValue("참고");
		
		for (AssetDownDto dto : list) {
			row = sheet.createRow(rowCount++);
			cellCount = 0;
			row.createCell(cellCount++).setCellValue(dto.getAssetNo());
			row.createCell(cellCount++).setCellValue(dto.getCategory());
			row.createCell(cellCount++).setCellValue(dto.getStatus());
			row.createCell(cellCount++).setCellValue(dto.getModelNm());
			row.createCell(cellCount++).setCellValue(dto.getSerialNo());
			row.createCell(cellCount++).setCellValue(dto.getUserName());
			row.createCell(cellCount++).setCellValue(dto.getPosition());
			row.createCell(cellCount++).setCellValue(dto.getDivision());
			row.createCell(cellCount++).setCellValue(dto.getBuying());
			row.createCell(cellCount++).setCellValue(dto.getmInch());
			row.createCell(cellCount++).setCellValue(dto.getPrice());
			row.createCell(cellCount++).setCellValue(dto.getNote());
		}
	}
}
