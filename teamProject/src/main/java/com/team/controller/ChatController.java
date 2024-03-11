package com.team.controller;

import java.util.List;
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
		Map<String, String> result = chatService.roomCheck(param);
		return ResponseEntity.ok().body(result.get("result"));
	}
	
	@GetMapping("/createRoom")
	public ResponseEntity<?> createRoom(@RequestParam Map<String, String> param) {
		return ResponseEntity.ok().body(chatService.createRoom(param));
	}
	
	@GetMapping("/chatRoomData")
	public ResponseEntity<?> chatRoomData(@RequestParam Map<String, String> param) {
		return ResponseEntity.ok().body(chatService.chatRoomData(param));
	}
	
	
}// 클래스 끝