package com.team.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

public interface TeamCodeClassDesign {

	void submitForAlert(HttpServletResponse response, String code, Object[] msg);
	Map<String, String> ajaxForAlert(String code, Object[] arr);
	List<Map<String, String>> selectListCode(EnumCodeType codeType);
	Map<String, String> selectOneCode(String code);
	
	default Map<String, String> selectCode(String code, String code2) {
		
		Map<String, String> codes = new HashMap<String, String>();
		String codeType = code.replaceAll("[0-9]", "");
		String tableName = EnumCodeType.코드테이블.getType().toString().trim();
		
    	codes.put(EnumCodeType.코드타입.getType().trim(), codeType);
    	codes.put(EnumCodeType.코드번호.getType().trim(), code.replaceAll("[^0-9]", ""));
    	
    	if(codeType.equals(EnumCodeType.메세지.getType().trim())) {
    		tableName = EnumCodeType.메세지테이블.getType().toString().trim();
    	}
    	codes.put("tableName", tableName);
    	
    	return codes;
	}
}

