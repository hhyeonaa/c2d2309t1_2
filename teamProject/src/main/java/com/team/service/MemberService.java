package com.team.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.AdminDAO;
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
	public void userCheck(Map<String, String> map) {
		// TODO Auto-generated method stub
		
	}
}// MemberService 클래스
