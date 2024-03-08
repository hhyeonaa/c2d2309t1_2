package com.team.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team.util.EnumCodeType;
import com.team.service.ChatService;
import com.team.service.TeamCodeService;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@Inject
	private TeamCodeService codeService;
	
	@Inject
	private ChatService chatService;
	
	@GetMapping("/chatting")
	public String chatting() {
		System.out.println("ChatController chatting()");
		return "/chat/chatting";
	}// chatting()
	
	@GetMapping("/roomCheck")
	public ResponseEntity<?> roomCheck(@RequestParam Map<String, String> param) {
		
		System.out.println("enter : roomCheck");
		
		String result = chatService.roomCheck(param);
		
		return ResponseEntity.ok().body("1");
	}
	
}// 클래스 끝