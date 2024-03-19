package com.team.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	// 성엽 작업 끝 //
	public List<Map<String, String>> selectBoard(Map<String, String> map) {
		System.out.println("BoardDAO selectBoard()");
		return sqlSession.selectList(NAMESPACE + ".selectBoard", map);
	}// selectBoard()

	public List<Map<String, String>> getImgMap(Map<String, String> delMap) {
		System.out.println("BoardDAO getImgMap()");
		return sqlSession.selectList(NAMESPACE + ".getImgMap", delMap);
	}// getImgMap()

	public int deleteBoard(Map<String, String> delMap) {
		System.out.println("BoardDAO deleteBoard()");
//		String proNo = delMap.get("proNo");
		delMap.put("success", "0");
		sqlSession.selectOne(NAMESPACE + ".deleteBoard", delMap);
		int result = 0;
		String success = delMap.get("success"); 
		if(success.equals("1")) {
			result = 1;
		}
		return result;
	}// deleteBoard()

	public List<Map<String, String>> selectAddress(String id) {
		System.out.println("BoardDAO selectAddress()");
		return sqlSession.selectList(NAMESPACE + ".selectAddress", id);
	}// selectAddress()

	public String getProNo(Map<String, String> getNumMap) {
		System.out.println("BoardDAO getProNo()");
		return sqlSession.selectOne(NAMESPACE+".getProNo",getNumMap);
	}// getProNo()

	public void updateBoard(Map<String, String> parsedMap, List<String> imageFilenames) {
		System.out.println("BoardDAO updateBoard()");
		System.out.println("dao : " + parsedMap);
		System.out.println("dao : " + imageFilenames);
	    // 새로운 Map 객체 생성
	    Map<String, Object> allMap = new HashMap<>();
	    // parsedMap의 모든 항목을 allMap으로 복사
	    allMap.putAll(parsedMap);
	    // imageFilenames 리스트를 allMap에 추가
	    allMap.put("imageFilenames", imageFilenames);
	    List<Map<String, Object>> imagesWithNumbers = new ArrayList<>();
	    int imgNo = 1;
	    for (String filename : imageFilenames) {
	        Map<String, Object> imageMap = new HashMap<>();
	        imageMap.put("filename", filename);
	        imageMap.put("imgNo", imgNo++);
	        imagesWithNumbers.add(imageMap);
	    }
	    allMap.put("imagesWithNumbers", imagesWithNumbers);
		sqlSession.delete(NAMESPACE+".deleteImgs", parsedMap); // 이미지 테이블에서 이미지들 삭제 가능
		sqlSession.insert(NAMESPACE+".insertImgs", allMap);//	이미지 테이블에 다시 이미지 넣기
	    sqlSession.update(NAMESPACE+".updateBoard", parsedMap);
	}// updateBoard()

	public List<Map<String, String>> selectAuction(Map<String, String> map) {
		System.out.println("BoardDAO selectAuction()");
		return sqlSession.selectList(NAMESPACE + ".selectAuction", map);
	}// selectAuction()

	public void aucHits(Map<String, String> map) {
		System.out.println("BoardDAO aucHits()");
		sqlSession.update(NAMESPACE + ".aucHits", map);
	}// aucHits()

	public Map<String, String> selectAuctionDetail(Map<String, String> map) {
		System.out.println("BoardDAO selectAuctionDetail()");
		return sqlSession.selectOne(NAMESPACE+".selectAuctionDetail",map);
	}// selectAuctionDetail()

	public String getAucNo(Map<String, String> getNumMap) {
		System.out.println("BoardDAO getAucNo()");
		return sqlSession.selectOne(NAMESPACE+".getAucNo",getNumMap);
	}// getAucNo()

	public void updateAuction(Map<String, String> parsedMap, List<String> imageFilenames) {
		System.out.println("BoardDAO updateAuction()");
		System.out.println("dao : " + parsedMap);
		System.out.println("dao : " + imageFilenames);
	    // 새로운 Map 객체 생성
	    Map<String, Object> allMap = new HashMap<>();
	    // parsedMap의 모든 항목을 allMap으로 복사
	    allMap.putAll(parsedMap);
	    // imageFilenames 리스트를 allMap에 추가
	    allMap.put("imageFilenames", imageFilenames);
	    List<Map<String, Object>> imagesWithNumbers = new ArrayList<>();
	    int imgNo = 1;
	    for (String filename : imageFilenames) {
	        Map<String, Object> imageMap = new HashMap<>();
	        imageMap.put("filename", filename);
	        imageMap.put("imgNo", imgNo++);
	        imagesWithNumbers.add(imageMap);
	    }
	    allMap.put("imagesWithNumbers", imagesWithNumbers);
		sqlSession.delete(NAMESPACE+".deleteImgs", parsedMap); // 이미지 테이블에서 이미지들 삭제 가능
		sqlSession.insert(NAMESPACE+".insertImgs", allMap);//	이미지 테이블에 다시 이미지 넣기
	    sqlSession.update(NAMESPACE+".updateAuction", parsedMap);
	}// updateAuction()

	public List<Map<String, String>> getRelatedCateImg(Map<String, String> map) {
		System.out.println("BoardDAO getRelatedCateImg()");
		return sqlSession.selectList(NAMESPACE + ".getRelatedCateImg", map);
	}

	public boolean insertDivide(Map<String, String> param) {
		System.out.println("BoardDAO insertDivide()");
		return sqlSession.insert(NAMESPACE + ".insertDivide", param) == 1 ? true : false;
	}// insertDivide()

	public List<Map<String, String>> getDivList(Map<String, String> map) {
		System.out.println("BoardDAO getDivList()");
		return sqlSession.selectList(NAMESPACE + ".getDivList", map);
	}

	public boolean deleteDivide(Map<String, String> param) {
		System.out.println("BoardDAO deleteDivide()");
		return sqlSession.delete(NAMESPACE + ".deleteDivide", param) == 1 ? true : false;
	}// deleteDivide()

	public List<Map<String, String>> selectMyBoard(Map<String, String> param) {
		System.out.println("BoardDAO selectMyBoard()");
		return sqlSession.selectList(NAMESPACE + ".selectMyBoard", param);
	}// selectMyBoard()

	public List<Map<String, String>> selectTempBoard(String id) {
		System.out.println("BoardDAO selectTempBoard()");
		return sqlSession.selectList(NAMESPACE + ".selectTempBoard", id);
	}// selectTempBoard()

	public String getAllBoardCount(Map<String, String> map) {
		System.out.println("BoardDAO getAllBoardCount()");
		return sqlSession.selectOne(NAMESPACE + ".getAllBoardCount", map);
	}// getAllBoardCount()

	public List<Map<String, String>> getAllBoard(Map<String, String> map) {
		System.out.println("BoardDAO getAllBoard()");
		return sqlSession.selectList(NAMESPACE + ".getAllBoard", map);
	}// getAllBoard()

	public boolean increaseViewCount(Map<String, String> param) {
		System.out.println("BoardDAO increaseViewCount()");
		return sqlSession.update(NAMESPACE + ".increaseViewCount", param) == 1 ? true : false;
	}// increaseViewCount()

	
}// BoardDAO 끝
