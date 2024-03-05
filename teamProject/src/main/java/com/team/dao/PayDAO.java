package com.team.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.team.mappers.payMapper";
	
	public List<Map<String, String>> getPayProList(Map<String, String> map) {
		return sqlSession.selectList(namespace + ".getPayList",map);
	}

//	// 배송지 저장
//	public void insertAddress(Map<String, String> map) {
//		sqlSession.insert(namespace + ".insertAddress", map); 
//	}

}
