package com.team.controller;

import java.nio.file.spi.FileSystemProvider;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.util.EnumCodeType;
import com.mysql.cj.protocol.x.SyncFlushDeflaterOutputStream;
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
		
		//로그인 회원 정보 select
		param.put("MEM_ID", MEM_ID);
		Map<String, String> param2 = memberService.getMember(MEM_ID, param);
		model.addAttribute("buyerInfo", param2);
		
		//로그인한 회원 정보 및 배송지리스트 select(ajax?), >> 모달창 ajax
		Map<String, String> map2 = new HashMap<>();
		map2.put("MEM_NO", param2.get("MEM_NO"));
		List<Map<String, String>> memAddList = payService.getMemAdd(map2);
		model.addAttribute("memAddList", memAddList);
		
		//payment 배송지 1개 orderby select
		List<Map<String, String>> memAddBasic = payService.getMemAddBasic(map2);
		model.addAttribute("memAddBasic",memAddBasic);
		
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
	
	// 회원 배송지 리스트 모달창 ajax
	@GetMapping("/addList")
	@ResponseBody
	public List<Map<String, String>> addList(@RequestParam Map<String, String> param, Model model) {
		System.out.println("ajax addList");
		List<Map<String, String>> addList = payService.getAddList(param);
		model.addAttribute("addList", addList);
		return addList;
	}//addList()
	
	// 회원 배송지 등록추가 insert ajax
	@PostMapping("/addDelivery")
	@ResponseBody
	public ResponseEntity<?> addDelivery(@RequestParam Map<String, String> param){
		System.out.println("ajax addDelivery");
		return  ResponseEntity.ok().body(payService.addDelivery(param));
	}//addDelivery()
	
	//회원 배송지 수정할 배송지 select ajax
	@GetMapping("/addDeliveryUpdate")
	public Map<String, String> addDeliveryUpdate(@RequestParam Map<String, String> param, Model model){
		System.out.println("ajax addDeliveryUpdate");
		System.out.println(param);
		Map<String, String> addUpList = payService.getaddDelivery(param);
		model.addAttribute("addUpList", addUpList);
		return addUpList;
	}//addDeliveryUpdate()
	
	@GetMapping("/completepay")
	public String completepay() {
		System.out.println("PayController completepay()");
		return "/pay/completepay";
	}// completepayment
	
}
