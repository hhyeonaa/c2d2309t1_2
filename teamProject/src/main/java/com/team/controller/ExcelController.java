package com.team.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.ExcelService;
import com.team.util.Excel;
import com.team.util.ToastUI;
import com.team.util.UploadExcel;

@Controller
public class ExcelController {
	
	@Inject
	private ExcelService excelService;
	
	@GetMapping("edl")
	public void edl (HttpServletResponse response) throws IOException {
		Excel excel = new Excel();
		
		List<Map<String, String>> data = excelService.selectData();
		System.out.println(data);
		excel.edl(excel.createSheet(data), response);
	} // Excel
	
	@GetMapping("eultest")
	@ResponseBody
	public ResponseEntity<?> eul(@RequestParam Map<String, String> param, HttpServletRequest request) {
		UploadExcel excel = new UploadExcel();
		return ToastUI.resourceData(param, excel.test1(request));
	}
	
	
}
