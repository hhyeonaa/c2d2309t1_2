package com.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@GetMapping("/saleBoard")
	public String saleBoard() {
		System.out.println("BoardController saleBoard()");
		return "/board/saleBoard";
	}// saleBoard()
	
}// 클래스 끝
