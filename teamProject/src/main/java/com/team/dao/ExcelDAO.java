package com.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ExcelDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String NAMESPACE = "com.team.mappers.excel";
	
	public List<Map<String, String>> selectData() {
		return session.selectList(NAMESPACE+".selectData");
	}
}
