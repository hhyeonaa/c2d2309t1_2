package com.team.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.service.ExcelService;
import com.team.util.Excel;

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
	
}
