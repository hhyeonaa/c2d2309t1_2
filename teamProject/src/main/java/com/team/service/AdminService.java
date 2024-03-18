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

	public boolean idCheck(Map<String, String> map) {
		return adminDAO.idCheck(map);
	}
	
	public void adminInsert(Map<String, String> map) {
		adminDAO.adminInsert(map);
	}

	public List<Map<String, String>> getAdminList(Map<String, String> map) {
		return adminDAO.getAdminList(map);
	}

	public void adminDelete(Map<String, String> map) {
		adminDAO.adminDelete(map);
	}
	
	public void adminUpdate(Map<String, String> map) {
		adminDAO.adminUpdate(map);
	}

	public boolean displayUpdate(List<Map<String, String>> result) {
		return adminDAO.displayUpdate(result);
	}

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
	
	public boolean messageInsert(Map<String, String> result) {
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
	}

	public boolean memberStop(List<Map<String, String>> dto) {
		return adminDAO.memberStop(dto);
	}
	
	public List<Map<String, String>> insertReport(Map<String, String> map) {
		return adminDAO.insertReport(map);
	}
	
	public List<Map<String, String>> getReportList() {
		return adminDAO.getReportList();
	}
	
	public List<Map<String, String>> getContentboardList() {
		return adminDAO.getContentboardList();
	}
	
	public void boardUpdate(List<Map<String, String>> result) {
		adminDAO.boardUpdate(result);
	}

	// ---- chart 시작 -----
	public List<Map<String, String>> getMemberCntList(Map<String, String> param) {
		return adminDAO.getMemberCntList();
	}
	
	public List<Map<String, String>> getCategoryCntList(Map<String, String> param) {
		return adminDAO.getCategoryCntList();
	}
	
	public List<Map<String, String>> getTotalTradeList(Map<String, String> param) {
		return adminDAO.getTotalTradeList();
	}

//	----- 성엽 끝 -----

}
