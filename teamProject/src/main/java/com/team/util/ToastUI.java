package com.team.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.google.gson.Gson;

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
//	[abcd] 1, 4
	// 코드 개판. 수정 必
	public static List<Map<String, String>> getRealData(String jsonStr){
		System.out.println(jsonStr);
		Gson gson = new Gson();
		Map<String, Object> map = gson.fromJson(jsonStr, Map.class);
		System.out.println(map);
 		ArrayList<Map> list = (ArrayList<Map>)map.get(map.keySet().toString().substring(1, map.keySet().toString().length() - 1));
 		
 		List<Map<String, String>> result = new ArrayList();
 		for(int i = 0; i < list.size(); i++) {
 			Map<String, Object> map2 = list.get(i);
 	 		Map<String, String> map3 = new HashMap();
 	 		
 	 		Iterator<Map.Entry<String,Object>> it = map2.entrySet().iterator();
 	 		while(it.hasNext()) {
 	 			Map.Entry<String,Object> entry = it.next();
 	 			if(entry.getValue() == null ) break;
 	 			try {
 	 		    	  double d = Double.parseDouble(entry.getValue().toString());
 	 		    	  int a = (int)d;
 	 		    	 map3.put(entry.getKey(), a+"");
 	 		    } catch (NumberFormatException e) {
 	 		    	map3.put(entry.getKey(), entry.getValue().toString());
 	 		    }
 	 		}
 	 		result.add(map3);
 		}
 		
 		return result;
	}

	public static List<Map<String, String>> getRealData(Map<String, String> deletedRows) {
		System.out.println(deletedRows);
		List<Map<String, String>> result = new ArrayList();
		System.out.println(deletedRows.keySet());
		System.out.println(deletedRows.keySet().size());
		int max = -1;
		for(String key : deletedRows.keySet()) {
			String s = key.charAt(12) + "";
			int i = 13;
			while(true) {
				if(key.charAt(i) == ']') break;
				s += key.charAt(i++);
			}
			int num = Integer.parseInt(s) + 1;
			if(max < num) max = num; 
		}
		
		System.out.println(max);
		int real = deletedRows.keySet().size() / max - 6;
		System.out.println("real" + real);
		Map<String, String> map = new HashMap<>();
		
		int i = 1;
		Iterator<Map.Entry<String,String>> it = deletedRows.entrySet().iterator();
		while(it.hasNext()) {
			System.out.println("시작 i : " + i);
			Map.Entry<String,String> entry = it.next();
			if(i <= real) {
				if(entry.getValue() == "") {
					i++;
					continue;
				};
				System.out.println(i);
				System.out.println(entry.getKey().substring(entry.getKey().lastIndexOf("[")+1, entry.getKey().length() - 1));
				map.put(entry.getKey().substring(entry.getKey().lastIndexOf("[")+1, entry.getKey().length() - 1), entry.getValue());
				System.out.println("맵 : " + map);
			}
			i++;
			if(i > deletedRows.keySet().size() / max) {
				System.out.println("이때의 맵은? " + map);
				result.add(map);
				System.out.println("넣고나서의 리시트는? " + result);
				map = new HashMap<>();
				i = 1;
			}
		}
		
		System.out.println(result);
		
		return result;
	}
}
