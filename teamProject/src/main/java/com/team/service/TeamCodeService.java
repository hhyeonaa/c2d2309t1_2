package com.team.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.team.dao.TeamDAO;
import com.team.util.CodeTypeNullException;
import com.team.util.EnumCodeType;
import com.team.util.TeamCodeClassDesign;

@Service
public class TeamCodeService implements TeamCodeClassDesign {

	@Inject
	private TeamDAO dao;
	
	@Override
	public void submitForAlert(HttpServletResponse response, String code, Object[] msg) {
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			Map<String, String> codeSelect = dao.selectCode(tableNameCheck(code, null));
			
			if(codeSelect == null) {
	        	throw new CodeTypeNullException(code);
	        }

			w.write("<script>alert('" + MessageFormat.format(codeSelect.get(EnumCodeType.코드내용.getType()), msg) + "');</script>");
			w.flush();
			w.close();
	    } catch(CodeTypeNullException | IOException e) {
	    	e.printStackTrace();
	    }
	}

	@Override
	public List<Map<String, String>> selectCodeList(EnumCodeType codeType) {
		// TODO Auto-generated method stub
		return selectCodeList(codeType, false);
	}

	@Override
	public List<Map<String, String>> selectCodeList(EnumCodeType codeType, boolean check) {
		
		String table = EnumCodeType.코드테이블.getType().trim();
		String hideCheck = EnumCodeType.사용가능항목.getType(); 
		Map<String, String> code = new HashMap<String, String>();
		
		if(EnumCodeType.메세지.toString().trim().equals(codeType.toString().trim())) {
			table = EnumCodeType.메세지테이블.getType().toString().trim();
		}
		
		if(check) {
			hideCheck = EnumCodeType.전체보기.getType();
		}
		code.put("tableName", table);
		code.put("codeType", codeType.getType().trim());
		code.put("hideCheck", hideCheck);
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
	
	@Override
	public Map<String, String> selectCode(String code) {
		return dao.selectCode(tableNameCheck(code, null));
	}
	
	@Override
	public Map<String, String> selectCode(String code, Object[] arr) {
		return ajaxForAlert(code, arr);
	}
	
	private Map<String, String> ajaxForAlert(String code, Object[] arr) {
		Map<String, String> codeSelect = dao.selectCode(tableNameCheck(code, null));
		String message = MessageFormat.format(codeSelect.get(EnumCodeType.코드내용.getType()), arr);
		
		codeSelect.clear();
		codeSelect.put(EnumCodeType.코드내용.getType(), message);
		
		return codeSelect;
	}

	private Map<String, String> tableNameCheck(String code, Object object) {
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


