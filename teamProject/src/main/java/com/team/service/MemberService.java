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
		memberDAO.insertMember(map);
	}// insertMemeber()
//	-----------------------------------------------------------------------------	
	public boolean adminLogin(Map<String, String> map) {
		return memberDAO.adminLogin(map);
	}// adminLogin()
}// MemberService 클래스
