package com.team.service;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	//배송지 1개 orderby select
	public List<Map<String, String>> getMemAddBasic(Map<String, String> map2) {
		return payDAO.getMemAddBasic(map2);
	}
	//회원 배송지리스트 select
	public List<Map<String, String>> getAddList(HttpSession session) {
		return payDAO.getAddList((String)session.getAttribute("MEM_ID"));
	}
	
	//회원 배송지등록 insert
	public int addDelivery(Map<String, String> param) {
		return payDAO.addDelivery(param);
	}
	
	//회원 수정할 배송지 select
	public Map<String, String> getaddDelivery(Map<String, String> param) {
		return payDAO.getaddDelivery(param);
	}

	//회원 배송지 수정 update
	public int addDeliveryUpdate1(Map<String, String> param) {
		return payDAO.addDeliveryUpdate1(param);
	}

	//회원 배송지 삭제 delete
	public int addDeliveryDelete(Map<String, String> param) {
		return payDAO.addDeliveryDelete(param);
	}
	
	//판매,결제자 Info select ajax
	public Map<String, String> getPayInfo(Map<String, String> param) {
		return payDAO.getPayInfo(param);
	}

	//결제 성공 후 PAY테이블 insert
	public int paySuccess(Map<String, String> param) {
		return payDAO.paySuccess(param);
	}
	
	//결제완료 select
	public Map<String, String> getCompletePay(Map<String, String> param) {
		return payDAO.getCompletePay(param);
	}

	//배송요청사항 SELECT (공통코드)
//	public List<Map<String, String>> getRequestDel() {
//		return payDAO.getRequestDel();
//	}




//	// 배송지 저장
//	public void insertAddress(Map<String, String> map) {
//		System.out.println("PayService insertAddress");
//		payDAO.insertAddress(map);
//	}
}
