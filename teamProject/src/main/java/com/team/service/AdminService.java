package com.team.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.team.dao.AdminDAO;

@Service
public class AdminService {

	@Inject
	private AdminDAO adminDAO;

//	----- 현아 시작 -----
	
	public void adminInsert(Map<String, String> map) {
		adminDAO.adminInsert(map);
	}

	public List<Map<String, String>> getAdminList() {
		return adminDAO.getAdminList();
	}

	public boolean idCheck(Map<String, String> map) {
		return adminDAO.idCheck(map);
	}

	public void adminDelete(Map<String, String> map) {
		adminDAO.adminDelete(map);
	}
	
	public void adminUpdate(Map<String, String> map) {
		adminDAO.adminUpdate(map);
	}

//	public List<Map<String, String>> getBoardList() {
//		return adminDAO.getBoardList();
//	}
	
	public boolean displayUpdate(List<Map<String, String>> result) {
		return adminDAO.displayUpdate(result);
	}

//	public List<Map<String, String>> getCategoryList() {
//		return adminDAO.getCategoryList();
//	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	----- 현아 끝 -----
	
	
	
//	----- 무창 시작 -----
	
	public boolean codeInsert(List<Map<String, String>> result) {
		return adminDAO.codeInsert(result);
	}
	
	public boolean codeUpdate(List<Map<String, String>> result) {
		return adminDAO.codeUpdate(result);
	}
	
	public boolean codeDelete(List<Map<String, String>> result) {
		return adminDAO.codeDelete(result);
	}
	
	public List<Map<String, String>> codeSelect(List<Map<String, String>> newData) {
		return adminDAO.codeSelect(newData);
	}
	
	public boolean messageInsert(List<Map<String, String>> result) {
		return adminDAO.messageInsert(result);
	}
	
	public boolean messageUpdate(List<Map<String, String>> result) {
		return adminDAO.messageUpdate(result);
	}
	
	public boolean messageDelete(List<Map<String, String>> result) {
		return adminDAO.messageDelete(result);
	}
	
//	----- 무창 끝 -----
	
	
	
//	----- 성엽 시작 -----
	
	public List<Map<String, String>> getMemberList() {
		return adminDAO.getMemberList();
	}//

	public List<Map<String, String>> getContentboardList() {
		return adminDAO.getContentboardList();
	}//

	public boolean memberStop(Map<String, String> dto) {
		return adminDAO.memberStop(dto);
	}//
	
	public int contentDelete(String PRO_NO) {
		return adminDAO.contentDelete(PRO_NO);
	}//
	
	public int cateContentDelete(String PRO_NO) {
		return adminDAO.cateContentDelete(PRO_NO);
	}//

	public List<Map<String, String>> getBoardCategoryList(Map<String, String> param) {
		return adminDAO.getBoardCategoryList(param);
	}//

	public void inputForm(Map<String, String> map) {
		adminDAO.inputForm(map);
	}

	public List<Map<String, String>> getForm(Map<String, String> map) {
		return adminDAO.getForm(map);
	}
	
	// 신고리스트 불러오기
	public int insertReport(Map<String, String> map) {
		return adminDAO.insertReport(map);
	}//
	
	public List<Map<String, String>> getReportList() {
		return adminDAO.getReportList();
	}//


//	----- 성엽 끝 -----

}
