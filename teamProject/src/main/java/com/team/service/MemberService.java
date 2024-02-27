package com.team.service;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import com.team.dao.MemberDAO;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;
//	-----------------------------------------------------------------------------	
	public void insertMemeber(Map<String, String> map) {
		System.out.println("MemberService insertMemeber()");
		memberDAO.insertMember(map);
	}// insertMemeber()
//	-----------------------------------------------------------------------------	
	public Map<String, String> adminLogin(Map<String, String> map) {
		System.out.println("MemberService adminLogin()");
		return memberDAO.adminLogin(map); 
	}// adminLogin()
//	-----------------------------------------------------------------------------	
	public Map<String, String> login(Map<String, String> map) {
		System.out.println("MemberService login()");
		return memberDAO.login(map); 
	}// login()
//	-----------------------------------------------------------------------------	
	public Map<String, String> socialLogin(Map<String, String> map) {
		System.out.println("MemberService socialLogin()");
		return memberDAO.socialLogin(map); 
	}// socialLogin()
//	-----------------------------------------------------------------------------	
	public Map<String, String> getMember(String MEM_ID, Map<String, String> map) {
		System.out.println("MemberService getMember()");
		return memberDAO.getMember(MEM_ID, map); 
	}// getMember()
//	-----------------------------------------------------------------------------	
	public int idCheck(String MEM_ID) {
		System.out.println("MemberService idCheck()");
		return memberDAO.idCheck(MEM_ID);
	}// idCheck()
//	-----------------------------------------------------------------------------	
	public int nickCheck(String MEM_NICK) {
		System.out.println("MemberService nickCheck()");
		return memberDAO.nickCheck(MEM_NICK);
	}// nickCheck()
//	-----------------------------------------------------------------------------	
	public int emailCheck(String MEM_EMAIL) {
		System.out.println("MemberService emailCheck()");
		return memberDAO.emailCheck(MEM_EMAIL);
	}// emailCheck()
//	-----------------------------------------------------------------------------	
	public Map<String, String> findEmail(Map<String, String> map) {
		System.out.println("MemberService findEmail()");
		return memberDAO.findEmail(map);
	}// findEmail()
//	-----------------------------------------------------------------------------	
	public Map<String, String> mypage(String MEM_ID) {
		System.out.println("MemberService mypage()");
		return memberDAO.mypage(MEM_ID); 
	}// mypage()
//	-----------------------------------------------------------------------------	
	public void memberEdit(Map<String, String> map) {
		System.out.println("MemberService memberEdit()");
		memberDAO.memberEdit(map);
	}// insertMemeber()
	
	
}// MemberService 클래스
