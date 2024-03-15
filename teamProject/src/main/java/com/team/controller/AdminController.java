package com.team.controller;


import java.io.Console;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.AdminService;
import com.team.service.BoardService;
import com.team.service.TeamCodeService;
import com.team.util.EnumCodeType;
import com.team.util.JsonUtils;
import com.team.util.ToastUI;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject 
	private TeamCodeService codeService;
	@Inject
	private AdminService adminService;
	
	
	/* 현아 작업공간 */
	@GetMapping("/manager")
	public String manager(Model model) {
//		model.addAttribute("mapList", adminService.getAdminList());
		return "admin/manager";
	}
	
	@PostMapping("/managerPro") // CREATE
 	@ResponseBody
 	public ResponseEntity<?> createManager(@RequestBody String createdRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(createdRows);
 		return null;
 	}
	
 	@GetMapping("/managerPro") // READ
 	@ResponseBody
 	public ResponseEntity<?> readManager(@RequestParam Map<String, String> req, HttpSession session){
 		req.put("RO_NUM", session.getAttribute("MEM_ID").toString());
 		System.out.println("!@#!@# " + req);
 		List<Map<String, String>> mapList = adminService.getAdminList(req);
 		return ToastUI.resourceData(req, mapList);
 	}
 	
 	@PutMapping("/managerPro") // UPDATE
 	@ResponseBody
 	public ResponseEntity<?> updateManager(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
		 result.forEach(row -> {
			adminService.adminUpdate(row);
 	    });
 		return ResponseEntity.ok().build();
 	}
 	
 	@DeleteMapping("/managerPro") // DELETE
 	@ResponseBody
 	public ResponseEntity<?> deleteManager(@RequestParam Map<String, String> deletedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(deletedRows);
 	    result.forEach(row -> {
 	        adminService.adminDelete(row);
 	    });
 	    return ResponseEntity.ok().build();
 	}
	
	@PostMapping("/insertPro")
	public String insertPro(@RequestParam Map<String, String> map, HttpServletResponse response) {
		boolean check = adminService.idCheck(map);
		if(check) {
			return null;
		} else {
			adminService.adminInsert(map);
			return "redirect:/admin/manager";
		}
	}
	
	@GetMapping("/board")
	public String board(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		model.addAttribute("menu", codeService.selectCodeList(EnumCodeType.메뉴항목, session));
		model.addAttribute("form", codeService.selectCodeList(EnumCodeType.입력폼항목, session));
		return "admin/board";
	}
	
 	@GetMapping("/boardPro")
 	@ResponseBody
 	public ResponseEntity<?> readBoard(@RequestParam Map<String, String> req, HttpSession session) {
 		List<Map<String, String>> mapList = codeService.selectCodeList(EnumCodeType.메뉴항목, session);
 		return ToastUI.resourceData(req, mapList);
 	}
 	
 	@PutMapping("/boardPro")
 	@ResponseBody
 	public ResponseEntity<?> updateBoard(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
 		System.out.println(result);
        adminService.displayUpdate(result);
 		return null;
 	}

	@GetMapping("/category")
	public String category(Model model, HttpSession session) {
		Map<String, String> existingData = new HashMap<String, String>();
		existingData.put(EnumCodeType.코드내용.getType(), EnumCodeType.메뉴항목.getType());
		model.addAllAttributes(existingData);
		model.addAttribute("keyList", EnumCodeType.전체코드타입.getKeyList());
		model.addAttribute("valueList", EnumCodeType.전체코드타입.getValueList());
		
		model.addAttribute("category", codeService.selectCodeList(EnumCodeType.카테고리항목, session));
		return "admin/category";
	}
	
 	@GetMapping("/categoryPro")
 	@ResponseBody
 	public ResponseEntity<?> readCategory(@RequestParam Map<String, String> param, HttpSession session){
		List<Map<String, String>> mapList = codeService.selectCodeList(
				EnumCodeType.코드내용.stringToEnumType(param.get("param")), session);
 		return ToastUI.resourceData(param, mapList);
 	}
 	
 	@PutMapping("/categoryPro")
 	@ResponseBody
 	public ResponseEntity<?> updateCategory(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
 		System.out.println(result);
 		List<Map<String, String>> newData = new ArrayList<Map<String, String>>();
 		result.forEach(t -> {
			Map<String, String> currentData = new HashMap<String, String>();
			currentData.put(EnumCodeType.코드번호.getType(), t.get(EnumCodeType.코드번호.getType()));
			currentData.put(EnumCodeType.코드타입.getType(), t.get(EnumCodeType.코드타입.getType()));
			newData.add(currentData);
		});
		adminService.displayUpdate(result);
 		return null;
 	}
	
	/* 현아 작업공간 */
	
	/* 무창 작업공간 */
	
//	----- 메세지 페이지 -----
	
	@GetMapping("/message_manage")
	public String message_manage(Model model, HttpSession session) {
		model.addAttribute("CODE_TYPE", EnumCodeType.메세지.getType());
		return "admin/message_manage";
	}
	
	@GetMapping("/message_managePro")
	@ResponseBody
	public ResponseEntity<?> selectMessage(@RequestParam Map<String, String> param, HttpSession session) {
		return ToastUI.resourceData(param, codeService.selectMessageList(EnumCodeType.메세지, session));
	}
	
	@PostMapping("/codeInsertPro")
	@ResponseBody
	public ResponseEntity<?> codeInsertPro(@RequestParam Map<String, String> param) {
 		boolean isInsert = adminService.messageInsert(param);
 		return ResponseEntity.ok().body(isInsert);
	}
	
	@PutMapping("/message_managePro")
	@ResponseBody
	public ResponseEntity<?> updateMessage(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
 		adminService.messageUpdate(result);
 		return null;
	}
	
	@DeleteMapping("/message_managePro")
	@ResponseBody
	public ResponseEntity<?> deleteMessage(@RequestParam Map<String, String> deletedRows) {
		List<Map<String, String>> result = ToastUI.getRealData(deletedRows);
 		adminService.messageDelete(result);
 		return null;
	}
	
//	----- 공동코드 페이지 -----
	
	@GetMapping("/code_manage")
	public String code_manage(Model model) {
		Map<String, String> existingData = new HashMap<String, String>();
		existingData.put(EnumCodeType.코드내용.getType(), EnumCodeType.메뉴항목.getType());
		model.addAllAttributes(existingData);
		model.addAttribute("keyList", EnumCodeType.전체코드타입.getKeyList());
		model.addAttribute("valueList", EnumCodeType.전체코드타입.getValueList());

		return "admin/code_manage";
	}
	
	@GetMapping("/codePro")//	get
 	@ResponseBody
 	public ResponseEntity<?> getCodePro(@RequestParam Map<String, String> param, HttpSession session){
		List<Map<String, String>> data = codeService.selectCodeList(
				EnumCodeType.코드내용.stringToEnumType(param.get("param")), session);

		return ToastUI.resourceData(param, data);
 	}
	
	@PostMapping("/codeListInsertPro")//	post
 	@ResponseBody
 	public ResponseEntity<?> insertCodePro(@RequestParam Map<String, String> param) {
		System.out.println(param);
 		boolean isInsert = adminService.codeInsert(param);
 		return ResponseEntity.ok().body(isInsert);
 	}
	
	@PutMapping("/codePro")	//	put
 	@ResponseBody
 	public ResponseEntity<?> updateCodePro(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
 		List<Map<String, String>> newData = new ArrayList<Map<String, String>>();
 		
 		result.forEach(t -> {
 			Map<String, String> currentData = new HashMap<String, String>();
 			currentData.put(EnumCodeType.코드번호.getType(), t.get(EnumCodeType.코드번호.getType()));
 			currentData.put(EnumCodeType.코드타입.getType(), t.get(EnumCodeType.코드타입.getType()));
 			newData.add(currentData);
 		});
 		
 		List<Map<String, String>> datas = adminService.codeSelect(newData);
 		for(int i = 0; i < result.size(); i++) {
 			result.get(i).put("ACTIVE", datas.get(i).get("ACTIVE"));
 		}
 		adminService.codeUpdate(result);
 		
 		return null;
 	}
	
	@DeleteMapping("/codePro")	//	delete
 	@ResponseBody
 	public ResponseEntity<?> deleteCodePro(@RequestParam Map<String, String> deletedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(deletedRows);

 		adminService.codeDelete(result);
 		return null;
 	}
	
//	----- 로그아웃 -----
	
	@GetMapping("/logout")
	public void logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		session.invalidate();
		codeService.submitForAlert(response, "AM3", new Object[]{"로그아웃"}, request.getContextPath());
	}
	
//	----- 테스트 페이지 -----
	
	@GetMapping("/drawing")
	public String drawing() {
		return "admin/drawing";
	}
	
	/* 무창 작업공간 */
	
	/* 성엽 작업공간 */
	
	// 차트 이동
	@GetMapping("/chart")
	public String chart() {
		return "admin/chart";
	}
	
	@GetMapping("/member_report")
	public String member_report(Model model) {
		
		List<Map<String, String>> reportList = adminService.getReportList();
		
		model.addAttribute("reportList", reportList);
		
		return "admin/member_report";
	}
	
	@GetMapping("/member_reportPro") // READ
 	@ResponseBody
 	public ResponseEntity<?> member_reportPro(@RequestParam Map<String, String> req){
 		List<Map<String, String>> reportList = adminService.getReportList();
 		return ToastUI.resourceData(req, reportList);
 	}
	
	@GetMapping("/member_manage")
	public String member_manage() {
		
		return "admin/member_manage";
	}
	
	@GetMapping("/member_managePro") // READ
 	@ResponseBody
 	public ResponseEntity<?> select_member_managePro(@RequestParam Map<String, String> req){
 		List<Map<String, String>> mapList = adminService.getMemberList();
 		return ToastUI.resourceData(req, mapList);
 	}
	
	@PutMapping("/member_managePro") // READ
 	@ResponseBody
 	public ResponseEntity<?> update_member_managePro(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
 		adminService.memberStop(result);
 		return null;
	}
	
	@GetMapping("/cateContentDelete")
	@ResponseBody
	public ResponseEntity<?> cateContentDelete(@RequestParam String PRO_NO) {
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("result", Integer.toString(adminService.cateContentDelete(PRO_NO)));
		
		return ResponseEntity.ok().body(result);
	}
	
	@GetMapping("/board_content")
	public String board_content(Model model) {
		
		List<Map<String, String>> contentList = adminService.getContentboardList();
		
		model.addAttribute("contentList", contentList);
		
		return "admin/board_content";
	}
	
	@GetMapping("/board_contentPro") // READ
 	@ResponseBody
 	public ResponseEntity<?> select_board_contentPro(@RequestParam Map<String, String> req, HttpSession session){
 		List<Map<String, String>> contentList = adminService.getContentboardList();
 		return ToastUI.resourceData(req, contentList);
 	}
	
	@PutMapping("/board_contentPro") // READ
 	@ResponseBody
 	public ResponseEntity<?> delete_board_contentPro(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
 		System.out.println(result);
 		adminService.boardUpdate(result);
 		return null;
 	}
	
	// chart
	@GetMapping("/getChartData")
 	@ResponseBody
 	public ResponseEntity<?> getChartData(@RequestParam Map<String, String> param){
		
		Map<String, List> map = new HashMap<String, List>();
 		List<Map<String, String>> memList = adminService.getMemberCntList(param);
 		List<Map<String, String>> cateList = adminService.getCategoryCntList(param);
 		List<Map<String, String>> tradeList = adminService.getTotalTradeList(param);
 		
 		map.put("memList", memList);
 		map.put("cateList", cateList);
 		map.put("tradeList", tradeList);
 		
 		return ResponseEntity.ok().body(map);
 	}
	
	/* 성엽 작업공간 */	


}
