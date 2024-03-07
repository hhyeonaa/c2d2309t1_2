package com.team.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFFont;
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
		response.setHeader("Content-Disposition", "attachment;filename=newfile.xlsx");  //파일이름지정.
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
		CellStyle fontRed = fontRed(wb);
		
		List<String> head = Arrays.asList(param.get("head").split(",")); 
		List<String> colNames = Arrays.asList(param.get("colName").split(","));
		
		// 시트 크기 조절
		for(int i=0; i < head.size(); i++) {
			sheet.setColumnWidth(i, 8800);
		}
		
		
		// 내용 넣기
		sheet.addMergedRegion(new CellRangeAddress( 0, 0, 0, head.size()-1 ));
		row = sheet.createRow(0);
		cell = row.createCell(0);
		cell.setCellStyle(fontRed);
		cell.setCellValue("예시 삭제 후 사용해 주세요.");
		
		row = sheet.createRow(1);
		for(int i=0; i < head.size(); i++) {
			cell = row.createCell(i);
			
			// 스타일 적용
			cell.setCellStyle(headStyle);
			
			String value = head.get(i);
			String colName = colNames.get(i);
			if(value.contains("상태") || value.contains("여부")) {
				value += "(0 / 1)";
			}
			value += " ["+colName+"]";
			cell.setCellValue(value);
		}
		
		row = sheet.createRow(2);
		for(int i=0; i < head.size(); i++) {
			cell = row.createCell(i);

			String value = head.get(i);
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
	
	// 업로드 (Excel Upload)
	public Map<String, Object> eul(MultipartFile file) {
		Map<String, Object> uploadData = new HashMap<String, Object>();
		
		try {
			OPCPackage opcPackage = OPCPackage.open(file.getInputStream()); // 파일 열기
			wb = new XSSFWorkbook(opcPackage); // 해당 파일 워크북
			
			sheet = wb.getSheetAt(0); // 첫번째 시트
			
			int rows = sheet.getPhysicalNumberOfRows(); // 시트 row 가져오기
			
			List<String> colNames = new ArrayList<String>();
			List<List<String>> datas = new ArrayList<List<String>>();
			for(int i=1; i < rows; i++) {
				row = sheet.getRow(i);
				if(row != null) {
					int cells = row.getPhysicalNumberOfCells();
					if(i == 1) {
						for(int j=0; j < cells; j++) {
							String cellVal = row.getCell(j).toString();
							String colName = cellVal.substring(cellVal.indexOf("[")+1, cellVal.indexOf("]"));
							colNames.add(colName);
						}
						uploadData.put("colNames", colNames);
					}
					else if (cells != 0) {
						// Map<String, String> data = new HashMap<String, String>();
						List<String> data = new ArrayList<String>();
						String value;
						for(int j=0; j < cells; j++) {
							cell = row.getCell(j);
							if(cell == null) continue;
							else {
								value = cellReader(cell);
								data.add(value);
								// data.put(colNames.get(j), value);
							}
						}
						datas.add(data);
					}
				}
			}
			uploadData.put("datas", datas);
			
		} catch (InvalidFormatException | IOException e) {
			e.printStackTrace();
		}
		
		return uploadData;
	}
	
	// 셀 판단
	private static String cellReader(XSSFCell cell) {
		String value = null;
		switch (cell.getCellTypeEnum()) {
		case FORMULA:
			value = cell.getCellFormula();
			break;
		case NUMERIC:
			value = Integer.toString((int)cell.getNumericCellValue());
			break;
		case STRING:
			value = cell.getStringCellValue();
			break;
		case BOOLEAN:
			value = Boolean.toString(cell.getBooleanCellValue());
			break;
		case ERROR:
			value = cell.getErrorCellString();
			break;
		}
		return value;
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
