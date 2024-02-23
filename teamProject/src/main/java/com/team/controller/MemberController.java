package com.team.controller;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@GetMapping("/join")
	public String join() {
		System.out.println("MemberController join()");
		return "member/join";
	}// join()
//	-----------------------------------------------------------------------------	
	@PostMapping("/insertPro")
	public String insertPro(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("MemberController insertPro()");
		Map<String, String> searchId = memberService.login(map);
		if(searchId == null || searchId.isEmpty()) {
			System.out.println("첫 회원가입 고객");
			memberService.insertMemeber(map);
		}
		System.out.println("기존 고객");
		return "redirect:/member/login";
	}//insertPro()
//	-----------------------------------------------------------------------------	
	@GetMapping("/login")
	public String login() {
		System.out.println("MemberController login()");
		return "member/login";
	}// login()
//	-----------------------------------------------------------------------------	
	@PostMapping("/loginPro")
	public String loginPro(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("MemberController loginPro()");
		Map<String, String> check = memberService.login(map);
		System.out.println("check : " + check);
		if(check != null) {
			session.setAttribute("MEM_ID", map.get("MEM_ID"));
			return "redirect:../";
		}
		return "member/msg";
	}// adminLoginPro() 
//	-----------------------------------------------------------------------------	
	@PostMapping("/socialLoginPro")
	public String socialLoginPro(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("MemberController socialLoginPro()");
		Map<String, String> searchId = memberService.socialLogin(map);
		
		if(searchId == null || searchId.isEmpty()) {
			System.out.println("첫 회원가입 고객");
			memberService.insertMemeber(map);
		} 
		System.out.println("이미 가입한 고객");
		session.setAttribute("MEM_ID", map.get("MEM_ID"));
		memberService.socialLogin(map);
			
		return "redirect:../";
	}// socialLoginPro() 
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
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		System.out.println("MemberController mypage()");
		String MEM_ID = session.getAttribute("MEM_ID").toString();
		System.out.println("@@@@@@" + MEM_ID.toString());
		Map<String, String> profile = memberService.mypage(MEM_ID);
		model.addAttribute("profile", profile);
		System.out.println("profile : " + profile);
		return "member/mypage";
	}// mypage()
//	-----------------------------------------------------------------------------
	@GetMapping("/memberEdit")
	public String memberEdit(Model model, HttpSession session) {
		System.out.println("MemberController memberEdit()");
		String MEM_ID = session.getAttribute("MEM_ID").toString();
		Map<String, String> profile = memberService.mypage(MEM_ID);
		model.addAttribute("profile", profile);
		return "member/memberEdit";
	}// memberEdit()
//	-----------------------------------------------------------------------------	
	@PostMapping("/memberEditPro")
	public String memberEditPro(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("MemberController memberEditPro()");
		Map<String, String> param = memberService.login(map);
		if(param != null) {
			System.out.println("프로필 수정 가능");
			memberService.memberEdit(map);
			return "redirect:/member/mypage";
		} else {
		System.out.println("기존 고객");
		return "member/msg";
		}
	}//memberEditPro()
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
