package com.team.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.team.mappers.chatMapper.";
	
	public String roomCheck(Map<String, String> param) {
		System.out.println(param);
		sqlSession.selectOne(namespace + "roomCheck", param);
		return null;
	}

}
