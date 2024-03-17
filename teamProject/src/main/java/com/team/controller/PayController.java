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
		System.out.println("!@#!@#!@#"+param2);
		System.out.println(param2.get("MEM_NO"));
		model.addAttribute("buyerInfo", param2);
		
		//로그인한 회원 정보 및 배송지리스트 select(ajax?), >> 모달창 ajax
		Map<String, String> map2 = new HashMap<>();
		map2.put("MEM_NO", param2.get("MEM_NO"));
		List<Map<String, String>> memAddList = payService.getMemAdd(map2);
		model.addAttribute("memAddList", memAddList);
		
		//payment 배송지 1개 orderby select
		List<Map<String, String>> memAddBasic = payService.getMemAddBasic(map2);
		model.addAttribute("memAddBasic",memAddBasic);
		System.out.println("== : " + memAddBasic);
		
		//결제할 상품 정보 select
		Map<String, String> map = new HashMap<>();
		map.put("proWr", proWr);
		map.put("proDate", proDate);
		//상품정보
		Map<String, String> payProList = payService.getPayProList(map);
		System.out.println("payProList" + payProList);
		int payPrice = Integer.parseInt(payProList.get("PRO_PRICE"));
		model.addAttribute("payPrice",payPrice);
		model.addAttribute("payProList",payProList);
		
		//배송요청사항 SELECT (공통코드)
//		List<Map<String, String>> requestDel = payService.getRequestDel();
		model.addAttribute("requestDel", codeService.selectCodeList(EnumCodeType.배송안내문구, session));
		
		return "/pay/payment";
	}// payment()
	
	@GetMapping("/paymentPro")
	@ResponseBody
	public ResponseEntity<?> paymentPro(@RequestParam Map<String, String> param, HttpSession session){
		Map<String, String> param2 = memberService.getMember((String)session.getAttribute("MEM_ID"), param);
		
		//로그인한 회원 정보 및 배송지리스트 select(ajax?), >> 모달창 ajax
		Map<String, String> map2 = new HashMap<>();
		map2.put("MEM_NO", param2.get("MEM_NO"));
		
		//payment 배송지 1개 orderby select
		List<Map<String, String>> memAddBasic = payService.getMemAddBasic(map2);
		System.out.println("== : " + memAddBasic);
		
		return ResponseEntity.ok().body(memAddBasic);
	}
	
	
	// 회원 배송지 리스트 모달창 ajax
	@GetMapping("/addList")
	@ResponseBody
	public List<Map<String, String>> addList(HttpSession session, Model model) {
		System.out.println("ajax addList");
		System.out.println();
		List<Map<String, String>> addList = payService.getAddList(session);
		System.out.println(addList);
		model.addAttribute("addList", addList);
		return addList;
	}//addList()
	
	// 회원 배송지 등록추가 insert ajax
	@PostMapping("/addDelivery")
	@ResponseBody
	public ResponseEntity<?> addDelivery(@RequestParam Map<String, String> param, HttpSession session){
		System.out.println("ajax addDelivery");
		String MEM_ID = (String)session.getAttribute("MEM_ID");
		param.put("MEM_ID", MEM_ID);
		Map<String, String> param2 = memberService.getMember(MEM_ID, param);
		param.put("MEM_NO", param2.get("MEM_NO"));
		System.out.println(param);
		return  ResponseEntity.ok().body(payService.addDelivery(param));
	}//addDelivery()
	
	//회원 배송지 수정할 배송지 select ajax
	@GetMapping("/addDeliveryUpdate")
	@ResponseBody
	public Map<String, String> addDeliveryUpdate(@RequestParam Map<String, String> param, Model model){
		System.out.println("ajax addDeliveryUpdate");
		System.out.println(param);
		Map<String, String> addUpList = payService.getaddDelivery(param);
		model.addAttribute("addUpList", addUpList);
		System.out.println("업리스트 : " + addUpList);
		return addUpList;
	}//addDeliveryUpdate()
	
	//회원 배송지 수정 update ajax
	@PostMapping("/addDeliveryUpdate1")
	@ResponseBody
	public ResponseEntity<?> addDeliveryUpdate1(@RequestParam Map<String, String> param, HttpSession session){
		System.out.println("ajax addDelivery");
		String MEM_ID = (String)session.getAttribute("MEM_ID");
		param.put("MEM_ID", MEM_ID);
		Map<String, String> param2 = memberService.getMember(MEM_ID, param);
		System.out.println("asda" + param2);
		param.put("MEM_NO", param2.get("MEM_NO"));
		System.out.println(param);
		return  ResponseEntity.ok().body(payService.addDeliveryUpdate1(param));
	}//addDeliveryUpdate1()	
	
	//회원배송지 삭제 delete ajax
	@GetMapping("/addDeliveryDelete")
	@ResponseBody
	public ResponseEntity<?> addDeliveryDelete(@RequestParam Map<String, String> param, HttpSession session){
		System.out.println("ajax addDeliveryDelete");
		System.out.println(param);
		return ResponseEntity.ok().body(payService.addDeliveryDelete(param));
	}
	
	//판매,결제자 Info select ajax
	@GetMapping("/payInfo")
	@ResponseBody
	public ResponseEntity<?> payInfo(@RequestParam Map<String, String> param,  Model model){
		System.out.println("ajax payInfo");
		System.out.println("payInfo" + param);
		Map<String, String> payInfo = payService.getPayInfo(param);
		model.addAttribute("payInfo", payInfo);
		System.out.println(payInfo);
		return ResponseEntity.ok().body(payInfo); 
	}//
	
	//결제 성공 후 PAY테이블 insert
	@PostMapping("/paySuccess")
	@ResponseBody
	public ResponseEntity<?> paySuccess(@RequestParam Map<String, String> param){
		System.out.println("ajax paySuccess");
		System.out.println(param);
		
		return  ResponseEntity.ok().body(payService.paySuccess(param));
	}//paySuccess()
	
	//결제완료 페이지
	@GetMapping("/completepay")
	public String completepay(@RequestParam Map<String, String> param,  Model model, HttpSession session,HttpServletRequest request) {
		System.out.println("PayController completepay()");
		String MEM_ID = (String)session.getAttribute("MEM_ID");
		String PRO_NO = request.getParameter("PRO_NO");
		String MEM_NO = request.getParameter("MEM_NO");
		param.put("MEM_ID", MEM_ID);
		param.put("PRO_NO", PRO_NO);
		param.put("MEM_NO", MEM_NO);
		System.out.println(param);
		
		Map<String, String> completePay = payService.getCompletePay(param);
		System.out.println(completePay);
		model.addAttribute("completePay", completePay);
		return "/pay/completepay";
	}// completepay
	
	//결제 완료시 상품 거래상태 update  TM1 > TM2 update ajax
	@PostMapping("/payProUpdate")
	@ResponseBody
	public ResponseEntity<?> payProUpdate(@RequestParam Map<String, String> param){
		System.out.println("ajax payProUpdate");
		System.out.println("ajax payProUpdate" + param);
		return  ResponseEntity.ok().body(payService.payProUpdate(param));
	}//payProUpdate()	
	
}
