package com.team.service;

import java.util.Map;

import javax.inject.Inject;

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
	public Map<String, String> mypage(String MEM_ID) {
		System.out.println("MemberService mypage()");
		return memberDAO.mypage(MEM_ID); 
	}// mypage()
}// MemberService 클래스
