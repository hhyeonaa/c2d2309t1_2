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
	public String insertPro(@RequestParam Map<String, String> map) {
		System.out.println("MemberController insertPro()");
		System.out.println(map.toString());
		memberService.insertMemeber(map);
		
		return "redirect:/member/login";
	}//insertPro()
//	-----------------------------------------------------------------------------	
	@GetMapping("/login")
	public String login() {
		System.out.println("MemberController login()");
		return "member/login";
	}// login()
//	-----------------------------------------------------------------------------	
	@GetMapping("/join")
	public String join() {
		System.out.println("MemberController join()");
		return "member/join";
	}// join()
//	-----------------------------------------------------------------------------	
	@PostMapping("/loginPro")
	public String loginPro(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("MemberController loginPro()");
		Map<String, String> check = memberService.login(map);
		System.out.println(check);
		if(check != null) {
			session.setAttribute("MEM_ID", map);
			return "redirect:../";
		}
		return "member/msg";
	}// adminLoginPro() 
//	-----------------------------------------------------------------------------	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		session.invalidate();
		return "redirect:../";
	}//logout()
//	-----------------------------------------------------------------------------	
	@GetMapping("/adminLogin")
	public String adminLogin() {
		System.out.println("MemberController adminLogin()");
		return "member/adminLogin";
	}// adminLogin()
//	-----------------------------------------------------------------------------	
	@PostMapping("/adminLoginPro")
	public String adminLoginPro(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("MemberController adminLoginPro()");
		Map<String, String> check = memberService.adminLogin(map);
		System.out.println(check);
		if(check != null) {
			session.setAttribute("AD_ID", map);
			return "redirect:/admin/manager";
		}
		return "member/msg";
		
	}// adminLoginPro() 
//	-----------------------------------------------------------------------------
	
//	@PostMapping("/loginPro")
//	public String loginPro(MemberDTO memberDTO, HttpSession session) {
//		System.out.println("MemberController loginPro()");
//		System.out.println(memberDTO);
//		
//		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
//		
//		if(memberDTO2 != null) {
//			session.setAttribute("id", memberDTO.getId());
//			return "redirect:/member/main";
//		}else {
//			return "member/msg";
//		}
		
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
	@GetMapping("/myList")
	public String myList() {
		System.out.println("MemberController tradeList()");
		return "member/myList";
	}// myList()
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

}// MemberController 클래스
