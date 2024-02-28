package com.team.controller;


import java.io.Console;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.AdminService;
import com.team.service.TeamCodeService;
import com.team.util.EnumCodeType;
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
 	@GetMapping("/managerList")
 	@ResponseBody
 	public ResponseEntity<?> managerList(@RequestParam Map<String, String> req){
 		List<Map<String, String>> mapList = adminService.getAdminList();
 		System.out.println(mapList);
 		return ToastUI.resourceData(req, mapList);
 	}
	
	
	@PostMapping("/insertPro")
	public String insertPro(@RequestParam Map<String, String> map, HttpServletResponse response) {
//		teamService.showCodeList(EnumCodeType.메세지);
//		Object[] arr = {"로그인"};
//		teamService.onlyAlert(response, "AM1", arr);
//		EnumCodeType.메세지.getType() + 1
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
	public String board(Model model) {
		List<Map<String, String>> mapList = adminService.getBoardList();
		model.addAttribute("mapList", mapList);
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
	public void displayUpdate(@RequestParam Map<String, String> map) {
		adminService.displayUpdate(map);
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
	
	/* 현아 작업공간 */
	
	/* 무창 작업공간 */
	@GetMapping("/message_manage")
	public String message_manage(Model model) {
		
		codeService.selectCodeList(EnumCodeType.메세지, true);
		
		
		codeService.selectCodeList(EnumCodeType.메세지);
		
		return "admin/message_manage";
	}
	
	@GetMapping("/category_manage")
	public String category_manage(Model model) {
		model.addAllAttributes(codeService.selectCodeList(EnumCodeType.카테고리항목, true));
		return "admin/category_manage";
	}
	
	@GetMapping("/category_pro")
	public void category_pro(HttpServletResponse response) {
		Object[] arr = {"잘가요"};
	}
	
	@GetMapping("/trade_manage")
	public String trade_manage() {
		return "admin/trade_manage";
	}
	
	@GetMapping("/declare_manage")
	public String declare_manage() {
		return "admin/declare_manage";
	}
	
	@GetMapping("/price_manage")
	public String price_manage() {
		return "admin/price_manage";
	}
	/* 무창 작업공간 */
	
	/* 성엽 작업공간 */
	
	@GetMapping("/chart")
	public String chart() {
		return "admin/chart";
	}//
	
	@GetMapping("/member_manage")
	public String member_manage(Model model) {
		
		List<Map<String, String>> memList = adminService.getMemberList();
		
		model.addAttribute("memList", memList);
		
		return "admin/member_manage";
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
		result.put("result", Integer.toString(adminService.contentDelete(PRO_NO)));
		
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
		System.out.println(param); // {category=2}
 		List<Map<String, String>> cateList = adminService.getBoardCategoryList(param);
 		return ResponseEntity.ok().body(cateList);
 	}//
		
	/* 성엽 작업공간 */	



}
