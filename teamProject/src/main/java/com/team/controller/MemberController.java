package com.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/*")
public class MemberController {
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
}// MemberController 클래스
