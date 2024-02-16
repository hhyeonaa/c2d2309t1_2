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

	public List<Map<String, String>> getProductList() {
		
		return homeDAO.getProductList();
	}
}
