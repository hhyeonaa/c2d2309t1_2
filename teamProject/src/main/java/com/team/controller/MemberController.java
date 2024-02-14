package com.team.controller;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController{
//	-----------------------------------------------------------------------------	
	@GetMapping("/login")
	public String login() {
		System.out.println("MemberController login()");
		return "member/login";
	}// login()
//	-----------------------------------------------------------------------------
	@GetMapping("/mypage")
	public String mypage() {
		System.out.println("MemberController mypage()");
		return "member/mypage";
	}// mypage()
//	-----------------------------------------------------------------------------
	@GetMapping("/memberEdit")
	public String memberEdit() {
		System.out.println("MemberController memberEdit()");
		return "member/memberEdit";
	}// memberEdit()
//	-----------------------------------------------------------------------------
	@GetMapping("/tradeList")
	public String tradeList() {
		System.out.println("MemberController tradeList()");
		return "member/tradeList";
	}// tradeList()
//	-----------------------------------------------------------------------------
	@GetMapping("/likeList")
	public String likeList() {
		System.out.println("MemberController likeList()");
		return "member/likeList";
	}// likeList()
//	-----------------------------------------------------------------------------
	@GetMapping("/salesList")
	public String salesList() {
		System.out.println("MemberController salesList()");
		return "member/salesList";
	}// salesList()
//	-----------------------------------------------------------------------------
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		session.invalidate();
		return "/home";
	}// logout()
}// MemberController 클래스
