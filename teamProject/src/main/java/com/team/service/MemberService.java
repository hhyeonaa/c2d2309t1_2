package com.team.service;

import java.util.List;
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
	public Map<String, String> memCheck(String MEM_PW, Map<String, String> map) {
		System.out.println("MemberService memCheck()");
		return memberDAO.memCheck(MEM_PW, map); 
	}// memCheck()
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
	public Map<String, String> findId(Map<String, String> map) {
		System.out.println("MemberService findId()");
		return memberDAO.findId(map);
	}// findId()
//	-----------------------------------------------------------------------------	
	public Map<String, String> findPw(Map<String, String> map) {
		System.out.println("MemberService findPw()");
		return memberDAO.findId(map);
	}// findPw()
//	-----------------------------------------------------------------------------	
	public int pwUpdate(Map<String, String> findPw) {
		System.out.println("MemberService pwUpdate()");
		return memberDAO.pwUpdate(findPw);
	}// pwUpdate()
//	-----------------------------------------------------------------------------	
	public Map<String, String> mypage(String MEM_ID) {
		System.out.println("MemberService mypage()");
		return memberDAO.mypage(MEM_ID); 
	}// mypage()
//	-----------------------------------------------------------------------------	
	public int memberEdit(Map<String, String> map) {
		System.out.println("MemberService memberEdit()");
		return memberDAO.memberEdit(map);
	}// insertMemeber()
	
	public void updateProfileImagePath(String memberId, String filePath) {
        // 회원의 프로필 이미지 경로를 업데이트하는 로직
    }
//	-----------------------------------------------------------------------------	
	public List<Map<String, String>> myListSell(String MEM_ID) {
		System.out.println("MemberService myListSell()");
		return memberDAO.myListSell(MEM_ID); 
	}// myListSell()
//	-----------------------------------------------------------------------------	
	public List<Map<String, String>> myListBuy(String MEM_ID) {
		System.out.println("MemberService myListBuy()");
		return memberDAO.myListBuy(MEM_ID); 
	}// myListBuy()
//	-----------------------------------------------------------------------------	
	public List<Map<String, String>> myListShare(String MEM_ID) {
		System.out.println("MemberService myListShare()");
		return memberDAO.myListShare(MEM_ID); 
	}// myListShare()
//	-----------------------------------------------------------------------------	
	public List<Map<String, String>> myListAuction(String MEM_ID) {
		System.out.println("MemberService myListAuction()");
		return memberDAO.myListAuction(MEM_ID); 
	}// myListAuction()
//	-----------------------------------------------------------------------------	
	public Map<String, String> deleteCheck(Map<String, String> map) {
		System.out.println("MemberService deleteCheck()");
		return memberDAO.deleteCheck(map); 
	}// deleteCheck()
//	-----------------------------------------------------------------------------	
	public void memberDelete(Map<String, String> map) {
		System.out.println("MemberService memberDelete()");
		System.out.println(map + " ~~~~~~~~~~map~~~~~~~~~~~~~");
		memberDAO.memberDelete(map);
	}// memberDelete()
//	-----------------------------------------------------------------------------	
	public void resetImage(String MEM_ID) {
		System.out.println("MemberService resetImage()");
		memberDAO.resetImage(MEM_ID);
	}// insertMemeber()
//	-----------------------------------------------------------------------------	
	public List<Map<String, String>> likeList(String MEM_ID) {
		return memberDAO.likeList(MEM_ID);
	}// likeList()
//	-----------------------------------------------------------------------------	
	public List<Map<String, String>> likeListSelect(Map<String, String> map) {
		return memberDAO.likeListSelect(map);
	} // likeListSelect()
//	-----------------------------------------------------------------------------	
	public boolean deleteLike(String LIK_NO) {
		return memberDAO.deleteLike(LIK_NO);
	} // deleteLike()
//	-----------------------------------------------------------------------------	
	public boolean insertLike(Map<String, String> map) {
		return memberDAO.insertLike(map);
	} // insertLike()
//	-----------------------------------------------------------------------------	
	public List<Map<String, String>> myTrade(String MEM_ID) {
		System.out.println("MemberService myTrade()");
		return memberDAO.myTrade(MEM_ID); 
	}// myTrade() 
//	-----------------------------------------------------------------------------	
	public List<Map<String, String>> otherTrade(String MEM_ID) {
		System.out.println("MemberService otherTrade()");
		return memberDAO.otherTrade(MEM_ID); 
	}// otherTrade()
//	-----------------------------------------------------------------------------	
	public List<Map<String, String>> trading(String MEM_ID) {
		System.out.println("MemberService trading()");
		return memberDAO.trading(MEM_ID); 
	}// trading()
//	-----------------------------------------------------------------------------	
	public void changeState(Map<String, String> map) {
		System.out.println("MemberService changeState()");
		System.out.println(map + " changeState");
		memberDAO.changeState(map);
	}// memberDelete()

}// MemberService 클래스
