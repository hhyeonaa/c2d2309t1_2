package com.team.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.expr.Instanceof;
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
	
	
	// 03.05 추가해야할 사항
	//	[엑셀 업로드]
	//	- 양식 다운로드는 db에서 (pk 제외)
	//	- pk코드 테이블 따로 빼기
	//	- 유효성 검사는 x
	
	//	[엑셀 다운로드]
	// 	- 엑셀 다운로드 구현
	//	- 필터는 추후 고민
	
	
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
	
	// 업로드 양식 생성
	public XSSFWorkbook createFormSheet(Map<String, String> COLUMN_NAME) {
		System.out.println(COLUMN_NAME);
		
		List<String> colNames = Arrays.asList(COLUMN_NAME.get("COLUMN_NAME").split(","));
		
		wb = new XSSFWorkbook();
		sheet = wb.createSheet();
		
		rowCount = 0;
		cellCount = 0;
		
		// 스타일 지정
		CellStyle headStyle = excelHeadStyle(wb);
		CellStyle fontRed = fontRed(wb);
		
		// 시트 크기 조절
		for(int i=0; i < colNames.size(); i++) {
			sheet.setColumnWidth(i, 6000);
		}
		
		
		// 내용 넣기
		sheet.addMergedRegion(new CellRangeAddress( 0, 0, 0, colNames.size()-1 ));
		row = sheet.createRow(0);
		cell = row.createCell(0);
		cell.setCellStyle(fontRed);
		cell.setCellValue("예시 삭제 후 사용해 주세요.");
		
		row = sheet.createRow(1);
		for(int i=0; i < colNames.size(); i++) {
			cell = row.createCell(i);
			
			// 스타일 적용
			cell.setCellStyle(headStyle);
			
			String colName = colNames.get(i);
			cell.setCellValue(colName);
		}
		
		row = sheet.createRow(2);
		for(int i=0; i < colNames.size(); i++) {
			cell = row.createCell(i);

			String value = colNames.get(i);
			if(value.contains("상태") || value.contains("여부")) {
				cell.setCellValue("ex) 0 = 'NO' / 1 = 'Yes'");
			} else if(value.contains("_NAME")) {
				cell.setCellValue("ex) 홍길동");
			} else if(value.contains("_DATE") || value.contains("_TIME") || value.contains("_UPDATE")) {
				cell.setCellValue("ex) 20240311232846 : 년월일시분초");
			} else if(value.contains("ACTIVE") || value.contains("HIDE")) {
				cell.setCellValue("ex) 0(No) OR 1(Yes)");
			}
		}
		
		return wb;
	}
	
	// 엑셀 생성
	public XSSFWorkbook createDataSheet(Map<String, Object> dlData) {
		System.out.println(dlData);
		
		Map<String, List<String>> header = (Map<String, List<String>>) dlData.get("header");
		Map<String, List<String>> body = (Map<String, List<String>>) dlData.get("body");
		
		List<String> title = header.get("title");
		List<String> colName = header.get("colName");
		
		System.out.println("header : " + header);
		System.out.println("body : " + body);
		
		
		wb = new XSSFWorkbook();
		sheet = wb.createSheet();
		
		// 스타일 지정
		CellStyle headStyle = excelHeadStyle(wb);
		CellStyle fontRed = fontRed(wb);
		
		// 시트 크기 조절
		for(int i=0; i < title.size(); i++) {
			sheet.setColumnWidth(i, 6000);
		}
		
		rowCount = 0;
		cellCount = 0;
		
		// 헤더 넣기
		row = sheet.createRow(rowCount);
		rowCount++;
		for(int i=0; i < title.size(); i++) {
			cell = row.createCell(cellCount);
			cellCount++;
			
			// 스타일 적용
			cell.setCellStyle(headStyle);
			
			String tit = title.get(i);
			String cn = colName.get(i);
			cell.setCellValue(tit+"["+cn+"]");
		}
		
		for(int i=0; i < body.size(); i++) {
			row = sheet.createRow(rowCount);
			rowCount++;
			
			List<String> cellDatas = body.get("row"+i);
			cellCount = 0;
			for(int j = 0 ; j < cellDatas.size() ; j++) {
				cell = row.createCell(cellCount);
				cellCount++;
				
				cell.setCellValue(cellDatas.get(j));
			}
		}
		
		return wb;
	}
	
	// 업로드 (Excel Upload)
	public List<Map<String, String>> eul(MultipartFile file) {
		List<Map<String, String>> uploadData = new ArrayList<Map<String, String>>();
		
		try {
			OPCPackage opcPackage = OPCPackage.open(file.getInputStream()); // 파일 열기
			wb = new XSSFWorkbook(opcPackage); // 해당 파일 워크북
			
			sheet = wb.getSheetAt(0); // 첫번째 시트
			
			int rows = sheet.getPhysicalNumberOfRows(); // 시트 row 가져오기
			
			List<String> colNames = new ArrayList<String>();
			for(int i=1; i < rows; i++) {
				row = sheet.getRow(i);
				if(row != null) {
					int cells = row.getPhysicalNumberOfCells();
					if(i == 1) {
						for(int j=0; j < cells; j++) {
							String cellVal = row.getCell(j).toString();
							colNames.add(cellVal);
						}
					} else if (cells != 0) {
						Map<String, String> datas = new HashMap<String, String>();
						String value;
						for(int j=0; j < cells; j++) {
							cell = row.getCell(j);
							if(cell == null) {
								continue;
							} else {
								value = cellReader(cell);
								datas.put(colNames.get(j) ,value);
							}
						}
						uploadData.add(datas);
					}
				}
			}
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
