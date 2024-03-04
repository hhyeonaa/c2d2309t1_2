package com.team.service;


import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.PayDAO;

@Service
public class PayService {
	@Inject
	private PayDAO payDAO;

//	// 배송지 저장
//	public void insertAddress(Map<String, String> map) {
//		System.out.println("PayService insertAddress");
//		payDAO.insertAddress(map);
//	}
}
