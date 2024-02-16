package com.team.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.team.mappers.member.";
//	-----------------------------------------------------------------------------	
	public void insertMember(Map<String, String> map) {
		sqlSession.insert(namespace + "insertmember", map);
	}// insertMember()
//	-----------------------------------------------------------------------------	
}// MemberDAO 클래스
