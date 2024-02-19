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
import com.team.util.EnumCodeType;

@Service
public class TeamService {

	@Inject
	private TeamDAO dao;
	
	public void showCodeList(EnumCodeType codeType) {
		
		List<Map<String, String>> selectCodeList = dao.selectCodeList(codeType.type.toString().trim());
		String text = "\n----------" + codeType.toString() + "----------\n";
		for(int i = 0; i < selectCodeList.size(); i++) {
			text += selectCodeList.get(i).get("CO_TYPE") + " " + selectCodeList.get(i).get("CO_NO") + " | " + selectCodeList.get(i).get("CODE") + "\n";
		}
		text += "-------------------------\n";
		System.out.println(text);
	}
	
	public void moveThePageAlert(HttpServletResponse response, String code, Object[] msg, String url) {
	    try {
	        response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        String codeSelect = dao.selectCode(codes(code));
	        
	        if(codeSelect == null || codeSelect.equals("")) {
	        	throw new CustomErrorException(code);
	        }
	        
	        w.write("<script type='text/javascript'>alert('" + MessageFormat.format(codeSelect.trim(), msg) + "');location.href='" + url + "';</script>");
	        w.flush();
	        w.close();
	    } catch(CustomErrorException | IOException e) {
	    	e.printStackTrace();
	    } 
	}
	
	public void historyBackAlert(HttpServletResponse response, String code, Object[] msg) {
	    try {
	        response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        String codeSelect = dao.selectCode(codes(code));
	        
	        if(codeSelect == null || codeSelect.equals("")) {
	        	throw new CustomErrorException(code);
	        }
	        
	        w.write("<script type='text/javascript'>alert('" + MessageFormat.format(codeSelect.trim(), msg) + "');history.go(-1);</script>");
	        w.flush();
	        w.close();
	    } catch(CustomErrorException | IOException e) {
	    	e.printStackTrace();
	    }
	    
	}
	
	public void onlyAlert(HttpServletResponse response, String code, Object[] msg) {
	    try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			String codeSelect = dao.selectCode(codes(code));
			
			if(codeSelect == null || codeSelect.equals("")) {
	        	throw new CustomErrorException(code);
	        }
			
			w.write("<script type='text/javascript'>alert('" + MessageFormat.format(codeSelect.trim(), msg) + "');</script>");
			w.flush();
			w.close();
	    } catch(CustomErrorException | IOException e) {
	    	e.printStackTrace();
	    }
	}
	
	public void confirm(HttpServletResponse response, String code, Object[] msg, String url, boolean historyback) {
	    try {
	        response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        String text = ""; 
	        String codeSelect = dao.selectCode(codes(code));
			
	        if(codeSelect == null || codeSelect.equals("")) {
	        	throw new CustomErrorException(code);
	        }
			
	        if(historyback) {
	        	text = "else { history.go(-1);}";
	        }
//	        System.out.println("여기까지 왔나?");
	        w.write( "<script type='text/javascript'>"
	        	   + "if(confirm('" + MessageFormat.format(codeSelect.trim(), msg) + "')){"
	        	   +     "location.href='" + urlCheck(url) + "';"
	        	   + "}" + text 
	        	   + "</script>"
	        	   )
	        	   ;
	        w.flush();
	        w.close();
	    } catch(CustomErrorException | IOException e) {
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
    	codes.put("CO_TYPE", code.replaceAll("[0-9]", ""));
    	codes.put("CO_NO", code.replaceAll("[^0-9]", ""));
    	return codes;
	}
	
}

class CustomErrorException extends RuntimeException {
	private static final String msg2 = "(코드타입)에 해당하는 코드내용이 테이블에 존재하지 않거나, 사용불가 합니다.";
	
    public CustomErrorException(String msg) {
        super(msg + msg2); // 부모 Exception 클래스 생성자도 호출
    }
}
