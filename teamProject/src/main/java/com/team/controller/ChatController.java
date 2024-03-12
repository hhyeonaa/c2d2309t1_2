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
import com.team.util.ToastUI;
import com.team.service.AdminService;
import com.team.service.ChatService;
import com.team.service.TeamCodeService;

@Controller
@RequestMapping("/chat/*")
public class ChatController {
	
	@Inject
	private TeamCodeService codeService;
	
	@Inject
	private AdminService adminService;
	
	@Inject
	private ChatService chatService;
	
	@GetMapping("/chatting")
	public String chatting(Model model, HttpSession session) {
		model.addAttribute("dcm", codeService.selectCodeList(EnumCodeType.신고항목, session));
		System.out.println(codeService.selectCodeList(EnumCodeType.신고항목, session));
		return "/chat/chatting";
	}// chatting()
	
	@PostMapping("/insertReport")
	@ResponseBody
	public ResponseEntity<?> insertReport(@RequestParam Map<String, String> map, HttpSession session) {
		
		System.out.println("아이디 확인: " + session.getAttribute("MEM_ID"));
		map.put("MEM_ID", (String)session.getAttribute("MEM_ID"));
		System.out.println(map);
		
		return ResponseEntity.ok().body(adminService.insertReport(map));
	}// chartReport()

	// -------- 준우 시작 -------------------
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
	
	@PostMapping("/insertChat")
	public ResponseEntity<?> insertChat(@RequestParam Map<String, String> param) {
		return ResponseEntity.ok().body(chatService.insertChat(param));
	}
	
	@GetMapping("/getChatting")
	public ResponseEntity<?> getChatting(@RequestParam Map<String, String> param) {
		System.out.println("enter : getChatting");
		return ResponseEntity.ok().body(chatService.getChatting(param));
	}
	
	
	// -------- 준우 끝 -------------------
	
}// 클래스 끝