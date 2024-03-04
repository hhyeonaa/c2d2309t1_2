package com.team.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.team.mappers.payMapper";


}
