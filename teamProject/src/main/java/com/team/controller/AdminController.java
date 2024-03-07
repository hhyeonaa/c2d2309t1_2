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

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.AdminService;
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
		model.addAttribute("mapList", adminService.getAdminList());
		return "admin/manager";
	}
 	@GetMapping("/managerPro")
 	@ResponseBody
 	public ResponseEntity<?> readManager(@RequestParam Map<String, String> req){
 		List<Map<String, String>> mapList = adminService.getAdminList();
 		return ToastUI.resourceData(req, mapList);
 	}
 	@PutMapping("/managerPro")
 	@ResponseBody
 	public ResponseEntity<?> updateManager(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
 		
 		System.out.println(result);
 		return null;
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
	
	@PostMapping("/deletePro")
	public String deletePro(@RequestParam String AD_NO) {
		adminService.adminDelete(AD_NO);
		return "1";
	}
	
	@PostMapping("/updatePro")
	public void updatePro(@RequestParam Map<String, String> map) {
		adminService.adminUpdate(map);
	}
	
	@GetMapping("/board")
	public String board(@RequestParam Map<String, String> map, Model model) {
		List<Map<String, String>> mapList = adminService.getBoardList();
		model.addAttribute("mapList", mapList);
		List<Map<String, String>> formList = adminService.getForm(map);
		System.out.println("리스트: " + formList.toString());
		model.addAttribute("formList", formList);
		return "admin/board";
	}
	
 	@GetMapping("/boardList")
 	@ResponseBody
 	public ResponseEntity<?> boardList(@RequestParam Map<String, String> req){
 		List<Map<String, String>> mapList = adminService.getBoardList();
 		System.out.println(mapList);
 		return ToastUI.resourceData(req, mapList);
 	}
	
	@PostMapping("/displayUpdate")
	@ResponseBody
	public ResponseEntity<?> displayUpdate(@RequestBody List<Map<String, String>> requestBody) {
		List<Map<String, String>> arrList = requestBody;
	    for (Map<String, String> entry : arrList) {
	        adminService.displayUpdate(entry);
	        System.out.println(entry);
	    }
		return ResponseEntity.ok().body(arrList);
	}
	
	@GetMapping("/category")
	public String category(Model model) {
		List<Map<String, String>> mapList = adminService.getCategoryList();
		model.addAttribute("mapList", mapList);
		return "admin/category";
	}
	
 	@GetMapping("/categoryList")
 	@ResponseBody
 	public ResponseEntity<?> categoryList(@RequestParam Map<String, String> req){
 		List<Map<String, String>> mapList = adminService.getCategoryList();
 		System.out.println(mapList);
 		return ToastUI.resourceData(req, mapList);
 	}
 	
	@GetMapping("/inputForm")
	public String inputForm(Model model, HttpSession session) {
		model.addAttribute("menu", codeService.selectCodeList(EnumCodeType.메뉴항목, session));
		model.addAttribute("productStatus",codeService.selectCodeList(EnumCodeType.상품상태, session));
		model.addAttribute("trade", codeService.selectCodeList(EnumCodeType.거래상태, session));
		return "admin/inputForm";
	}
	
	@PostMapping("/inputFormPro")
//	@ResponseBody
	public String inputFormPro(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("MEM_ID: " + (String)session.getAttribute("MEM_ID"));
		map.put("MEM_ID", (String)session.getAttribute("MEM_ID"));
		System.out.println("map : " + map.entrySet());
		adminService.inputForm(map);
		return "admin/inputFormPro";
	}
	
	@GetMapping("/getForm")
	@ResponseBody
	public ResponseEntity<?> getForm(@RequestParam Map<String, String> map) {
		List<Map<String, String>> formList = adminService.getForm(map);
		for (Map<String, String> code : formList) {
			String codeValue = code.get("CODE");
			code.put("formName", codeValue.split("/")[0]);
			code.put("formID", codeValue.split("/")[1]);
		}
		System.out.println("리스트: " + formList.toString());
		return ResponseEntity.ok().body(formList);

	}
	
	
	/* 현아 작업공간 */
	
	/* 무창 작업공간 */
	@GetMapping("/message_manage")
	public String message_manage(Model model, HttpSession session) {
		
		return "admin/message_manage";
	}
	
	@GetMapping("/message_managePro")
	@ResponseBody
	public ResponseEntity<?> message_managePro(@RequestParam Map<String, String> param, HttpSession session) {
		return ToastUI.resourceData(param, codeService.selectMessageList(EnumCodeType.메세지, session));
	}
	
	@GetMapping("/code_manage")
	public String code_manage(Model model) {
		Map<String, String> existingData = new HashMap<String, String>();
		existingData.put(EnumCodeType.코드내용.getType(), EnumCodeType.메뉴항목.getType());
		
		model.addAllAttributes(existingData);
		model.addAttribute("typeList", EnumCodeType.전체코드타입.getCodeKeyList());
		return "admin/code_manage";
	}
	
	@GetMapping("/codePro")
 	@ResponseBody
 	public ResponseEntity<?> codePro(@RequestParam Map<String, String> param, HttpSession session){
		List<Map<String, String>> data = codeService.selectCodeList(
				EnumCodeType.코드내용.stringToEnumType(param.get("param")), session);
 		return ToastUI.resourceData(param, data);
 	}
	
	@GetMapping("/logout")
	public void logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		session.invalidate();
		codeService.submitForAlert(response, "AM3", new Object[]{"로그아웃"}, request.getContextPath());
	}
	
	/* 무창 작업공간 */
	
	/* 성엽 작업공간 */
	
	@GetMapping("/chart")
	public String chart() {
		return "admin/chart";
	}//
	
	@GetMapping("/member_report")
	public String member_report(Model model) {
		
		List<Map<String, String>> reportList = adminService.getReportList();
		
		model.addAttribute("reportList", reportList);
		
		return "admin/member_report";
	}//
	
	// 채팅만들어지고 이동
	@GetMapping("/member_report_test")
	public String member_report_test(Model model) {
		
		List<Map<String, String>> reportList = adminService.getReportList();
		
		model.addAttribute("reportList", reportList);
		
		return "redirect:admin/member_report";
	}//
	
	@GetMapping("/member_manage")
	public String member_manage(Model model) {
		
		List<Map<String, String>> memList = adminService.getMemberList();
		
		model.addAttribute("memList", memList);
		
		return "admin/member_manage";
	}//
	
	@GetMapping("/memberStop")
	public String stop(@RequestParam String MEM_NO) {
		
		adminService.memberStop(MEM_NO);
		
		return "redirect:/admin/member_manage";
	}//
	
	@GetMapping("/memberDelete")
	public String delete(@RequestParam String MEM_NO) {
		
		adminService.memberDelete(MEM_NO);
		
		return "redirect:/admin/member_manage";
	}//
	
	@GetMapping("/contentDelete")
	public String contentDelete(@RequestParam String PRO_NO) {
		
		adminService.contentDelete(PRO_NO);
		
		return "redirect:/admin/board_content";
	}//
	
	@GetMapping("/content_Delete")
	@ResponseBody
	public ResponseEntity<?> content_Delete(@RequestParam String PRO_NO) {
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("result", Integer.toString(adminService.cateContentDelete(PRO_NO)));
		
		return ResponseEntity.ok().body(result);
	}//
	
	@GetMapping("/board_content")
	public String board_content(Model model) {
		
		List<Map<String, String>> contentList = adminService.getContentboardList();
		
		model.addAttribute("contentList", contentList);
		
		return "admin/board_content";
	}//
	
	@GetMapping("/board_category")
 	@ResponseBody
 	public ResponseEntity<?> board_category(@RequestParam Map<String, String> param){
		
 		List<Map<String, String>> cateList = adminService.getBoardCategoryList(param);
 		
 		return ResponseEntity.ok().body(cateList);
 	}//
	
	/* 성엽 작업공간 */	



}
