package com.team.util;

import java.util.List;
import java.util.Map;

public interface TeamCodeClassDesign {

	Map<String, String> messageForAjax(String code, Object[] arr);
//	Map<String, String> selectOneCode(String code);
	List<Map<String, String>> selectListCode(String code);
}

