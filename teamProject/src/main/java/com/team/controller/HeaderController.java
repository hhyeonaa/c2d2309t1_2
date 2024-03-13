package com.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.TeamCodeService;
import com.team.util.EnumCodeType;
import com.team.util.ToastUI;

@Controller
@RequestMapping("/**/search")
public class HeaderController {
	
	@Inject
	TeamCodeService codeService;
	
	@GetMapping
	@ResponseBody
	public ResponseEntity<?> search(HttpSession session) {
		
		return ResponseEntity.ok().body(menuListReturn(session));
	}
	
	@GetMapping("/bar")
	@ResponseBody
	public ResponseEntity<?> searchBar(HttpSession session) {
		
	return ResponseEntity.ok().body(null);
	}
	
	private Map<String, List<Map<String, String>>> menuListReturn(HttpSession session) {
		List<Map<String, String>> codeList = codeService.selectCodeList(EnumCodeType.메뉴항목, session);
		List<Map<String, String>> urlList = new ArrayList<Map<String, String>>();
		Map<String, List<Map<String, String>>> dataList = new HashMap<>();
		
		codeList.forEach(t -> {
			Map<String, String> url = new HashMap<>();
			String code = t.get("CODE");
			    
		    switch (code) {
		        case "판매":
		            url.put("url", "/board/saleBoard");
		            break;
		        case "구매":
		            url.put("url", "/board/buyBoard");
		            break;
		        case "나눔":
		            url.put("url", "/board/divideBoard");
		            break;
		        case "경매":
		            url.put("url", "/board/auctionBoard");
		            break;
		        default:
		            url.put("url", "나눔경로");
		    }
		    
		    urlList.add(url);
		});
		dataList.put("MENU", codeList);
		dataList.put("URL", urlList);
		dataList.put("CATEGORY", codeService.selectCodeList(EnumCodeType.카테고리항목, session));
		dataList.put("TRADE", codeService.selectCodeList(EnumCodeType.거래상태, session));
		dataList.put("PRICE", codeService.selectCodeList(EnumCodeType.가격범위, session));
		
		return dataList;
	}
}
