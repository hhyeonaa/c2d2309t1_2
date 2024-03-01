package com.team.util;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class Excel {
	XSSFWorkbook wb;
	XSSFSheet sheet;
	int rowCount, cellCount;
	XSSFRow row;
	XSSFCell cell;
	
	CellStyle cellStyle;
	
	// 다운로드 (Excel DownLoad)
	public void edl(XSSFWorkbook wb, HttpServletResponse response){
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=newFile.xlsx");  //파일이름지정.
		//response OutputStream에 엑셀 작성
		try {
			wb.write(response.getOutputStream());
			wb.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public XSSFWorkbook createSheet(Map<String, String> param) {
		wb = new XSSFWorkbook();
		sheet = wb.createSheet();
		
		rowCount = 0;
		cellCount = 0;
		
		// 스타일 지정
		CellStyle headStyle = excelHeadStyle(wb);
		CellStyle bodyStyle = excelBodyStyle(wb);
		CellStyle fontRed = fontRed(wb);
		
		List<String> data = Arrays.asList(param.get("head").split(",")); 
		
		// 시트 크기 조절
		for(int i=0; i < data.size(); i++) {
			sheet.setColumnWidth(i, 8800);
		}
		
		
		// 내용 넣기
		sheet.addMergedRegion(new CellRangeAddress( 0, 0, 0, data.size()-1 ));
		row = sheet.createRow(0);
		cell = row.createCell(0);
		cell.setCellStyle(fontRed);
		cell.setCellValue("예시 삭제 후 사용해 주세요.");
		
		row = sheet.createRow(1);
		for(int i=0; i < data.size(); i++) {
			cell = row.createCell(i);
			
			// 스타일 적용
			cell.setCellStyle(headStyle);
			
			String value = data.get(i);
			if(value.contains("상태") || value.contains("여부")) {
				cell.setCellValue(value + "(0 / 1)");
			}
			else {
				cell.setCellValue(value);
			}
		}
		
		row = sheet.createRow(2);
		for(int i=0; i < data.size(); i++) {
			cell = row.createCell(i);

			String value = data.get(i);
			if(value.contains("상태") || value.contains("여부")) {
				cell.setCellValue("0 = 'NO' / 1 = 'Yes'");
			}
			else if(value.contains("이름") || value.charAt(value.length()-1) == '명')  {
				cell.setCellValue("ex) 홍길동");
			}
			else if(value.contains("ID"))  {
				cell.setCellValue("ex) abc321 (영문 소문자, 숫자 조합)");
			}
			
		}
		
		return wb;
	}
	
	// 엑셀 스타일 (헤드)
	public CellStyle excelHeadStyle(XSSFWorkbook wb) {
		cellStyle = wb.createCellStyle();
		
		// 가는 경계선
		cellStyle.setBorderTop(BorderStyle.THIN);
		cellStyle.setBorderBottom(BorderStyle.THIN);
		cellStyle.setBorderRight(BorderStyle.THIN);
		cellStyle.setBorderLeft(BorderStyle.THIN);
		
		// 배경 노란색
		cellStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		return cellStyle;
	}
	
	
	public CellStyle excelBodyStyle(XSSFWorkbook wb) {
		cellStyle = wb.createCellStyle();
		
		// 가는 경계선
		cellStyle.setBorderTop(BorderStyle.THIN);
		cellStyle.setBorderBottom(BorderStyle.THIN);
		cellStyle.setBorderRight(BorderStyle.THIN);
		cellStyle.setBorderLeft(BorderStyle.THIN);
		
		return cellStyle;
	}

	public CellStyle fontRed(XSSFWorkbook wb) {
		cellStyle = wb.createCellStyle();
		XSSFFont fontRed = wb.createFont();
		fontRed.setColor(Font.COLOR_RED);
		fontRed.setBold(true);
		fontRed.setFontHeightInPoints((short)15);
		cellStyle.setFont(fontRed);
		return cellStyle;
	}
	
	// 기본 문법
	public XSSFWorkbook basic() {
		// 워크북 생성
		XSSFWorkbook wb = new XSSFWorkbook(); // 하나의 xslx 파일
		
		// 시트 생성
		XSSFSheet sheet = wb.createSheet("시트명"); //하나의 excel sheet
		
		// row(행), cell(셀) 순서 변경
		int rowCount = 0;
		int cellCount = 0;
		
		// row(행) 생성
		XSSFRow row = sheet.createRow(rowCount++);
		
		// cell(셀) 생성
		XSSFCell cell = row.createCell(cellCount++);
		
		// cell(셀) 값 입력
		cell.setCellValue("값 입력");
		
		return wb;
	}
	
	
	
}
