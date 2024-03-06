package com.team.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface TeamCodeInterface {

	void submitForAlert(HttpServletResponse response, String code, Object[] msg);
	
	Map<String, String> selectCode(String code, HttpSession session);
	Map<String, String> selectMessage(String code, Object[] msg, HttpSession session);
	List<Map<String, String>> selectCodeList(EnumCodeType codeType, HttpSession session);
	List<Map<String, String>> selectMessageList(EnumCodeType codeType, HttpSession session);
	
	
}
