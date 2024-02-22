package com.team.controller;


import java.io.File;
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

import com.team.service.TeamService;
import com.team.util.EnumCodeType;
import com.team.util.ToastUI;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	private TeamService teamService;
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
	public String insertPro(@RequestParam Map<String, String> map) {
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
	public String board() {
		return "admin/board";
	}
	
	@GetMapping("/header_menu")
	public String header_menu() {
		return "admin/header_menu";  
	}
	
	@GetMapping("/category")
	public String category() {
		return "admin/category";
	}
	
	
	/* 현아 작업공간 */
	
	/* 무창 작업공간 */
	@GetMapping("/message_manage")
	public String message_manage(HttpServletResponse response, HttpServletRequest request) {
//		code.onlyAlert(response, "안녕");
//		code.historyBackAlert(response, "안녕히사시부리");
//		Object[] arr = {"가나다"};
//		service.moveThePageAlert(response, EnumCodeType.메세지.type + 1, arr, "category_manage");
//		code.confirm(response, "야임마", "category_manage", true);
		
//		com.team.util에 message 항목들 보여주는 함수 
//		본인이 메시지문구 함수 사용전에 showMessage()함수 결과 보고 정해주세요
		
//		teamService.showCodeList(EnumCodeType.메세지);	
//		teamService.showCodeList(EnumCodeType.배송안내문구);
		
		teamService.showCodeList(EnumCodeType.메세지);
		
//		System.out.println(EnumCodeType.메세지.getList());
		
		Object[] arr = {"안녕"};
//		teamService.onlyAlert(response, EnumCodeType.메세지.type , arr);
		
//		teamService.moveThePageAlert(response, EnumCodeType.메세지.type + 1, arr, "member/login");
		teamService.confirm(response, EnumCodeType.메세지.getType() + 1, arr, "category_pro", false);
		return "admin/message_manage";
	}
	
	@GetMapping("/category_manage")
	public String category_manage(HttpServletRequest request) {
		System.out.println(new File(".").getAbsoluteFile());
		
		return "admin/category_manage";
	}
	
	@GetMapping("/category_pro")
	public void category_pro(HttpServletResponse response) {
		teamService.showCodeList(EnumCodeType.메세지);
		
		Object[] arr = {"잘가요"};
		
		teamService.moveThePageAlert(response, EnumCodeType.메세지.getType() + 1, arr, "member/login");
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
	}
	
	@GetMapping("/member_manage")
	public String member_manage() {
		return "admin/member_manage";
	}
	
	@GetMapping("/board_content")
	public String board_content() {
		return "admin/board_content";
	}
	/* 성엽 작업공간 */	



}
