package com.team.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.util.EnumCodeType;
import com.team.service.MemberService;
import com.team.service.PayService;
import com.team.service.TeamCodeService;


@Controller
@RequestMapping("/pay/*")
public class PayController {

	@Inject
	private TeamCodeService codeService;
	@Inject
	private PayService payService;
	@Inject
	private MemberService memberService;
	
	@GetMapping("/payment")
	public String payment(@RequestParam Map<String, String> param, HttpSession session, Model model,HttpServletRequest request) {
		System.out.println("PayController payment()");
		String MEM_ID = (String)session.getAttribute("MEM_ID");
		String proWr = request.getParameter("proWr");
		String proDate = request.getParameter("proDate");
		//로그인한 회원 정보 및 배송지 정보 select
		param.put("MEM_ID", MEM_ID);
		//로그인 회원 정보 select
		Map<String, String> param2 = memberService.getMember(MEM_ID, param);
		System.out.println(param2);
		model.addAttribute("buyerInfo", param2);
		
		//회원 배송지 목록 select
		//List<Map<String, String>> memAddList = payService.getMemAddList(); 
		
		//결제할 상품 정보 select
		Map<String, String> map = new HashMap<>();
		map.put("proWr", proWr);
		map.put("proDate", proDate);
		
		Map<String, String> payProList = payService.getPayProList(map);
		
		int payPrice = Integer.parseInt(payProList.get("PRO_PRICE"));
		model.addAttribute("payPrice",payPrice);
		model.addAttribute("payProList",payProList);
		
		return "/pay/payment";
	}// payment()
	
	@GetMapping("/completepay")
	public String completepay() {
		System.out.println("PayController completepay()");
		return "/pay/completepay";
	}// completepayment
	
}
