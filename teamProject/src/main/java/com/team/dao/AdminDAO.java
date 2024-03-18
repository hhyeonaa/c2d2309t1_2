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

	public List<Map<String, String>> getAdminList(Map<String, String> map) {
		return sqlSession.selectList(namesqace + "getAdminList", map);
	}

	public boolean idCheck(Map<String, String> map) {
		boolean result = (sqlSession.selectOne(namesqace + "idCheck", map) == null) ? false : true;
		return result;
	}

	public void adminDelete(Map<String, String> map) {
		sqlSession.delete(namesqace + "adminDelete", map);
	}
	
	public void adminUpdate(Map<String, String> map) {
		sqlSession.update(namesqace + "adminUpdate", map);
	}

	public boolean displayUpdate(List<Map<String, String>> result) {
		return sqlSession.update(namesqace + "displayUpdate", result) == 1 ? true : false;
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
	
	public boolean messageInsert(Map<String, String> result) {
		return sqlSession.insert(namesqace + "messageInsert", result) == 1 ? true : false;
	}
	
//	----- 무창 끝 -----
	
	
	
//	----- 성엽 시작 -----
	
	public List<Map<String, String>> getMemberList() {
		return sqlSession.selectList(namesqace + "getMemberList");
	}

	public boolean memberStop(List<Map<String, String>> dto) {
		return sqlSession.update(namesqace + "memberStop", dto) == 1 ? true : false;
	}
	
	public List<Map<String, String>> insertReport(Map<String, String> map) {
		return sqlSession.selectList(namesqace + "insertReport", map);
	}

	public List<Map<String, String>> getReportList() {
		return sqlSession.selectList(namesqace + "getReportList");
	}
	
	public List<Map<String, String>> getContentboardList() {
		return sqlSession.selectList(namesqace + "getContentboardList");
	}
	
	public void boardUpdate(List<Map<String, String>> result) {
		sqlSession.update(namesqace + "boardUpdate", result);
	}
	
	public List<Map<String, String>> getMemberCntList() {
		return sqlSession.selectList(namesqace + "getMemberCntList");
	}
	
	public List<Map<String, String>> getCategoryCntList() {
		return sqlSession.selectList(namesqace + "getCategoryCntList");
	}
	
	public List<Map<String, String>> getTotalTradeList() {
		return sqlSession.selectList(namesqace + "getTotalTradeList");
	}

//	----- 성엽 끝 -----	
	
	


}
