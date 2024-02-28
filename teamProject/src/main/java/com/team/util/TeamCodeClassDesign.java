package com.team.util;

import java.util.List;
import java.util.Map;

public interface TeamCodeClassDesign {

	Map<String, String> messageForAjax(String code, Object[] arr);
	default List<Map<String, String>> selectListCode(String code) {
		return null;
	};
	default List<Map<String, String>> showCodeList(EnumCodeType codeType){
		return null;
	};
}

