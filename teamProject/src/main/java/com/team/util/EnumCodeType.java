package com.team.util;

import java.util.List;
import java.util.Map;

public enum EnumCodeType {
	메세지("AM"), 
	카테고리항목("CM"), 
	신고항목("DCM"), 
	가격범위("PM"), 
	거래상태("TM"), 
	배송안내문구("DLM"),
	메뉴항목("MM"),
	코드번호("CO_NO"),
	코드타입("CO_TYPE"),
	코드내용("CODE"),
	메세지테이블("MESSAGE"),
	코드테이블("CODE"),
	전체보기("\"1\", \"0\""), 
	사용가능항목("0");
	private String type;
	private List<Map<String, String>> list;
	
	private EnumCodeType() {}
	private EnumCodeType(String type_) {
		this.type = type_;
	}
	private EnumCodeType(String type_, List<Map<String, String>> list_) {
		this.type = type_;
		this.list = list_;
	}
	
	public String getType() {
		return type;
	}
	
}
