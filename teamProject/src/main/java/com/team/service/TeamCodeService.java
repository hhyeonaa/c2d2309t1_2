package com.team.service;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.TeamDAO;
import com.team.util.CodeTypeNullException;
import com.team.util.EnumCodeType;
import com.team.util.TeamCodeClassDesign;

@Service
public class TeamCodeService implements TeamCodeClassDesign{

	@Inject
	private TeamDAO dao;
	
	
	
//	public Map<String, String> messageForAjax(String code, Object[] arr) {
//		Map<String, String> codeSelect = dao.selectCode(selectOneCode(code, null));
//		String message = MessageFormat.format(codeSelect.get(EnumCodeType.코드내용.getType()), arr);
//		
//		codeSelect.clear();
//		codeSelect.put(EnumCodeType.코드내용.getType(), message);
//		
//		return codeSelect;
//	}

//	@Override
//	public Map<String, String> messageForAjax(String code, Object[] arr) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	
	
//	@Override
//	public List<Map<String, String>> selectListCode(String code) {
//		return null;
//	}

	private Map<String, String> selectOneCode(String code, String code2) {
		
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
	
	@Override
	public Map<String, String> messageForAjax(String code, Object[] arr) {
		// TODO Auto-generated method stub
		return null;
	}

	public Map<String, String> selectOneCode(String code) {
		return dao.selectCode(selectOneCode(code, null));
	}

	@Override
	public List<Map<String, String>> showCodeList(EnumCodeType codeType) {
		String table = EnumCodeType.코드테이블.getType().trim();
		Map<String, String> code = new HashMap<String, String>();
		
		if(EnumCodeType.메세지.toString().trim().equals(codeType.toString().trim())) {
			table = EnumCodeType.메세지테이블.getType().toString().trim();
		}
		code.put("tableName", table);
		code.put("codeType", codeType.getType().trim());
		List<Map<String, String>> selectCodeList = dao.selectCodeList(code);
		
		System.out.println("< " + codeType.toString().trim() + " >");
		System.out.println(EnumCodeType.코드타입.getType() + " + " + EnumCodeType.코드번호.getType() + " / " + EnumCodeType.코드내용.getType());
		
		selectCodeList.forEach(t -> System.out.println(
			t.get(EnumCodeType.코드타입.getType().trim()) + 
			t.get(EnumCodeType.코드번호.getType().trim()) + "  :  " +
			t.get(EnumCodeType.코드내용.getType().trim()))
		);
		System.out.println();
		
		return selectCodeList;
	}
	
//	@Override
//	public int hashCode() {
//		throw new UnsupportedOperationException("해당 클래스는 hashCode() 메서드 사용 불가");
//	}
//	@Override
//	public boolean equals(Object obj) {
//		throw new UnsupportedOperationException("해당 클래스는 equals() 메서드 사용 불가");
//	}
//	@Override
//	protected Object clone() throws CloneNotSupportedException {
//		throw new UnsupportedOperationException("해당 클래스는 clone() 메서드 사용 불가");
//	}
//	@Override
//	public String toString() {
//		throw new UnsupportedOperationException("해당 클래스는 toString() 메서드 사용 불가");
//	}
//	@Override
//	protected void finalize() throws Throwable {
//		throw new UnsupportedOperationException("해당 클래스는 finalize() 메서드 사용 불가");
//	}
	
}


