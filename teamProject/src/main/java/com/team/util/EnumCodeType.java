package com.team.util;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public enum EnumCodeType {
	메세지("AM"),
	메뉴항목("MM"),
	카테고리항목("CM"), 
	신고항목("DCM"), 
	가격범위("PM"), 
	거래상태("TM"), 
	배송안내문구("DLM"),
	상품상태("PS"),
	상세설명("DD"),
	코드번호("CO_NO"),
	코드타입("CO_TYPE"),
	코드내용("CODE"),
	전체코드타입("CODE_LIST"),
	입력폼항목("FO")
//	메세지테이블("MESSAGE"),
//	코드테이블("CODE"),
//	전체보기("\"1\", \"0\""), 
//	사용가능항목("0"),
	;
	private final String type_;
	
	private EnumCodeType(String type) {
		this.type_ = type;
	}
	
	public String getType() {
		return type_;
	}
	
	public List<Map<String, String>> getKeyList() {
		return EnumTotalCodeList.전체코드타입
								.getKeys();
	}
	
	public List<Map<String, String>> getValueList() {
		return EnumTotalCodeList.전체코드타입
								.getValues();
	}
	
	public EnumCodeType stringToEnumType(String type) {
		return EnumTotalCodeList.전체코드타입
								.stringToEnumType(type);
	}
	
}

enum EnumTotalCodeList{
	
	전체코드타입("CODE_LIST", EnumCodeType.values());
	
	private String str_;
	private EnumCodeType[] arr_;
	private EnumTotalCodeList(String str, EnumCodeType[] arr) {
		this.str_ = str;
		this.arr_ = arr;
	}
	
	protected String getStr_() {
		return str_;
	}

	protected EnumCodeType stringToEnumType(String str) {
	    return Arrays.stream(arr_)
	    		.filter(f -> f.getType().equals(str))
	            .findFirst()
	            .orElse(null);
	}
	
	protected List<Map<String, String>> getKeys() {
	    return getList(arr_, true);
	}
	
	protected List<Map<String, String>> getValues() {
		return getList(arr_, false);
	}
	
	private List<Map<String, String>> getList(EnumCodeType[] list, boolean isKeyOrValue){
		return Arrays.stream(list)
	            .filter(f -> !f.toString().contains("코드") && !f.toString().equals("메세지"))
	            .map(m -> {
	                String key = isKeyOrValue ? "key" : "value";
	                String value = isKeyOrValue ? m.toString().trim() : m.getType().trim();
	                return Map.of(key, value);
	            })
	            .collect(Collectors.toList());
	}
	
}
