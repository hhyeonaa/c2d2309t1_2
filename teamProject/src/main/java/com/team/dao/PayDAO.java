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
	private static final String namespace1 = "com.team.mappers.memberMapper.";
	
	//결제할 상품 정보 select
	public Map<String, String> getPayProList(Map<String, String> map) {
		return sqlSession.selectOne(namespace + ".getPayProList",map);
	}

	//회원 배송지 목록  select
	public List<Map<String, String>> getMemAdd(Map<String, String> map2) {
		return sqlSession.selectList(namespace + ".getMemAdd", map2);
	}
	
//	// 배송지 저장
//	public void insertAddress(Map<String, String> map) {
//		sqlSession.insert(namespace + ".insertAddress", map); 
//	}

}
