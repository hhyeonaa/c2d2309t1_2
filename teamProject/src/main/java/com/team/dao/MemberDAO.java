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
	public Map<String, String> getMember(String MEM_ID, Map<String, String> map) {
		System.out.println("MemberDAO getMember()");
		return sqlSession.selectOne(namespace + "getMember", MEM_ID);
	}// getMember()
//	-----------------------------------------------------------------------------		
	public int idCheck(String MEM_ID) {
		System.out.println("MemberDAO idCheck()");
		return sqlSession.selectOne(namespace + "idCheck", MEM_ID);
	}// idCheck()
//	-----------------------------------------------------------------------------		
	public int nickCheck(String MEM_NICK) {
		System.out.println("MemberDAO nickCheck()");
		return sqlSession.selectOne(namespace + "nickCheck", MEM_NICK);
	}// nickCheck()
//	-----------------------------------------------------------------------------		
	public int emailCheck(String MEM_EMAIL) {
		System.out.println("MemberDAO emailCheck()");
		return sqlSession.selectOne(namespace + "emailCheck", MEM_EMAIL);
	}// emailCheck()
//	-----------------------------------------------------------------------------	
	public Map<String, String> findEmail(Map<String, String> map){
		System.out.println("MemberDAO findEmail()");
		return sqlSession.selectOne(namespace + "findEmail", map);
	}// findEmail()
//	-----------------------------------------------------------------------------	
	public Map<String, String> login(Map<String, String> map) {
		System.out.println("MemberDAO login()");
		return sqlSession.selectOne(namespace + "login", map);
	}// login()
//	-----------------------------------------------------------------------------	
	public Map<String, String> socialLogin(Map<String, String> map) {
		System.out.println("MemberDAO socialLogin()");
		return sqlSession.selectOne(namespace + "socialLogin", map);
	}// socialLogin()
//	-----------------------------------------------------------------------------	
	public Map<String, String> mypage(String MEM_ID) {
		System.out.println("MemberDAO mypage()");
		System.out.println("" + sqlSession.selectOne(namespace + "mypage", MEM_ID));
		return sqlSession.selectOne(namespace + "mypage", MEM_ID);
	}// mypage()
//	-----------------------------------------------------------------------------
	public void memberEdit(Map<String, String> map) {
		System.out.println("MemberDAO memberEdit()");
		sqlSession.update(namespace + "memberEdit", map);
	}// memberEdit()
	
	
}// MemberDAO 클래스
