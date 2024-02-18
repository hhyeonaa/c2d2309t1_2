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
	
	public List<Map<String, String>> selectCodeList(String codeType) {
		System.out.println("여기좀 와바바");
		System.out.println("DAO 왔다");
		return sqlSession.selectList(namespace + "selectCodeList", codeType);
	}
}
