package com.team.service;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.MemberDAO;
import com.team.dao.PayDAO;

@Service
public class PayService {
	@Inject
	private PayDAO payDAO;
	@Inject
	private MemberDAO memberDAO;

	//결제할 상품 정보 select
	public Map<String, String> getPayProList(Map<String, String> map) {
		return payDAO.getPayProList(map);
	}
	
	//회원 배송지 목록 select
	public List<Map<String, String>> getMemAdd(Map<String, String> map2) {
		return payDAO.getMemAdd(map2);
	}
	//추후 수정
	public List<Map<String, String>> getMemAddBasic(Map<String, String> map2) {
		return payDAO.getMemAddBasic(map2);
	}
	//회원 배송지리스트 select
	public List<Map<String, String>> getAddList(Map<String, String> param) {
		return payDAO.getAddList(param);
	}
	
	//회원 배송지등록 insert
	public int addDelivery(Map<String, String> param) {
		return payDAO.addDelivery(param);
	}
	
	//회원 수정할 배송지 select
	public Map<String, String> getaddDelivery(Map<String, String> param) {
		return payDAO.getaddDelivery(param);
	}


//	// 배송지 저장
//	public void insertAddress(Map<String, String> map) {
//		System.out.println("PayService insertAddress");
//		payDAO.insertAddress(map);
//	}
}
