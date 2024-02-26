package com.team.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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

	public void adminDelete(String AD_NO) {
		adminDAO.adminDelete(AD_NO);
	}
	
	public void adminUpdate(Map<String, String> map) {
		adminDAO.adminUpdate(map);
	}

	public List<Map<String, String>> getBoardList() {
		return adminDAO.getBoardList();
	}
	
	public void displayUpdate(Map<String, String> map) {
		adminDAO.displayUpdate(map);
	}

	public List<Map<String, String>> getCategoryList() {
		return adminDAO.getCategoryList();
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	----- 현아 끝 -----
	
	
	
//	----- 무창 시작 -----
	
	
	
//	----- 무창 끝 -----
	
	
	
//	----- 성엽 시작 -----
	
	public List<Map<String, String>> getMemberList() {
		
		return adminDAO.getMemberList();
	}//

	public List<Map<String, String>> getContentberList() {
		
		return adminDAO.getContentberList();
	}//

	public void memberDelete(String MEM_NO) {
		adminDAO.memberDelete(MEM_NO);
	}//
	
	public void contentDelete(String PRO_NO) {
		adminDAO.contentDelete(PRO_NO);
	}//

	
//	----- 성엽 끝 -----

}
