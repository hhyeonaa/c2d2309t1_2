package com.team.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.google.protobuf.DescriptorProtos.SourceCodeInfo.Location;
import com.team.dao.TeamDAO;
import com.team.util.EnumCodeType;

@Service
public class TeamService {

	@Inject
	private TeamDAO dao;
	
	public void showCodeList(EnumCodeType codeType) {
			
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
//		return abc(selectCodeList, codeType);
	}
	
	
	public void moveThePageAlert(HttpServletResponse response, String code, Object[] msg, String url) {
		moveThePageAlert(response, null, code, msg, url);
	}
	public void moveThePageAlert(HttpServletResponse response, HttpServletRequest request, String code, Object[] msg, String url) {
	    try {
	        response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        String codeSelect = dao.selectCode(codes(code));
	        String urlText = "history.go(-1);";
	        
	        if(codeSelect == null || codeSelect.equals("")) {
	        	throw new CodeTypeNullException(code);
	        }
	        
	        if(request != null) {
	        	urlText = "location.href='" + request.getServletPath() + "';";
	        }
	        
	        w.write("<script>alert('" + MessageFormat.format(codeSelect.trim(), msg) + "');" + urlText + "</script>");
	        w.flush();
	        w.close();
	    } catch(CodeTypeNullException | IOException e) {
	    	e.printStackTrace();
	    } 
	}
	
	public void onlyAlert(HttpServletResponse response, String code, Object[] msg) {
	    try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			String codeSelect = dao.selectCode(codes(code));
			
			if(codeSelect == null || codeSelect.equals("")) {
	        	throw new CodeTypeNullException(code);
	        }

			w.write("<script>alert('" + MessageFormat.format(codeSelect.trim(), msg) + "');</script>");
			w.flush();
			w.close();
	    } catch(CodeTypeNullException | IOException e) {
	    	e.printStackTrace();
	    }
	}
	
	public void confirm(HttpServletResponse response, String code, Object[] msg, String successUrl) {
		/* failUrl 입력 안받을시 confirm 함수 false시 자동으로 뒤로가기 설정 */
		confirm(response, code, msg, successUrl, null);
	}
	public void confirm(HttpServletResponse response, String code, Object[] msg, String successUrl, String failUrl) {
	    try {
	        response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        String codeSelect = dao.selectCode(codes(code));
			
	        if(codeSelect == null || codeSelect.equals("")) {
	        	throw new CodeTypeNullException(code);
	        }
	        
	        if(failUrl == null) {
	        	failUrl = "history.go(-1);";
	        }
			
//	        System.out.println("여기까지 왔나?");
	        w.write( "<script>"
	        	   + "if(confirm('" + MessageFormat.format(codeSelect.trim(), msg) + "')){"
	        	   +     "location.href='" + urlCheck(successUrl) + "';"
	        	   + "} else {"
	        	   + 	 failUrl
	        	   + "}"
	        	   + "</script>"
	        	   )
	        	   ;
	        w.flush();
	        w.close();
	    } catch(CodeTypeNullException | IOException e) {
	    	e.printStackTrace();
	    }
	}
	
	public String urlCheck(String url) {
		if(url.contains("/")) {
			url = url.split("/")[1].trim();
		} 
		return url;
	}
	
	public Map<String, String> codes(String code) {
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
	
//	public EnumCodeType abc(List<Map<String, String>> data, EnumCodeType codeType) {
//		List<Map<String, String>> dataList = new ArrayList<Map<String, String>>();
//		List<Map<String, String>> newDataList = new ArrayList<Map<String, String>>();
//		dataList.forEach(t -> {
//			t.put(t.get(EnumCodeType.코드타입.getType().trim()) + t.get(EnumCodeType.코드타입.getType().trim()) 
//			, t.get(EnumCodeType.코드내용.getType().trim()));
//			newDataList.add(t);
//		});
//		codeType.setList(newDataList);
//		
//		return codeType;
//	}
	
}

@SuppressWarnings("serial")
class CodeTypeNullException extends RuntimeException {
	private static final String errorMsg = " (코드타입)에 해당하는 코드내용이 테이블에 존재하지 않거나, 사용불가 합니다.";
    public CodeTypeNullException(String msg) {
        super(" " + msg + errorMsg); 
    }
}


