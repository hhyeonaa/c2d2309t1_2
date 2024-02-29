package com.team.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

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
	
	public XSSFWorkbook createSheet(List<Map<String, String>> data) {
		wb = new XSSFWorkbook();
		sheet = wb.createSheet();
		
		rowCount = 0;
		cellCount = 0;
		
		// 스타일 지정
		CellStyle headStyle = excelHeadStyle(wb);
		CellStyle bodyStyle = excelBodyStyle(wb);
		
		// 내용 넣기
		for(int i=0; i < data.size(); i++) {
			row = sheet.createRow(i);
			String[] innerData = data.get(i).get("DATA").split("\\|");
			System.out.println(Arrays.toString(innerData));
			for(int j=0; j < innerData.length; j++) {
				cell = row.createCell(j);
				
				// 스타일 적용
				if(i == 0) 	{ cell.setCellStyle(headStyle); }
				else 		{ cell.setCellStyle(bodyStyle); }
				
				cell.setCellValue(innerData[j]);
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
