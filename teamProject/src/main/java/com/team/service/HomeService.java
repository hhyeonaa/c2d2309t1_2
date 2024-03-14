package com.team.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.HomeDAO;

@Service
public class HomeService {
	@Inject
	private HomeDAO homeDAO;

	public List<Map<String, String>> getSaleProductList() {
		
		return homeDAO.getSaleProductList();
	}
	
	public List<Map<String, String>> getBuyProductList() {
		
		return homeDAO.getBuyProductList();
	}
	
	public List<Map<String, String>> getDivProductList() {
		
		return homeDAO.getDivProductList();
	}
	
	public List<Map<String, String>> getAucProductList() {
	
		return homeDAO.getAucProductList();
	}

	public List<Map<String, String>> getProductList(String str) {
		return homeDAO.getProductList(str);
	}
}
