package com.team.dao;

import java.util.List;
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
	public Map<String, String> memCheck(String MEM_EMAIL, Map<String, String> map) {
		System.out.println("MemberDAO memCheck()");
		return sqlSession.selectOne(namespace + "memCheck", MEM_EMAIL);
	}// memCheck()
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
	public Map<String, String> findId(Map<String, String> map){
		System.out.println("MemberDAO findId()");
		return sqlSession.selectOne(namespace + "findId", map);
	}// findId()
//	-----------------------------------------------------------------------------	
	public Map<String, String> findPw(Map<String, String> map){
		System.out.println("MemberDAO findPw()");
		return sqlSession.selectOne(namespace + "findId", map);
	}// findPw()
//	-----------------------------------------------------------------------------	
	public Map<String, String> login(Map<String, String> map) {
		System.out.println("MemberDAO login()");
		return sqlSession.selectOne(namespace + "login", map);
	}// login()
//	-----------------------------------------------------------------------------	
	public Map<String, String> socialLogin(Map<String, String> map) {
		System.out.println("MemberDAO socialLogin()");
		System.out.println("MemberDAO socialLogin()" + map);
		return sqlSession.selectOne(namespace + "socialLogin", map);
	}// socialLogin()
//	-----------------------------------------------------------------------------	
	public int pwUpdate(Map<String, String> findPw) {
		System.out.println("MemberDAO pwUpdate()");
		return sqlSession.update(namespace + "pwUpdate", findPw);
	}// pwUpdate()
//	-----------------------------------------------------------------------------	
	public Map<String, String> mypage(String MEM_ID) {
		System.out.println("MemberDAO mypage()");
		return sqlSession.selectOne(namespace + "mypage", MEM_ID);
	}// mypage()
//	-----------------------------------------------------------------------------
	public int memberEdit(Map<String, String> map) {
		System.out.println("MemberDAO memberEdit()");
		return sqlSession.update(namespace + "memberEdit", map);
	}// memberEdit()
//	-----------------------------------------------------------------------------
	public List<Map<String, String>> myListSell(String MEM_ID) {
		System.out.println("MemberDAO myListSell()");
		return sqlSession.selectList(namespace + "myListSell", MEM_ID);
	}// myListSell()
//	-----------------------------------------------------------------------------
	public List<Map<String, String>> myListBuy(String MEM_ID) {
		System.out.println("MemberDAO myListBuy()");
		return sqlSession.selectList(namespace + "myListBuy", MEM_ID);
	}// myListBuy()
//	-----------------------------------------------------------------------------
	public List<Map<String, String>> myListShare(String MEM_ID) {
		System.out.println("MemberDAO myListShare()");
		return sqlSession.selectList(namespace + "myListShare", MEM_ID);
	}// myListShare()
//	-----------------------------------------------------------------------------
	public List<Map<String, String>> myListAuction(String MEM_ID) {
		System.out.println("MemberDAO myListAuction()");
		return sqlSession.selectList(namespace + "myListAuction", MEM_ID);
	}// myListAuction()
//	-----------------------------------------------------------------------------	
	public Map<String, String> deleteCheck(Map<String, String> map) {
		System.out.println("MemberDAO deleteCheck()");
		return sqlSession.selectOne(namespace + "deleteCheck", map);
	}// deleteCheck()
//	-----------------------------------------------------------------------------	
	public void memberDelete(Map<String, String> map) {
		System.out.println("MemberDAO memberDelete()");
		System.out.println(map + "  !@#$%");
		sqlSession.update(namespace + "memberDelete", map);
	}// memberDelete()
//	-----------------------------------------------------------------------------
	public void resetImage(String MEM_ID) {
		System.out.println("MemberDAO resetImage()");
		sqlSession.update(namespace + "resetImage", MEM_ID);
	}// resetImage()	
//	-----------------------------------------------------------------------------
	public List<Map<String, String>> likeList(String MEM_ID) {
		return sqlSession.selectList(namespace + "likeList", MEM_ID);
	}// likeList()	
//	-----------------------------------------------------------------------------
	public List<Map<String, String>> likeListSelect(Map<String, String> map) {
		return sqlSession.selectList(namespace + "likeListSelect", map);
	}// likeListSelect()	
//	-----------------------------------------------------------------------------
	public boolean deleteLike(String LIK_NO) {
		boolean result = (sqlSession.delete(namespace + "deleteLike", LIK_NO) == 1) ? true : false;
		System.out.println(result);
		return result;
	}// deleteLike()
//	-----------------------------------------------------------------------------
	public boolean insertLike(Map<String, String> map) {
		boolean result = (sqlSession.insert(namespace + "insertLike", map) == 1) ? true : false;
		return result;
	}// insertLike()
	//	-----------------------------------------------------------------------------
	public List<Map<String, String>> myTrade(String MEM_ID) {
		System.out.println("MemberDAO myTrade()");
		return sqlSession.selectList(namespace + "myTrade", MEM_ID);
	}// myTrade()
//	-----------------------------------------------------------------------------
	public List<Map<String, String>> otherTrade(String MEM_ID) {
		System.out.println("MemberDAO otherTrade()");
		return sqlSession.selectList(namespace + "otherTrade", MEM_ID);
	}// otherTrade() 
//	-----------------------------------------------------------------------------
	public List<Map<String, String>> trading(String MEM_ID) {
		System.out.println("MemberDAO trading()");
		return sqlSession.selectList(namespace + "trading", MEM_ID);
	}// trading()
//	-----------------------------------------------------------------------------	
	public void changeState(Map<String, String> map) {
		System.out.println("MemberDAO changeState()");
		System.out.println(map + "  changeState");
		sqlSession.update(namespace + "changeState", map);
	}// changeState()
	public String countList(String ses) {
		return sqlSession.selectOne(namespace + "countList", ses);
	}
	
	
}// MemberDAO 클래스
