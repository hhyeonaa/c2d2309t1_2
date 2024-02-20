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
}
