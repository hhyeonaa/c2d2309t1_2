package com.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.MemberService;

@Controller
@RequestMapping("/**/mainSideBar")
public class FooterController {
	
	@Inject
	private MemberService memberService;
	
	@GetMapping
	@ResponseBody
	public ResponseEntity<?> search(HttpSession session) {
		
		String ses = (String)session.getAttribute("MEM_ID");
		Boolean isTrue = ses == null;
		List list = new ArrayList();

		Map<String, Boolean> sessionIsEmpty = new HashMap<>();
		sessionIsEmpty.put("isTrue", isTrue);
		list.add(sessionIsEmpty);
		
		Map<String, String> likeList = new HashMap<>();
		likeList.put("count", isTrue ? "" : memberService.countLike(ses));
		list.add(likeList);
		
		return ResponseEntity.ok().body(list);
	}
	
}
