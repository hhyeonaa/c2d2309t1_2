package com.team.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.team.service.TeamCodeService;
import com.team.util.EnumCodeType;


@RestController
@RequestMapping(value= "/**/alert")
public class TeamAjaxController {
	
	@Inject
	private TeamCodeService codeService;
	
	@GetMapping
	@ResponseBody
	public ResponseEntity<?> alert(@RequestParam MultiValueMap<String, Object> param, HttpSession session) {
		Object[] arr = param.get("msgArr[]").toArray();
		Map<String, String> params = new HashMap<String, String>();
		
		params = codeService.selectMessage(param.get("msgText").get(0).toString(), arr, session);
		params.put("isConfirm", param.get("msgIsTrue").get(0).toString());
		
		return ResponseEntity.ok().body(params);
	}
	
}
