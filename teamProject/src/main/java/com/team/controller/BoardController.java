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
		return "board/saleBoard";
	}// saleBoard()
	
	@GetMapping("/buyBoard")
	public String buyBoard() {
		System.out.println("BoardController buyBoard()");
		return "board/buyBoard";
	}// buyBoard()
	
	@GetMapping("/divideBoard")
	public String divideBoard() {
		System.out.println("BoardController divideBoard()");
		return "board/divideBoard";
	}// divideBoard()
	
	@GetMapping("/auctionBoard")
	public String auctionBoard() {
		System.out.println("BoardController auctionBoard()");
		return "board/auctionBoard";
	}// auctionBoard()
	
	@GetMapping("/writeBoard")
	public String writeBoard() {
		System.out.println("BoardController writeBoard()");
		return "board/writeBoard";
	}// writeBoard()
	
	
	
}// 클래스 끝
