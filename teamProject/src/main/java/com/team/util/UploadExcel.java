package com.team.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class UploadExcel {
	public void test1(HttpServletRequest request) {
		try {
			System.out.println("UploadExcel test1");
			System.out.println("---------------------------");
			OPCPackage opcPackage = OPCPackage.open(new File("C:\\Users\\ITWILL\\Downloads\\COPY_MEMBERS 가이드.xlsx"));
			
			XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
			
			// 시트의 수
			int sheets = workbook.getNumberOfSheets();
			System.out.println("sheets: " + sheets);
			
			List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
			for(int i =0; i < sheets; i++) {
				XSSFSheet sheet = workbook.getSheetAt(i);
				System.out.println("Sheet Name : " + sheet.getSheetName() + "\n");
				
				// row 얻기 : iterator()
				Iterator<Row> rowiterator = sheet.iterator();
				int rowIndex = 0;
				
				List<String> headName = new ArrayList<String>();
				
				while(rowiterator.hasNext()) {
					Row row = rowiterator.next();
					System.out.print(rowIndex + "행 : \n");
					Map<String, String> data = new HashMap<String, String>();
					
					// cell 얻기 : cellIterator
					int cellIndex = 0;
					Iterator<Cell> cellIterator = row.cellIterator();
					while (cellIterator.hasNext()) {
						Cell cell = cellIterator.next();
						
						if(rowIndex == 0) {
							headName.add(cell.getStringCellValue());
						}
						else {
							System.out.println("cellIndex : " + cellIndex);
							switch (cell.getCellTypeEnum()) {
							case BOOLEAN:
								System.out.println("BOOLEAN: " + cell.getBooleanCellValue());
								break;
							case NUMERIC:
								data.put(headName.get(cellIndex), String.format("%.0f", cell.getNumericCellValue()));
								break;
							case STRING:
								data.put(headName.get(cellIndex), cell.getStringCellValue());
								break;
							case FORMULA:
								System.out.println("FORMULA: " + cell.getCellFormula());
								break;
							}
						}
						cellIndex++;
					}
					if(rowIndex != 0) {
						dataList.add(data);
					}
					rowIndex++;
					System.out.println("");
				}
			}
			
			System.out.println(dataList);
			
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
