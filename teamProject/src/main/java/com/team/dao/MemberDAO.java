package com.team.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.team.mappers.memberMapper.";
//	-----------------------------------------------------------------------------	
	public void insertMember(Map<String, String> map) {
		System.out.println("MemberDAO insertmember()");
		sqlSession.insert(namespace + "insertmember", map);
	}// insertMember()
//	-----------------------------------------------------------------------------	
	public Map<String, String> adminLogin(Map<String, String> map) {
		System.out.println("MemberDAO adminLogin()");
		return sqlSession.selectOne(namespace + "adminLogin", map);
	}// adminLogin()
//	-----------------------------------------------------------------------------	
	public Map<String, String> login(Map<String, String> map) {
		System.out.println("MemberDAO login()");
		return sqlSession.selectOne(namespace + "login", map);
	}// login()
//	-----------------------------------------------------------------------------	
	public Map<String, String> mypage(Map<String, String> map) {
		System.out.println("MemberDAO mypage()");
		return sqlSession.selectOne(namespace + "mypage", map);
	}// mypage()
//	-----------------------------------------------------------------------------	
}// MemberDAO 클래스
