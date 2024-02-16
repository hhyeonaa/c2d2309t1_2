package com.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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
		return (boolean)sqlSession.selectOne(namesqace + "idCheck");
	}

	public void adminDelete(String AD_NO) {
		sqlSession.delete(namesqace + "adminDelete", AD_NO);
	}
	
//	----- 현아 끝 -----
	
	
	
//	----- 무창 시작 -----
	
	
//	----- 무창 끝 -----
	
	
	
//	----- 성엽 시작 -----
	
	
	
//	----- 성엽 끝 -----	
	
	
}
