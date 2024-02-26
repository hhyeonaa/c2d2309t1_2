package com.team.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
//	public String alert(@RequestParam Map<String, String> param, @PathVariable String b) {
	public ResponseEntity<?> alert(@RequestParam MultiValueMap<String, Object> param) {

		Map<String, String> params = new HashMap<String, String>();
		Object[] arr = param.get("msgArr[]").toArray();
		
		params = codeService.selectCode(param.get("msgText").get(0).toString(), arr);
		params.put("isConfirm", param.get("msgIsTrue").get(0).toString());
		
		return ResponseEntity.ok().body(params);
	}
	
}
