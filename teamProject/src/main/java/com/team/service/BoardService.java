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

	public void insertBoard(Map<String, String> parsedMap, List<String> imageFilenames) {
		System.out.println("BoardService insertBoard()");
		// 리스트의 크기가 6보다 작은 동안 'empty'를 추가
        while (imageFilenames.size() < 6) {
            imageFilenames.add("empty");
        }
		boardDAO.insertBoard(parsedMap,imageFilenames);
		
	}// insertBoard()

	public void insertPreBoard(Map<String, String> parsedMap) {
		System.out.println("BoardService insertPreBoard()");
		boardDAO.insertPreBoard(parsedMap);
	}// insertPreBoard()

}// BoardService 끝
