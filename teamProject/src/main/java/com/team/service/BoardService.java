package com.team.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.BoardDAO;

@Service
public class BoardService {

	@Inject
	BoardDAO boardDAO;
	
	public Map<String,String> select(Map<String, String> map) {
		System.out.println("BoardService select()");
		return boardDAO.select(map);
	}// test select()

	public void insertBoard(Map<String, String> textData, List<String> imageFilenames) {
		System.out.println("BoardService insertBoard()");
		boardDAO.insertBoard(textData,imageFilenames);
		
	}// insertBoard()

}// BoardService 끝
