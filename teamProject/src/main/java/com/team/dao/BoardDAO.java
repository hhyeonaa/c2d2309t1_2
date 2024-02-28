package com.team.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;



@Repository
public class BoardDAO {

	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(BoardDAO.class);
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.team.mappers.board";
	
	public Map<String,String> select(Map<String, String> map) {
		System.out.println("BoardDAO select()");
		return sqlSession.selectOne(NAMESPACE + ".select", map);
	} // 테스트용 select()

	public void insertBoard(Map<String, String> parsedMap, List<String> imageFilenames) {
		System.out.println("BoardDAO insertBoard()");
	    // 이미지 파일 이름을 textData Map에 추가
	    for (int i = 0; i < imageFilenames.size(); i++) {
	        // 각 이미지 파일 이름에 대해 고유한 키 생성
	        String key = "imageFilename" + (i + 1);
	        String value = imageFilenames.get(i);

	        // 생성된 키와 이미지 파일 이름을 textData Map에 추가
	        parsedMap.put(key, value);
	    }
	    parsedMap.put("proHits","0"); // 임시 추가
	    logger.info("map: " + parsedMap);
	    String jsonParams = new Gson().toJson(parsedMap);
	    logger.info("jsonParams: " + jsonParams);
		sqlSession.insert(NAMESPACE+".insertBoard", jsonParams);
	}// insertBoard()

	public void insertPreBoard(Map<String, String> parsedMap) {
		System.out.println("BoardDAO insertPreBoard()");
		sqlSession.insert(NAMESPACE + ".insertPreBoard",parsedMap);
	}// insertPreBoard()

	public void insertPreAuction(Map<String, String> parsedMap) {
		System.out.println("BoardDAO insertPreAuction()");
		sqlSession.insert(NAMESPACE + ".insertPreAuction",parsedMap);
	}// insertPreAuction()

	public List<Map<String, String>> selectSaleBoard() {
		System.out.println("BoardDAO selectSaleBoard()");
		return sqlSession.selectList(NAMESPACE + ".selectSaleBoard");
	}// selectSaleBoard()

	public Map<String, String> selectBoardDetail(Map<String, String> map) {
		System.out.println("BoardDAO selectBoardDetail()");
		return sqlSession.selectOne(NAMESPACE + ".selectBoardDetail",map);
	}// selectBoardDetail()

	public void upHits(Map<String, String> map) {
		System.out.println("BoardDAO upHits()");
		sqlSession.update(NAMESPACE + ".upHits", map);
	}// upHits()

	public List<Map<String, String>> selectDivideBoard() {
		System.out.println("BoardDAO selectDivideBoard()");
		return sqlSession.selectList(NAMESPACE + ".selectDivideBoard");
	}// selectDivideBoard()
	// 성엽 작업 시작 //
	
	public List<Map<String, String>> selectBuyBoard() {
		System.out.println("BoardDAO selectBuyBoard()");
		return sqlSession.selectList(NAMESPACE + ".selectBuyBoard");
	}//

	public List<Map<String, String>> selectBoard(Map<String, String> map) {
		System.out.println("BoardDAO selectBoard()");
		return sqlSession.selectList(NAMESPACE + ".selectBoard", map);
	}// selectBoard()
	
	// 성엽 작업 끝 //

}// BoardDAO 끝
