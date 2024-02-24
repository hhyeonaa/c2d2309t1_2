package com.team.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.team.service.TeamService;
import com.team.util.EnumCodeType;


@RestController
@RequestMapping(value= "/**/alert")
public class TeamAjaxController {
	
	@Inject
	private TeamService teamService;
	
	@GetMapping
	@ResponseBody
//	public String alert(@RequestParam Map<String, String> param, @PathVariable String b) {
	public ResponseEntity<?> alert(@RequestParam Map<String, String> param, HttpServletRequest request) {
		System.out.println(param);
		
		System.out.println(request.getContextPath());
		
//		param.get();
		
		Map<String, String> map = new HashMap();
		map.put("message", "안녕하세요");
		
		return ResponseEntity.ok().body(map);
	}
	
}
