package com.team.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

public interface TeamCodeClassDesign {

	void submitForAlert(HttpServletResponse response, String code, Object[] msg);
	
	List<Map<String, String>> selectCodeList(EnumCodeType codeType);
	Map<String, String> selectCode(String code);
	default Map<String, String> selectCode(String code, Object[] arr){
		return null;
	};
	
}

