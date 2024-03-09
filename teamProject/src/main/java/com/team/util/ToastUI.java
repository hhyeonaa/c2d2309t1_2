package com.team.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.http.ResponseEntity;

import com.google.gson.Gson;
import com.google.gson.JsonParser;

public class ToastUI {
	static final String[] IGNORE_KEY = {"rowKey", "_attributes"};
	static final Object[] IGNORE_VALUE = {com.google.gson.JsonNull.INSTANCE, ""};
	static String idx;
	static Map<String, String> map;
	
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
	// @RequestBody에 넘어온 String 타입의 createdRows, updatedRows
	// {A:[{B:.., C:.., D:..}]}
	public static List<Map<String, String>> getRealData(String jsonStr){
		System.out.println(jsonStr);
		List<Map<String, String>> realData = new ArrayList<>();
		
		JsonParser.parseString(jsonStr)													// String -> JsonElement
		  		  .getAsJsonObject()													// JsonElement -> JsonObject
		  		  .get(jsonStr.contains("createdRows") ? "createdRows" : "updatedRows") // JsonObject.get(name) => JsonElement (A에 대한 value)
		  		  .getAsJsonArray()														// JsonElement -> JsonArray (배열 객체로 변경)
		  		  .forEach(jsonElement -> {												// JsonArray 순회 (JsonElement가 담김, 이 경우 수정 및 삭제 1개씩 이므로 1번 순회)
			  		  Map<String, String> map = new HashMap<>();
			  		  
			  		  jsonElement.getAsJsonObject().asMap().forEach((k, v) -> {			// JsonElement -> JsonObject -> Map 순회 (B, C, D 가 담김) 
				  		  if(Arrays.stream(IGNORE_KEY).anyMatch(k::equals) || 
			  				 Arrays.stream(IGNORE_VALUE).anyMatch(v::equals)) return;
				  		  map.put(k, v.getAsString());									// 의미있는 값만 넣기
			  		  });
			  		  
			  		  realData.add(map);												
		  		  });
		System.out.println(realData);
 		return realData;
	}
	// @RequestParam에 넘어온 Map 타입의 deletedRows
	public static List<Map<String, String>> getRealData(Map<String, String> deletedRows) {
		System.out.println(deletedRows);
		List<Map<String, String>> realData = new ArrayList<>();
		
		deletedRows.entrySet()		
				   .stream()
				   .collect(Collectors.groupingBy(entry -> entry.getKey().replaceAll("[^0-9]",""))) // Map<String, List<Map.Entry<String, String>>>
				   .forEach((k, v) -> {
						Map<String, String> map = new HashMap<>();
						v.forEach(e -> {
							String kk = e.getKey();
							String vv = e.getValue();
							
							if(Arrays.stream(IGNORE_KEY).anyMatch(kk::contains) || 
							   Arrays.stream(IGNORE_VALUE).anyMatch(vv::equals)) return;
							map.put(kk.substring(kk.lastIndexOf("[")+1, kk.length()-1), vv);
						});
						
						realData.add(map);
				   });
		System.out.println(realData);
		return realData;
	}
}

