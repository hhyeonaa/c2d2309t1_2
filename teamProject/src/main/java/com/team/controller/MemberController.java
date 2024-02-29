package com.team.controller;


import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.functions.Address;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.protobuf.Message;
import com.mysql.cj.Session;
import com.team.service.MemberService;
import com.team.service.TeamCodeService;

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
			return "member/msg";
		}
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
			session.setAttribute("MEM_NICK", map.get("MEM_NICK"));
			return "redirect:../";
		}
		return "member/msg";
	}// adminLoginPro() 
//	-----------------------------------------------------------------------------	
	@PostMapping("/socialLoginPro")
	public String socialLoginPro(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("MemberController socialLoginPro()");
		Map<String, String> searchId = memberService.socialLogin(map);
		System.out.println("@@@@@@@@@@@@@@@@@@@" + searchId);
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
	@PostMapping("/findId") // ajax
	@ResponseBody
	public void findId(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("MemberController findId()");
		Map<String, String> findId = memberService.findEmail(map);
		session.setAttribute("findId", findId);
		
		if(findId == null) {
			String msg = "이메일을 다시 확인해 주세요.";
			System.out.println(msg);
			session.setAttribute("msg", msg);
		} else {
			String receiver = map.get("MEM_EMAIL").toString();
			String subject = "다모임 - 계정 아이디 찾기 인증번호 발송";
			String url= "findId";
//			String AuthNumber = sendCodemail(map, receiver, subject, url);
//			session.setAttribute("AuthNumber", AuthNumber);
		}
	}// findId()
//	if(sPath.equals("/search_idPro.ow")) {
//		Map<String, String> authCheck = ownerService.authCheck(req);
//		session.setAttribute("authCheck", authCheck);
//		if(authCheck == null) {
//			String msg = "사업자번호 혹은 이메일을 다시 확인해 주십시오.";
//			alertAndBack(res, msg);
//		} else {
//			String receiver = req.getParameter("OWN_EMAIL"); 
//			String subject = "다이닝데이 - 점주 계정 아이디 찾기 인증번호 발송";
//			String url= "search_id.ow";
//			String AuthNumber = sendCodemail(res, receiver, subject, url);
//			session.setAttribute("AuthNumber", AuthNumber);
//		}	
//	}
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
		String MEM_ID = (String)session.getAttribute("MEM_ID");
		Map<String, String> param = memberService.getMember(MEM_ID, map);
		System.out.println("param : " + param);
		System.out.println(map.get("MEM_PW"));
			System.out.println(map.values());
			System.out.println("프로필 수정 가능");
			memberService.memberEdit(map);
			System.out.println("@@@@@@@@@@@@@@@@@@@@" + map);
			return "redirect:/member/mypage";
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

	
//	public static String sendCodemail(@RequestParam Map<String, String> map, String MEM_EMAIL, String subject, String url) {
//		Random random = new Random();
//		int randomNum = random.nextInt(1000000);
//		String AuthNumber = String.format("%06d", randomNum);
//		
//		// 인증번호 메일 발송
//		String sender = "ljw9863@naver.com";
//		String receiver = MEM_EMAIL;
//		String title = subject;
//		String content = "인증번호는 [" + AuthNumber + "] 입니다.";
//		
//		try {
//			Properties properties = System.getProperties();
//			
//			properties.put("mail.smtp.starttls.enable", "true");
//			properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
//			properties.put("mail.smtp.host", "smtp.gmail.com");
//			properties.put("mail.smtp.auth", "true");
//			properties.put("mail.smtp.port", "587");
//			
//			Authenticator authenticator = new GoogleSMTPAuthenticator();
//			Session mailSession = Session.getDefaultInstance(properties, authenticator);
//			Message mailMessage = new MimeMessage(mailSession);
//			Address sender_address = new InternetAddress(sender, "다이닝데이");
//			Address receiver_address = new InternetAddress(receiver);
//			
//			mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
//			mailMessage.setFrom(sender_address);
//			mailMessage.addRecipient(RecipientType.TO, receiver_address);
//			mailMessage.setSubject(title);
//			mailMessage.setContent(content, "text/html; charset=UTF-8");
//			mailMessage.setSentDate(new Date());
//			
//			Transport.send(mailMessage);
//			
//			String msg = "인증번호가 발송되었습니다.";
//			alertAndGo(map, msg, url);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		
//		return AuthNumber;
//	}
//	
//	class GoogleSMTPAuthenticator extends Authenticator {
//		PasswordAuthentication passwordAuthentication;
//
//		public GoogleSMTPAuthenticator() {
//			passwordAuthentication = new PasswordAuthentication("gyeon3241@gmail.com", "yukvgnaszlocornd");
//		}
//		
//		@Override
//		protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
//			return passwordAuthentication;
//		}
//	}	
}// MemberController 클래스
