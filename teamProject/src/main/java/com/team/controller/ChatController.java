package com.team.controller;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
	public String chatting() {
		System.out.println("ChatController chatting()");
		return "/chat/chatting";
	}// chatting()
	
	@GetMapping("/roomCheck")
	public ResponseEntity<?> roomCheck() {
		
		System.out.println("enter : roomCheck");
		
		return ResponseEntity.ok().body("1");
	}
	
}// 클래스 끝