package com.team.controller;


import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.Address;
import org.json.JSONObject;
import org.springframework.context.annotation.ImportResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.google.protobuf.Message;
import com.mysql.cj.Session;
import com.team.service.MemberService;
import com.team.service.TeamCodeService;
import com.team.util.EnumCodeType;

@Controller
@RequestMapping("/member/*")

public class MemberController{
	@Inject
	private MemberService memberService;
	@Inject
	private TeamCodeService codeService;
	
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
		Map<String, String> searchId = memberService.socialLogin(map);
		if(searchId == null || searchId.isEmpty()) {
			System.out.println("첫 회원가입 고객");
			memberService.insertMemeber(map);
			return "redirect:/member/login";
		} else {
			System.out.println("기존 고객");
			return "member/member/login";
		}
		
	}//insertPro()
//	-----------------------------------------------------------------------------	
	@GetMapping("/login")
	public String login(HttpSession session) {
		System.out.println("MemberController login()");
		session.invalidate();
		return "member/login";
	}// login()
//	-----------------------------------------------------------------------------	
	@PostMapping("/loginPro")
	public String loginPro(@RequestParam Map<String, String> map, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		System.out.println("MemberController loginPro()");
		Map<String, String> check = memberService.login(map);
		System.out.println("check : " + check);
		if(check != null) {
			session.setAttribute("MEM_ID", map.get("MEM_ID"));
			session.setAttribute("MEM_NICK", check.get("MEM_NICK"));
			return "redirect:../";
		} else {
			Object[] msg = {"입력하신 정보가 일치하지 않습니다.                                         아이디, 비밀번호"};
			codeService.submitForAlert(response, "AM5", msg, request.getContextPath()+"/member/login");
			return "";
		}
	}// adminLoginPro() 
//	-----------------------------------------------------------------------------	
	@PostMapping("/socialLoginPro")
	public String socialLoginPro(@RequestParam Map<String, String> map, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException{
		System.out.println("MemberController socialLoginPro()");
		Map<String, String> searchId = memberService.socialLogin(map);
		if(searchId == null || searchId.isEmpty()) {
			System.out.println("첫 회원가입 고객");
			memberService.insertMemeber(map);
		} else if (searchId != null && searchId.get("MEM_CAT").equals("2")) {
			System.err.println("탈퇴 고객");
			Object[] msg = {"탈퇴한 고객입니다.                                        입력 정보"};
//			response.setContentType("text/html; charset=utf-8");
//			   PrintWriter out = response.getWriter();
//			   out.println("<script>");
//			   out.println("history.back()");
//			   out.println("</script>");
			   codeService.submitForAlert(response, "AM5", msg, request.getContextPath()+"/member/login");
//			   out.flush();
			return "";
		} else {
			System.out.println("이미 가입한 고객");
			session.setAttribute("MEM_ID", map.get("MEM_ID"));
			memberService.socialLogin(map);
		}	
		return "redirect:../";
	}// socialLoginPro() 
//	-----------------------------------------------------------------------------	
	@GetMapping("/idCheck")	// ajax
	@ResponseBody
	public int idCheck(@RequestParam("MEM_ID") String MEM_ID){
		System.out.println("MemberController idCheck()");
		int result = memberService.idCheck(MEM_ID);
		System.out.println("idCheck : "+result);
		return result; 
	}//idCheck()
//	-----------------------------------------------------------------------------	
	@GetMapping("/nickCheck") // ajax
	@ResponseBody
	public int nickCheck(@RequestParam("MEM_NICK") String MEM_NICK){
		System.out.println("MemberController nickCheck()");
		System.out.println("MEM_NICK : "+MEM_NICK);
		int nickCheck = memberService.nickCheck(MEM_NICK);
		System.out.println("nickCheck : "+ nickCheck);
		return nickCheck; 
	}//nickCheck()
//	-----------------------------------------------------------------------------	
	@GetMapping("/phoneCheck") // ajax
	@ResponseBody
	public int phoneCheck(@RequestParam("MEM_TEL") String MEM_TEL){
		System.out.println("MemberController phoneCheck()");
		System.out.println("MEM_TEL : "+MEM_TEL);
		int phoneCheck = memberService.phoneCheck(MEM_TEL);
		System.out.println("phoneCheck : "+ phoneCheck);
		return phoneCheck; 
	}//nickCheck()
//	-----------------------------------------------------------------------------	
	@GetMapping("/emailCheck") // ajax
	@ResponseBody
	public int emailCheck(@RequestParam("MEM_EMAIL") String MEM_EMAIL){
		System.out.println("MemberController emailCheck()");
		System.out.println("MEM_EMAIL : "+MEM_EMAIL);
		int emailCheck = memberService.emailCheck(MEM_EMAIL);
		System.out.println("emailCheck : "+ emailCheck);
		return emailCheck; 
	}//emailCheck()
//	-----------------------------------------------------------------------------	
	@GetMapping("/findId")
	public String findId(HttpSession session, Model model) {
		System.out.println("MemberController findId()");
		model.addAttribute("findId", session.getAttribute("findId"));
		model.addAttribute("checkResult", session.getAttribute("checkResult"));
		session.removeAttribute("findId");
		session.removeAttribute("checkResult");
		
		return "member/findId";
	}// findId()
//	-----------------------------------------------------------------------------
	@PostMapping("/findIdPro")
	public String findIdPro(@RequestParam Map<String, String> map, HttpSession session, HttpServletResponse response, Model model) {
		try {
			System.out.println("MemberController findIdPro()");
			System.out.println("map : " + map);
			System.out.println("~~~~~~~~~~ : " + map.get("MEM_NAME"));
			Map<String, String> findId = memberService.findId(map);
			System.out.println("findId" + findId);
			session.setAttribute("findId", findId);
			
			if(findId == null) {
				session.setAttribute("checkResult", "N");
			} else {
				String receiver = map.get("MEM_EMAIL");
				String subject = "[다모임] 아이디 찾기 인증번호 발송 메일";
				String url= "findId";
				String AuthNumber = sendCodemail(findId, receiver, subject);
				session.setAttribute("AuthNumber", AuthNumber);
			}
		} catch (Exception e) {
			System.err.println("정보 입력 오류");
		} return "redirect: findId";
	}// findIdPro()
//	-----------------------------------------------------------------------------	
	@GetMapping("/findPw")
	public String findPw(HttpSession session, Model model) {
		System.out.println("MemberController findPw()");
		model.addAllAttributes((Map<String, String>)session.getAttribute("findPw"));
		return "member/findPw";
	}// findPw()
//	-----------------------------------------------------------------------------
	@PostMapping("/findPwPro")
	public String findPwPro(@RequestParam Map<String, String> map, HttpSession session) {
		try {
			System.out.println("MemberController findPwPro()");
			System.out.println("map : " + map);
			Map<String, String> findPw = memberService.findId(map);
			session.setAttribute("findPw", findPw);
			if(findPw.get("MEM_EMAIL") == null) {
//				Object[] msg = ["이메일을 다시 확인해 주세요."];
				
			} else {
				String receiver = map.get("MEM_EMAIL");
				String subject = "[다모임] 비밀번호 찾기 인증번호 발송 메일";
				String AuthNumber = sendCodemail(findPw, receiver, subject);
				session.setAttribute("AuthNumber", AuthNumber);
			}
			
		} catch (Exception e) {
			System.err.println("정보 입력 오류");
		} return "redirect: findPw";
	}// findPwPro()
//	-----------------------------------------------------------------------------	
	@PostMapping("/pwUpdate")
	@ResponseBody
	public ResponseEntity<?> pwUpdate(@RequestParam Map<String, String> map) {
		System.out.println("MemberController pwUpdate()");
		return ResponseEntity.ok().body(memberService.pwUpdate(map));
	}// pwUpdate()
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
	public String adminLoginPro(@RequestParam Map<String, String> map, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException{
		System.out.println("MemberController adminLoginPro()");
		Map<String, String> check = memberService.adminLogin(map);
		if(check != null) {
			session.setAttribute("MEM_ID", check.get("ROL_NO"));
			return "redirect:/admin/member_manage";
		} else {
			Object[] msg = {"입력하신 정보가 일치하지 않습니다.                                         아이디, 비밀번호"};
			response.setContentType("text/html; charset=utf-8");
//			   PrintWriter out = response.getWriter();
//			   out.println("<script>");
//			   out.println("history.back()");
//			   out.println("</script>");
			codeService.submitForAlert(response, "AM5", msg, request.getContextPath()+"/member/adminLogin");
//			   out.flush();
			return "";
		}
		
	}// adminLoginPro() 
//	-----------------------------------------------------------------------------
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		System.out.println("MemberController mypage()");
		String MEM_ID = session.getAttribute("MEM_ID").toString();
		Map<String, String> profile = memberService.mypage(MEM_ID);
		model.addAttribute("profile", profile);
		return "member/mypage";
	}// mypage()
//	-----------------------------------------------------------------------------
	@GetMapping("/memberEdit")
	public String memberEdit(Model model, HttpSession session) {
		System.out.println("MemberController memberEdit()");
		String MEM_ID = (String)session.getAttribute("MEM_ID");
		Map<String, String> profile = memberService.mypage(MEM_ID);
		model.addAttribute("profile", profile);
		return "member/memberEdit";
	}// memberEdit()
//	-----------------------------------------------------------------------------
	@PostMapping("/memberEditPro")
	@ResponseBody
	public ResponseEntity<?> memberEditPro(@RequestParam Map<String, String> map, HttpSession session, 
										   HttpServletRequest request, @RequestParam(value = "image", required =false) MultipartFile image) throws Exception {
		System.out.println("MemberController memberEditPro()");
		
		Map<String, String> param = new Gson().fromJson(map.get("map"), new TypeToken<Map<String, String>>(){}.getType());
		
		
		if(image != null) {
			ServletContext context = request.getSession().getServletContext();
			String realPath = context.getRealPath("/resources/img/uploads");
			System.out.println("realPath : " + realPath);
			// 첨부파일 업로드 => pom.xml 프로그램 설치
			// servlet-context.xml에 설정
			// 파일이름 중복 방지 => 랜덤문자_파일이름
			UUID uuid = UUID.randomUUID();
			String filename = uuid.toString() + "_" + image.getOriginalFilename();
			
			param.put("MEM_IMAGE", filename);
			
			File newfile = new File(realPath, filename);
			image.transferTo(newfile);
		}
		
		
		int memberEdit = memberService.memberEdit(param);
		return ResponseEntity.ok().body(memberEdit);
		
	}// memberEditPro()
//	-----------------------------------------------------------------------------
	@GetMapping("/myList")
	public String myList(Model model, HttpSession session) {
		System.out.println("MemberController myList()");
		String MEM_ID = session.getAttribute("MEM_ID").toString();
		// 내 판매 목록
		List<Map<String,String>> myListSell = memberService.myListSell(MEM_ID);
		model.addAttribute("myListSell", myListSell);
		// 내 구매 목록
		List<Map<String,String>> myListBuy = memberService.myListBuy(MEM_ID);
		model.addAttribute("myListBuy", myListBuy);
		// 내 나눔 목록
		List<Map<String,String>> myListShare = memberService.myListShare(MEM_ID);
		model.addAttribute("myListShare", myListShare);
		// 내 경매 목록
		List<Map<String,String>> myListAuction = memberService.myListAuction(MEM_ID);
		model.addAttribute("myListAuction", myListAuction);
		return "member/myList";
	}// myList()
//	-----------------------------------------------------------------------------
	@GetMapping("/tradeList")
	public String tradeList(Model model, HttpSession session) {
		System.out.println("MemberController tradeList()");
		String MEM_ID = session.getAttribute("MEM_ID").toString();
		// 내가 등록한
		List<Map<String,String>> myTrade = memberService.myTrade(MEM_ID);
		model.addAttribute("myTrade", myTrade);
		
		List<Map<String,String>> otherTrade = memberService.otherTrade(MEM_ID);
		model.addAttribute("otherTrade", otherTrade);
		return "member/tradeList";
	}// tradeList()
//	-----------------------------------------------------------------------------
	@GetMapping("/likeList")
	public String likeList(Model model, HttpSession session) {
		model.addAttribute("menuList", codeService.selectCodeList(EnumCodeType.메뉴항목, session));
		model.addAttribute("tscList", codeService.selectCodeList(EnumCodeType.거래상태, session));
		String MEM_ID = session.getAttribute("MEM_ID").toString();
		List<Map<String,String>> likeList = memberService.likeList(MEM_ID);
		model.addAttribute("likeList", likeList);
		return "member/likeList";
	}// likeList()
//	-----------------------------------------------------------------------------	
	@GetMapping("/likeListSelect")	// ajax
	@ResponseBody
	public List<Map<String,String>> likeListSelect(@RequestParam Map<String,String> map, HttpServletRequest request, HttpSession session, Model model){
		map.put("MEM_ID", session.getAttribute("MEM_ID").toString());
		map.put("PATH", request.getContextPath());
		List<Map<String,String>> likeListSelect = memberService.likeListSelect(map);
		return likeListSelect; 
	}//likeListSelect()
//	-----------------------------------------------------------------------------
	@PostMapping("/deleteLike")	// ajax
	@ResponseBody
	public ResponseEntity<?> deleteLike(@RequestParam String LIK_NO) {
		System.out.println(LIK_NO);
		boolean result = memberService.deleteLike(LIK_NO);
		return ResponseEntity.ok().body(result);
	}// deleteLike()
//	-----------------------------------------------------------------------------
	@PostMapping("/insertLike")	// ajax
	@ResponseBody
	public boolean insertLike(@RequestParam Map<String,String> map, HttpSession session) {
		map.put("MEM_ID", session.getAttribute("MEM_ID").toString());
		System.out.println(map);
		boolean result = memberService.insertLike(map);
		return result;
	}// insertLike()	
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
	@GetMapping("/memberDelete")
	public String memberDelete() {
		System.out.println("MemberController memberDelete()");
		return "member/memberDelete";
	}// memberDelete()
//	-----------------------------------------------------------------------------
	@PostMapping("/memberDeletePro")
	public String memberDeletePro(@RequestParam Map<String, String> map, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		System.out.println("MemberController memberDeletePro()");
		session.setAttribute("MEM_EMAIL", map.get("MEM_EMAIL"));
		String MEM_EMAIL = (String)session.getAttribute("MEM_EMAIL");
		String MEM_ID = (String)session.getAttribute("MEM_ID");
		Map<String, String> profile = memberService.mypage(MEM_ID);
		System.out.println(profile + "@#^$%@#^%$^#@%");
		profile.get("MEM_EMAIL");
		if (profile.get("MEM_EMAIL") != null) {
			if (MEM_EMAIL.equals(profile.get("MEM_EMAIL"))) {
				memberService.memberDelete(profile);
				System.out.println("이메일 일치 삭제 가능");
				Object[] msg = {"회원"};
				codeService.submitForAlert(response, "AM18", msg, request.getContextPath());
				session.invalidate();
				return "";
			} else {
				System.err.println("이메일 불일치");
				Object[] msg = {"입력하신 정보"};
				response.setContentType("text/html; charset=utf-8");
//				   PrintWriter out = response.getWriter();
//				   out.println("<script>");
//				   out.println("history.back()");
//				   out.println("</script>");
				   codeService.submitForAlert(response, "AM7", msg, request.getContextPath() + "/member/memberDelete");
//				   out.flush();
				   return "";
			}
		} else {
			System.err.println("이메일 미입력");
			Object[] msg = {"이메일"};
//			response.setContentType("text/html; charset=utf-8");
//			   PrintWriter out = response.getWriter();
//			   out.println("<script>");
//			   out.println("history.back()");
//			   out.println("</script>");
			   codeService.submitForAlert(response, "AM6", msg, request.getContextPath() + "/member/memberDelete");
//			   out.flush();
			   return "";
		}
	}// memberDeletePro()
//	-----------------------------------------------------------------------------
	@GetMapping("/resetImage")
	public String resetImage(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("MemberController resetImage()");
		String MEM_ID = (String)session.getAttribute("MEM_ID");
		memberService.resetImage(MEM_ID);
		return "redirect:/member/memberEdit";
		
	}// memberDelete()
//	-----------------------------------------------------------------------------
	@GetMapping("/trading")
	public String trading(Model model, HttpSession session) {
		System.out.println("MemberController tradeList()");
		String MEM_ID = session.getAttribute("MEM_ID").toString();
		// 진행 중인 거래
		List<Map<String,String>> trading = memberService.trading(MEM_ID);
		System.out.println(trading);
		model.addAttribute("trading", trading);
		return "member/trading";
	}// trading() 
//	-----------------------------------------------------------------------------
		@PostMapping("/changeState")
		public String changeState(@RequestParam Map<String, String> map, HttpSession session) {
			System.out.println("changeState map : " + map);
		    String proNo = map.get("PRO_NO");
		    String MEM_ID = (String)session.getAttribute("MEM_ID");
		    System.out.println("chacngestate MEM_ID : " + MEM_ID);
		    if (proNo != null && MEM_ID != null) {
		        try {
		            memberService.changeState(map, MEM_ID);
		            // 변경 성공 시 로깅
		            System.out.println("상태 변경이 성공적으로 이루어졌습니다.");
		        } catch (Exception e) {
		            e.printStackTrace(); // 에러 로깅
		            // 변경 실패 시 처리
		            System.err.println("상태 변경 중 오류가 발생했습니다.");
		        }
		    }
		    return "redirect:/member/trading";
		}
	
//  ===============================================메일 전송 관련===============================================	
		// 인증메일
		public String sendCodemail(Map<String, String> findId, String MEM_EMAIL, String subject) {
			Random random = new Random();
			int randomNum = random.nextInt(1000000);
			String AuthNumber = String.format("%06d", randomNum);
			// 인증번호 메일 발송
			String sender = "ljw9863@naver.com";
			String receiver = MEM_EMAIL;
			String title = subject;
			String content = "인증번호는 [" + AuthNumber + "] 입니다.";
			System.out.println(content);
			
			try {
				Properties properties = System.getProperties();
				
				properties.put("mail.smtp.starttls.enable", "true");
				properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
				properties.put("mail.smtp.host", "smtp.gmail.com");
				properties.put("mail.smtp.auth", "true");
				properties.put("mail.smtp.port", "587");
				
				javax.mail.Authenticator authenticator = new GoogleSMTPAuthenticator();
				javax.mail.Session mailSession = javax.mail.Session.getDefaultInstance(properties, authenticator);
				javax.mail.Message mailMessage = new MimeMessage(mailSession);
				javax.mail.Address sender_address = new InternetAddress(sender, "다모임");
				javax.mail.Address receiver_address = new InternetAddress(receiver);
				
				mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
				mailMessage.setFrom(sender_address);
				mailMessage.addRecipient(RecipientType.TO, receiver_address);
				mailMessage.setSubject(title);
				mailMessage.setContent(content, "text/html; charset=UTF-8");
				mailMessage.setSentDate(new Date());
				
				Transport.send(mailMessage);
				
//				Object[] msg = {"인증번호"};
//				alertAndGo(res, msg, url);
//				codeService.submitForAlert(response, "AM13", msg);
				} catch (Exception e) {
					e.printStackTrace();
				}
			
			return AuthNumber;
		}// sendCodemail()
		
	class GoogleSMTPAuthenticator extends javax.mail.Authenticator {
		javax.mail.PasswordAuthentication passwordAuthentication;

		public GoogleSMTPAuthenticator() {
			passwordAuthentication = new javax.mail.PasswordAuthentication("ljw980603@gmail.com", "jtdy kpyr dhhi yyrf");
		}
		
		@Override
		protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
			return passwordAuthentication;
		}// GoogleSMTPAuthenticator()
	}
//  ===============================================메일 전송 관련===============================================		

}// MemberController 클래스
