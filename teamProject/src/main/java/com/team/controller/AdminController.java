package com.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	/* 현아 작업공간 */
	@GetMapping("/manager")
	public String manager() {
		return "admin/manager";
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
	
	/* 성엽 작업공간 */	
}
