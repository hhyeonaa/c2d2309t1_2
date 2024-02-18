package com.team.service;

import java.io.PrintWriter;
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
	
	public void showMessage(EnumCodeType codeType) {
		
		System.out.println(codeType.type.toString().trim());
		List<Map<String, String>> selectCodeList = dao.selectCodeList(codeType.type.toString().trim());
		String text = "-----" + codeType.toString() + "-----";
		for(int i = 0; i < selectCodeList.size(); i++) {
			text += selectCodeList.get(i).get("CO_NO") + selectCodeList.get(i).get("CODE") + "\n";
		}
		text += "----------";
		
		System.out.println(text);
	}
	
	public static void moveThePageAlert(HttpServletResponse response, String msg, String url) {
	    try {
	        response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        w.write("<script>alert('" + msg + "');location.href='" + urlCheck(url) + "';</script>");
	        w.flush();
	        w.close();
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public static void historyBackAlert(HttpServletResponse response, String msg) {
	    try {
	        response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        w.write("<script>alert('" + msg + "');history.go(-1);</script>");
	        w.flush();
	        w.close();
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public static void onlyAlert(HttpServletResponse response, String msg) {
	    try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter w = response.getWriter();
			w.write("<script>alert('" + msg + "');</script>");
			w.flush();
			w.close();
	    } catch(Exception e) {
			e.printStackTrace();
	    }
	}
	
	public static void confirm(HttpServletResponse response, String msg, String url, boolean historyback) {
	    try {
	        response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();
	        String text = ""; 
	        
	        if(historyback) {
	        	text = "else { history.go(-1);}";
	        }
	        
	        w.write(  "<script>"
	        	   + "if(confirm('" + msg + "')){"
	        	   +     "location.href='" + urlCheck(url) + "';"
	        	   + "}" + text 
	        	   + "</script>"
	        	   )
	        	   ;
	        w.flush();
	        w.close();
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public static String urlCheck(String url) {
		if(url.contains("/")) {
			url = url.split("/")[1].trim();
		} 
		return url;
	}
}
