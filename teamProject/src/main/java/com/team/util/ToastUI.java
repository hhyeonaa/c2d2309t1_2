package com.team.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

//request 에서 name 값 금지 목록
//=> "page", "perPage"
public class ToastUI {
	
	// parameter 설명
	// req  : @RequestParam 으로 가져온 Map (페이징 처리로 쓰여질 "page", "perPage" 가 담겨옴)
	// data : 화면에 뿌려줄 List 타입의 데이터
	public static ResponseEntity<?> resourceData(Map<String, String> req, List data){
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("page", Integer.parseInt(req.get("page")));
		pageMap.put("totalCount", data.size());
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("pagination", pageMap);
		dataMap.put("contents", data);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("data", dataMap);
		result.put("result", data.size() > 0 ? true : false);
		
		return ResponseEntity.ok().body(result);
	}
}
