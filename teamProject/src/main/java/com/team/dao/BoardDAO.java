package com.team.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.team.mappers.board";
	
	public Map<String,String> select(Map<String, String> map) {
		System.out.println("BoardDAO select()");
		return sqlSession.selectOne(NAMESPACE + ".select", map);
	} // 테스트용 select()

}// BoardDAO 끝
