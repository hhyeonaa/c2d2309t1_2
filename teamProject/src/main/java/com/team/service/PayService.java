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

//	// 배송지 저장
//	public void insertAddress(Map<String, String> map) {
//		System.out.println("PayService insertAddress");
//		payDAO.insertAddress(map);
//	}
}
