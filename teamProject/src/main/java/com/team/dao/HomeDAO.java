package com.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.team.mappers.homeMapper";

	public List<Map<String, String>> getSaleProductList() {
		return sqlSession.selectList(namespace+".getSaleProductList");
	}
	
	public List<Map<String, String>> getBuyProductList() {
		return sqlSession.selectList(namespace+".getBuyProductList");
	}
	
	public List<Map<String, String>> getDivProductList() {
		return sqlSession.selectList(namespace+".getDivProductList");
	}
	
	public List<Map<String, String>> getAucProductList() {
		return sqlSession.selectList(namespace+".getAucProductList");
	}

	public List<Map<String, String>> getProductList(String str) {
		return sqlSession.selectList(namespace+".getProductList", str);
	}
}
