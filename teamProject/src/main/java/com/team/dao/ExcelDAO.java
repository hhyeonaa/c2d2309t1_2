package com.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ExcelDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String NAMESPACE = "com.team.mappers.excel";
	
//	public int insertData(Map<String, Object> insertData) {
//		System.out.println(session.selectList(NAMESPACE+".insertData", insertData));
//		return 1;
//	}
	
	public int insertData(Map<String, Object> insertData) {
		return session.insert(NAMESPACE+".insertData", insertData);
	}

	public Map<String, String> getfieldName(Map<String, String> param) {
		return session.selectOne(NAMESPACE+".getfieldName", param);
		
	}
}
