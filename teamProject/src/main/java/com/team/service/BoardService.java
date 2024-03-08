package com.team.service;

import java.util.ArrayList;
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

	public void insertPreAuction(Map<String, String> parsedMap) {
		System.out.println("BoardService insertPreAuction()");
		boardDAO.insertPreAuction(parsedMap);
	}// insertPreAuction()

	public List<Map<String, String>> selectSaleBoard() {
		System.out.println("BoardService selectSaleBoard()");
		return boardDAO.selectSaleBoard();
	}// selectSaleBoard()

	public Map<String, String> selectBoardDetail(Map<String, String> map) {
		System.out.println("BoardService selectBoardDetail()");
		return boardDAO.selectBoardDetail(map);
	}// selectBoardDetail();
	
	// 성엽 작업 시작 //
	
	public List<Map<String, String>> selectBuyBoard() {
		System.out.println("BoardService selectBuyBoard()");
		return boardDAO.selectBuyBoard();
	}//
	
	// 성엽 작업 끝 //

	public void upHits(Map<String, String> map) {
		System.out.println("BoardService upHits()");
		boardDAO.upHits(map);
	}// upHits()

	public List<Map<String, String>> selectDivideBoard() {
		System.out.println("BoardService selectDivideBoard()");
		return boardDAO.selectDivideBoard();
	}// selectDivideBoard()

	public List<Map<String, String>> selectBoard(Map<String, String> map) {
		System.out.println("BoardService selectBoard()");
		return boardDAO.selectBoard(map);
	}// selectBoard()

	public List<Map<String, String>> getImgMap(Map<String, String> delMap) {
		System.out.println("BoardService getImgMap()");
		return boardDAO.getImgMap(delMap);
	}// getImgMap()

	public int deleteBoard(Map<String, String> delMap) {
		System.out.println("BoardService deleteBoard()");
		return boardDAO.deleteBoard(delMap);
	}// deleteBoard()

	public List<Map<String, String>> selectAddress(String id) {
		System.out.println("BoardService selectAddress()");
		return boardDAO.selectAddress(id);
	}// selectAddress()


}// BoardService 끝
