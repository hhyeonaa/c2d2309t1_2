package com.team.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
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
import com.team.service.AdminService;
import com.team.service.TeamCodeService;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@Inject
	private TeamCodeService codeService;
	
	@Inject
	private AdminService adminService;
	
	
	@GetMapping("/chatting")
	public String chatting(Model model, HttpSession session) {
		model.addAttribute("dcm", codeService.selectCodeList(EnumCodeType.신고항목, session));
		System.out.println(codeService.selectCodeList(EnumCodeType.신고항목, session));
		return "/chat/chatting";
	}// chatting()
	
	@PostMapping("/chartReport")
	@ResponseBody
	public ResponseEntity<?> chartReport(@RequestParam Map<String, String> map, HttpSession session) {
		List<Map<String, String>> reportList = adminService.getReportList(map, session);
		
		System.out.println(map);
		System.out.println(map.get("rptCode"));
		
		return ResponseEntity.ok().body(reportList);
	}// chartReport()
	
}// 클래스 끝