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
	
	//배송지 1개 orderby select
	public List<Map<String, String>> getMemAddBasic(Map<String, String> map2) {
		return sqlSession.selectList(namespace + ".getMemAddBasic", map2);
	}
	
	//회원 배송지리스트 select
	public List<Map<String, String>> getAddList(String sId) {
		return sqlSession.selectList(namespace + ".getAddList", sId);
	}
	
	//회원 배송지등록 insert
	public int addDelivery(Map<String, String> param) {
		return sqlSession.insert(namespace + ".addDelivery", param);
	}
	
	//회원 수정할 배송지 select
	public Map<String, String> getaddDelivery(Map<String, String> param){
		System.out.println(param);
		return sqlSession.selectOne(namespace + ".getaddDelivery", param);
	}

	//회원 배송지 수정 update
	public int addDeliveryUpdate1(Map<String, String> param) {
		System.out.println(param);
		return sqlSession.update(namespace + ".addDeliveryUpdate1",param);
	}

	//회원 배송지 삭제 delete
	public int addDeliveryDelete(Map<String, String> param) {
		System.out.println(param);
		return sqlSession.delete(namespace + ".addDeliveryDelete", param);
	}

	//판매,결제자 Info select ajax
	public Map<String, String> getPayInfo(Map<String, String> param) {
		return sqlSession.selectOne(namespace + ".getPayInfo", param);
	}

	//결제 성공 후 PAY테이블 insert
	public int paySuccess(Map<String, String> param) {
		System.out.println(param);
		return sqlSession.insert(namespace + ".paySuccess", param);
	}

//	//배송요청사항 SELECT (공통코드)
//	public List<Map<String, String>> getRequestDel() {
//		return sqlSession.selectList(namespace + ".getRequestDel");
//	}

	

	

}
