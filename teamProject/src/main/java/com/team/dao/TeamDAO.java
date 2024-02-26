package com.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TeamDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.team.mappers.teamMapper.";	
	
	public List<Map<String, String>> selectCodeList(Map<String, String> code) {
		return sqlSession.selectList(namespace + "selectCodeList", code);
	}
	
	public Map<String, String> selectCode(Map<String, String> code) {
		return sqlSession.selectOne(namespace + "selectCode", code);
	}
}
