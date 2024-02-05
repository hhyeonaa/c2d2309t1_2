package com.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@GetMapping("/chatting")
	public String chatting() {
		System.out.println("ChatController chatting()");
		return "/chat/chatting";
	}// saleBoard()
	
	@GetMapping("/chattingRoom")
	public String chattingRoom() {
		System.out.println("ChatController chattingRoom()");
		return "/chat/chattingRoom";
	}// saleBoard()
	
}// 클래스 끝