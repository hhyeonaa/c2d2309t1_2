package com.team.util;

public enum EnumCodeType {
	메세지("AM"), 카테고리("CM"), 신고항목("DCM"), 가격범위("PM"), 거래상태("TM"), 배송안내문구("DLM");
	public String type;
	
	private EnumCodeType() {}
	private EnumCodeType(String type_) {
		type = type_;
	}
}


