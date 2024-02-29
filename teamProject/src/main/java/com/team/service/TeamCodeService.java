package com.team.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.team.dao.TeamDAO;
import com.team.util.CodeTypeNullException;
import com.team.util.EnumCodeType;

@Service
public class TeamCodeService {

	@Inject
	private TeamDAO dao;
	
	public void submitForAlert(HttpServletResponse response, String code, Object[] msg) {
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			Map<String, String> codeSelect = dao.selectCode(tableNameCheck(code));
			
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

	public List<Map<String, String>> selectCodeList(String codeType, HttpSession session, boolean check) {
		return selectCodes(EnumCodeType.valueOf(codeType), session, check);
	}
	
	public List<Map<String, String>> selectCodeList(String codeType, HttpSession session) {
		return selectCodes(EnumCodeType.valueOf(codeType), session, false);
	}

	public List<Map<String, String>> selectCodeList(EnumCodeType codeType, HttpSession session ,boolean check) {
		return selectCodes(codeType, session, check);
	}
	
	public List<Map<String, String>> selectCodeList(EnumCodeType codeType, HttpSession session) {
		return selectCodes(codeType, session, false);
	}
	
	public Map<String, String> selectCode(String code) {
		
		Map<String, String> selectCode = dao.selectCode(tableNameCheck(code));
		try {
			if(selectCode == null) {
	        	throw new CodeTypeNullException(code);
	        }
		} catch (CodeTypeNullException e) {
			e.printStackTrace();
		}
		
		return selectCode;
	}
	
	public Map<String, String> selectCode(String code, Object[] arr) {
		return ajaxForAlert(code, arr);
	}
	
	private List<Map<String, String>> selectCodes(EnumCodeType codeType, HttpSession session, boolean check) {
		
		String table = EnumCodeType.코드테이블.getType().trim();
		String hideCheck = EnumCodeType.사용가능항목.getType();
		String ses = (String)session.getAttribute("MEM_ID");
		Map<String, String> code = new HashMap<String, String>();
		
		if(EnumCodeType.메세지.toString().trim().equals(codeType.toString().trim())) {
			table = EnumCodeType.메세지테이블.getType().toString().trim();
		}
		
		if(!ses.equals("1") || !ses.equals("2") || !ses.equals("3")) {
			ses = "";
		}
		
		if(check) {
			hideCheck = EnumCodeType.전체보기.getType();
		}
		code.put("tableName", table);
		code.put("codeType", codeType.getType().trim());
		code.put("hideCheck", hideCheck);
		code.put("AD_ROLE", ses);
		List<Map<String, String>> selectCodeList = dao.selectCodeList(code);
		
		try {
			if(selectCodeList == null) {
	        	throw new CodeTypeNullException(codeType.getType().trim());
	        }
			
			System.out.println("< " + codeType.toString().trim() + " >");
			System.out.println(EnumCodeType.코드타입.getType() + " + " + EnumCodeType.코드번호.getType() + " / " + EnumCodeType.코드내용.getType());
			
			selectCodeList.forEach(t -> System.out.println(
				t.get(EnumCodeType.코드타입.getType().trim()) + 
				t.get(EnumCodeType.코드번호.getType().trim()) + "  :  " +
				t.get(EnumCodeType.코드내용.getType().trim()))
			);
			System.out.println();
			
		} catch (CodeTypeNullException e) {
			e.printStackTrace();
		}
		
		return selectCodeList;
	}
	
	private Map<String, String> ajaxForAlert(String code, Object[] arr) {
		
		Map<String, String> selectCode = dao.selectCode(tableNameCheck(code));
		try {
			if(selectCode == null) {
	        	throw new CodeTypeNullException(code);
	        }
			String message = MessageFormat.format(selectCode.get(EnumCodeType.코드내용.getType()), arr);
			
			selectCode.clear();
			selectCode.put(EnumCodeType.코드내용.getType(), message);
		} catch (CodeTypeNullException e) {
			e.printStackTrace();
		}
		
		return selectCode;
	}

	private Map<String, String> tableNameCheck(String code) {
		
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
