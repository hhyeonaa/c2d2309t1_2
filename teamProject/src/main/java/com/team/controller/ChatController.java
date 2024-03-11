package com.team.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.team.util.EnumCodeType;
import com.team.service.TeamCodeService;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@Inject
	private TeamCodeService codeService;
	
	@GetMapping("/chatting")
	public String chatting(Model model, HttpSession session) {
		model.addAttribute("dcm", codeService.selectCodeList(EnumCodeType.신고항목, session));
		return "/chat/chatting";
	}// chatting()
	
}// 클래스 끝