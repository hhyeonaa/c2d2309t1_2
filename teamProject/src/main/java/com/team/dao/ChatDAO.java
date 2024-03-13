package com.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.team.mappers.chatMapper.";
	
	public Map<String, String> roomCheck(Map<String, String> param) {
		return sqlSession.selectOne(namespace + "roomCheck", param);
	}

	public String createRoom(Map<String, String> param) {
		return Integer.toString(sqlSession.insert(namespace + "createRoom", param));
	}

	public List<Map<String, String>> chatRoomData(Map<String, String> param) {
		return sqlSession.selectList(namespace + "chatRoomData", param);
	}

	public int insertChat(Map<String, String> param) {
		return sqlSession.insert(namespace + "insertChat", param);
	}

	public List<Map<String, String>> getChatting(Map<String, String> param) {
		return sqlSession.selectList(namespace + "getChatting", param);
	}

	public int changePostState(Map<String, String> param) {
		return sqlSession.update(namespace + "changePostState", param);
	}

	public int outChat(Map<String, String> param) {
		System.out.println(param);
		return sqlSession.update(namespace + "outChat", param);
	}

}
