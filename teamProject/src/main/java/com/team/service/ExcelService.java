package com.team.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.ExcelDAO;

@Service
public class ExcelService {
	
	@Inject
	private ExcelDAO excelDAO;
	
	public List<Map<String, String>> selectData() {
		return excelDAO.selectData();
	}
}
