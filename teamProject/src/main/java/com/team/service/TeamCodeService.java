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
import com.team.util.TeamCodeInterface;

@Service
public class TeamCodeService implements TeamCodeInterface{

	@Inject
	private TeamDAO dao;
	
	@Override
	public void submitForAlert(HttpServletResponse response, String code, Object[] msg, String url) {
		
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			String pageMove = "location.href = '" + url + "';";
			Map<String, String> codeSelect = dao.selectMessage(codeTextSeparate(code, null));
			
			if(codeSelect == null) {
	        	throw new CodeTypeNullException(code);
	        }
			if(url == null) {
				pageMove = "";
			}
			w.write("<script>"
				  + 	"alert('" + MessageFormat.format(codeSelect.get(EnumCodeType.코드내용.getType()), msg) + "');"
				  +		pageMove
				  + "</script>");
			w.flush();
			w.close();
	    } catch(CodeTypeNullException | IOException e) {
	    	e.printStackTrace();
	    }
	}
	
	public void submitForAlert(HttpServletResponse response, String code, Object[] msg) {
		submitForAlert(response, code, msg, null);
	}
	
	@Override
	public List<Map<String, String>> selectMessageList(EnumCodeType codeType, HttpSession session) {
		return selectCodes(codeType, session);
	}

	@Override
	public Map<String, String> selectMessage(String code, Object[] msg, HttpSession session) {
		return ajaxForAlert(code, msg, session);
	}

	@Override
	public List<Map<String, String>> selectCodeList(EnumCodeType codeType, HttpSession session) {
		return selectCodes(codeType, session);
	}
	
	@Override
	public Map<String, String> selectCode(String code, HttpSession session) {
		
		Map<String, String> selectCode = dao.selectCode(codeTextSeparate(code, session));
		try {
			if(selectCode == null) {
	        	throw new CodeTypeNullException(code);
	        }
		} catch (CodeTypeNullException e) {
			e.printStackTrace();
		}
		
		return selectCode;
	}
	
	private List<Map<String, String>> selectCodes(EnumCodeType codeType, HttpSession session) {
		
		String codeTypeName = codeType.getType().trim();
		String ses = (String)session.getAttribute("ROL_NO");
		Map<String, String> code = new HashMap<String, String>();
		
		if (ses instanceof String && !ses.equals("RO1") && !ses.equals("RO2") && !ses.equals("RO3")) {
		    ses = "";
		} 
		
		if(ses == null) {
		    ses = "";
		}
		
		code.put("codeType", codeTypeName);
		code.put("ROL_NO", ses);
		
		List<Map<String, String>> selectCodeList = codeTypeName.equals("AM") ? dao.selectMessageList(code) 
																		 	 : dao.selectCodeList(code)
																		 	 ;
		try {
			if(selectCodeList == null) {
	        	throw new CodeTypeNullException(codeType.getType().trim());
	        }
			
		} catch (CodeTypeNullException e) {
			e.printStackTrace();
		}
		
		return selectCodeList;
	}
	
	private Map<String, String> ajaxForAlert(String code, Object[] arr, HttpSession session) {
		
		Map<String, String> selectCode = dao.selectMessage(codeTextSeparate(code, session));
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

	private Map<String, String> codeTextSeparate(String code, HttpSession session) {
		String codeType = code.replaceAll("[0-9]", "");
		Map<String, String> codes = new HashMap<String, String>();
		
    	codes.put(EnumCodeType.코드타입.getType().trim(), codeType);
    	codes.put(EnumCodeType.코드번호.getType().trim(), code.replaceAll("[^0-9]", ""));
    	codes.put("AD_ROLE", session == null ? "" : (String)session.getAttribute("MEM_ID"));

    	return codes;
	}

}
