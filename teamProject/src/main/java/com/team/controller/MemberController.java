package com.team.controller;


import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.team.util.EnumCodeType;
import com.team.service.MemberService;
import com.team.service.TeamService;

@Controller
@RequestMapping("/member/*")
public class MemberController{
	@Inject
	private MemberService memberService;
	@Inject
	private TeamService teamService;
	
//	-----------------------------------------------------------------------------	
	@PostMapping("/insertPro")
	public void insertPro(@RequestParam Map<String, String> map) {
		System.out.println("MemberController insertPro()");
		System.out.println(map.toString());
		memberService.insertMemeber(map);
		
	}//insertPro()
//	-----------------------------------------------------------------------------	
	@GetMapping("/login")
	public String login() {
		System.out.println("MemberController login()");
		return "member/login";
	}// login()
//	-----------------------------------------------------------------------------	
	@PostMapping("/adminLoginPro")
	public void loginPro(@RequestParam Map<String, String> map) {
		System.out.println("MemberController adminLoginPro()");
		boolean check = memberService.adminLogin(map);
		
		if(check) {
		} else {
			memberService.adminLogin(map);
		}
	}// adminLoginPro()
//	-----------------------------------------------------------------------------	
	@GetMapping("/adminLogin")
	public String adminLogin() {
		System.out.println("MemberController adminLogin()");
		return "member/adminLogin";
	}// adminLogin()
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
	@GetMapping("/buyList")
	public String buyList() {
		System.out.println("MemberController buyList()");
		return "member/buyList";
	}// buyList()
//	-----------------------------------------------------------------------------
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		session.invalidate();
		return "/home";
	}// logout()
}// MemberController 클래스
