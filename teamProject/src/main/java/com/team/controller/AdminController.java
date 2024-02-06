package com.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
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

}
