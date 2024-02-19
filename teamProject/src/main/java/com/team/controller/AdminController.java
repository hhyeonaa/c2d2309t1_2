package com.team.controller;


import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	private AdminService adminService;
	
	/* 현아 작업공간 */
	@GetMapping("/manager")
	public String manager(Model model) {
		List<Map<String, String>> mapList = adminService.getAdminList();
		model.addAttribute("mapList", mapList);
		return "admin/manager";
	}
	
	@PostMapping("/insertPro")
	public void managerPro(@RequestParam Map<String, String> map) {
		boolean check = adminService.idCheck(map);
		if(check) {
		} else {
			adminService.adminInsert(map);
		}
	}
	
	@PostMapping("/deletePro")
	public void deletePro(@RequestParam String AD_NO) {
		System.out.println("AD_NO : " + AD_NO);
		adminService.adminDelete(AD_NO);
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
	public String message_manage() {
		return "admin/message_manage";
	}
	
	@GetMapping("/category_manage")
	public String category_manage() {
		return "admin/category_manage";
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
