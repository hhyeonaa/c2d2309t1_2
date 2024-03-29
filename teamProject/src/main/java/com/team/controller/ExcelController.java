package com.team.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.MultiValuedMap;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.team.service.ExcelService;
import com.team.util.Excel;
import com.team.util.ToastUI;
import com.team.util.UploadExcel;

@Controller
@RequestMapping("/excel/*")
public class ExcelController {
	
	@Inject
	private ExcelService excelService;
	Excel excel = new Excel();
	Gson gson = new Gson();
	
	@GetMapping("formExcelDL")
	public void formExcelDL (@RequestParam Map<String,String> param, HttpServletResponse response) throws IOException {
		
		if(param.containsKey("dlData")){
			excel.edl(excel.createDataSheet(gson.fromJson(param.get("dlData"), new TypeToken<Map<String, Object>>(){}.getType())), response);
		};
		
		if(param.containsKey("tableName")){
			excel.edl(excel.createFormSheet(excelService.getfieldName(param)), response);
		};
		
	} // formExcelDL
	
	@PostMapping("excelUpload")
	public ResponseEntity<?> excelUpload (
			@RequestParam(value="fileInput") MultipartFile file,
			@RequestParam(value="tableName") String tableName) {
		
		List<Map<String, String>> uploadData = excel.eul(file);
		
		Map<String, Object> insertData = new HashMap<String, Object>();
		insertData.put("tableName", tableName);
		insertData.put("uploadData", uploadData);
		
		return  ResponseEntity.ok().body(excelService.insertData(insertData));
	}
	
	
	
	@GetMapping("eultest")
	@ResponseBody
	public ResponseEntity<?> eul(@RequestParam Map<String, String> param, HttpServletRequest request) {
		UploadExcel excel = new UploadExcel();
		return ToastUI.resourceData(param, excel.test1(request));
	}
	
	
}
