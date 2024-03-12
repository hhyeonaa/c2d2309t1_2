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

	public boolean displayUpdate(List<Map<String, String>> result) {
		return sqlSession.update(namesqace + "displayUpdate", result) == 1 ? true : false;
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
	
	public boolean codeInsert(List<Map<String, String>> result) {
		return sqlSession.insert(namesqace + "codeInsert", result) == 1 ? true : false;
	}
	
	public boolean codeUpdate(List<Map<String, String>> result) {
		return sqlSession.update(namesqace + "codeUpdate", result) == 1 ? true : false;
	}
	
	public boolean codeDelete(List<Map<String, String>> result) {
		return sqlSession.delete(namesqace + "codeDelete", result) == 1 ? true : false;
	}

	public List<Map<String, String>> codeSelect(List<Map<String, String>> newData) {
		return sqlSession.selectList(namesqace + "codeSelect", newData);
	}
	
	public boolean messageUpdate(List<Map<String, String>> result) {
		return sqlSession.update(namesqace + "messageUpdate", result) == 1 ? true : false;
	}
	
	public boolean messageDelete(List<Map<String, String>> result) {
		return sqlSession.delete(namesqace + "messageDelete", result) == 1 ? true : false;
	}
	
	public boolean messageInsert(List<Map<String, String>> result) {
		return sqlSession.insert(namesqace + "messageInsert", result) == 1 ? true : false;
	}
	
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

	// 신고리스트 불러오기
	public int insertReport(Map<String, String> map) {
		return sqlSession.insert(namesqace + "insertReport", map);
	}//
	
	public List<Map<String, String>> getReportList() {
		return sqlSession.selectList(namesqace + "getReportList");
	}//
	
//	----- 성엽 끝 -----	
	
	


}
