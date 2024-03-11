package com.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namesqace = "com.team.mappers.adminMapper.";
	
//	----- 현아 시작 -----
	
	public void adminInsert(Map<String, String> map) {
		sqlSession.insert(namesqace + "adminInsert", map);
	}

	public List<Map<String, String>> getAdminList() {
		return sqlSession.selectList(namesqace + "getAdminList");
	}

	public boolean idCheck(Map<String, String> map) {
		String result = sqlSession.selectOne(namesqace + "idCheck", map);
		if(result == null) {
			return false;
		}
		return true;
	}

	public void adminDelete(String AD_NO) {
		sqlSession.delete(namesqace + "adminDelete", AD_NO);
	}
	
	public void adminUpdate(Map<String, String> map) {
		sqlSession.update(namesqace + "adminUpdate", map);
	}

//	public List<Map<String, String>> getBoardList() {
//		return sqlSession.selectList(namesqace + "getBoardList");
//	}

	public void displayUpdate(Map<String, String> map) {
		System.out.println("실행되나?: " + sqlSession.update(namesqace + "displayUpdate", map));
		sqlSession.update(namesqace + "displayUpdate", map);
	}
	
//	public List<Map<String, String>> getCategoryList() {
//		return sqlSession.selectList(namesqace + "getCategoryList");
//	}

	public void inputForm(Map<String, String> map) {
		sqlSession.insert(namesqace + "inputForm", map);
	}
	
	public List<Map<String, String>> getForm(Map<String, String> map) {
		return sqlSession.selectList(namesqace + "getForm", map);
	}
	
	
	
	
	
	
	
	
	
	
//	----- 현아 끝 -----
	
	
	
//	----- 무창 시작 -----
	
	
//	----- 무창 끝 -----
	
	
	
//	----- 성엽 시작 -----
	
	public List<Map<String, String>> getMemberList() {
		return sqlSession.selectList(namesqace + "getMemberList");
	}//

	public List<Map<String, String>> getContentboardList() {
		return sqlSession.selectList(namesqace + "getContentboardList");
	}//

	public boolean memberStop(Map<String, String> dto) {
		return sqlSession.update(namesqace + "memberStop", dto) == 1 ? true : false;
	}//
	
	public int contentDelete(String PRO_NO) {
		return sqlSession.delete(namesqace + "contentDelete", PRO_NO);
	}//
	
	public int cateContentDelete(String PRO_NO) {
		return sqlSession.delete(namesqace + "cateContentDelete", PRO_NO);
	}//

	public List<Map<String, String>> getBoardCategoryList(Map<String, String> param) {
		return sqlSession.selectList(namesqace + "getBoardCategoryList", param);
	}//

	public List<Map<String, String>> getReportList() {
		return sqlSession.selectList(namesqace + "getReportList");
	}//
	
	// 신고리스트 불러오기
	public List<Map<String, String>> getReportList(Map<String, String> map, HttpSession session) {
		return sqlSession.selectList(namesqace + "getReportList", map);
	}
	
//	----- 성엽 끝 -----	
	
	


}
