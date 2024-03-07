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
	
	public int insertData(Map<String, Object> uploadData) {
		return excelDAO.insertData(uploadData);
	}
}
