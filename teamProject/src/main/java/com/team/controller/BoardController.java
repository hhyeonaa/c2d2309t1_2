package com.team.controller;

import java.io.File;
import java.io.IOException;
import java.lang.System.Logger;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.team.service.BoardService;
import com.team.service.TeamCodeService;
import com.team.util.EnumCodeType;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	
	private static final org.slf4j.Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Inject
	BoardService boardService;
	@Inject
	private TeamCodeService codeService;
	
	@GetMapping("/saleBoard")
	public String saleBoard(Model model) {
		System.out.println("BoardController saleBoard()");
		String proTc = "MM1";
		Map<String, String> map = new HashMap<>();
		map.put("proTc", proTc);
		System.out.println("map: " + map);
		/*테스트용 select start*/
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("proNo", "PR4");
//		System.out.println(boardService.select(map));
		/*테스트용 select end*/
//		List<Map<String,String>> resultList = boardService.selectSaleBoard();
		List<Map<String,String>> resultList = boardService.selectBoard(map);
		logger.info("resultList: "+resultList);
		model.addAttribute("resultList",resultList);
		logger.info("resultList: "+resultList);
		model.addAttribute("resultList",resultList);
		return "board/saleBoard";
	}// saleBoard()
	
	
	// 성엽 작업 시작 //
	
	@GetMapping("/buyBoard")
	public String buyBoard(Model model) {
		System.out.println("BoardController buyBoard()");
		
		List<Map<String, String>> buyList = boardService.selectBuyBoard();
		logger.info("buyList: " + buyList);
		model.addAttribute("buyList", buyList);
		
		return "board/buyBoard";
	}// buyBoard()
	
	// 성엽 작업 끝 //
	
	@GetMapping("/divideBoard")
	public String divideBoard(Model model) {
		System.out.println("BoardController divideBoard()");
		String proTc = "MM3";
		Map<String, String> map = new HashMap<>();
		map.put("proTc", proTc);
		System.out.println("map: " + map);
//		List<Map<String,String>> resultList = boardService.selectDivideBoard();
		List<Map<String,String>> resultList = boardService.selectBoard(map);
		logger.info("resultList: "+resultList);
		model.addAttribute("resultList",resultList);
		return "board/divideBoard";
	}// divideBoard()
	
	@GetMapping("/auctionBoard")
	public String auctionBoard() {
		System.out.println("BoardController auctionBoard()");
		return "board/auctionBoard";
	}// auctionBoard()
	
	@GetMapping("/writeBoard")
	public String writeBoard(Model model) {
		System.out.println("BoardController writeBoard()");
		//codeService.selectCode("MM1");

		
		model.addAttribute("menu", codeService.selectCodeList(EnumCodeType.메뉴항목));
		return "board/writeBoard";
	}// writeBoard()
	
	@PostMapping("/writeBoardPro")
	public ResponseEntity<?> writeBoardPro(
	        @RequestParam Map<String, String> textData,
	        @RequestParam("imgs") List<MultipartFile> imgs,
	        HttpServletRequest request) throws IOException {

	    // Gson 인스턴스 생성
//	    Gson gson = new Gson();

	    // textData를 Map으로 변환
//	    Type type = new TypeToken<Map<String, Object>>() {}.getType();
//	    Map<String, Object> textDataMap = gson.fromJson(textData, type);

	    // 텍스트 데이터 처리
	    logger.info("textData: " + textData);
	    // 원본 Map의 textData 값 (JSON 문자열)
        String textDataJson = textData.get("textData");

        // Gson 인스턴스 생성
        Gson gson = new Gson();

        // JSON 문자열을 Map<String, String>으로 파싱
        Type type = new TypeToken<Map<String, String>>(){}.getType();
        Map<String, String> parsedMap = gson.fromJson(textDataJson, type);

        // 파싱된 Map의 내용 출력
        logger.info("parsedMap: " + parsedMap);
//        for (Map.Entry<String, String> entry : parsedMap.entrySet()) {
//            System.out.println(entry.getKey() + ": " + entry.getValue());
//        }
	    // 파일 데이터 처리
//	    String rootPath = System.getProperty("user.dir"); // 동적으로 루트 디렉토리 경로를 얻음
//	    String fixedPath = "src/main/webapp/resources/img/uploads"; // 고정된 하위 경로
//	    String fullPath = rootPath + File.separator + fixedPath; // 최종 경로 결합
	    ServletContext context = request.getSession().getServletContext();
	    String realPath = context.getRealPath("/resources/img/uploads");
	    logger.info("realPath: "+ realPath);
//	    logger.info("fullPath: "+ fullPath);
//	    for (MultipartFile img : imgs) {
//	        String fileName = img.getOriginalFilename(); // 원본 파일 이름
//	        File destFile = new File(fullPath + File.separator + fileName);
//	        img.transferTo(destFile); // 파일 저장
//	    }
	    // 저장할 디렉토리 설정
//	    String uploadDir = System.getProperty("user.home") + "/upload";
//	    logger.info("uploadDir: "+ uploadDir);

//	    // 파일 데이터 처리
//	    for (MultipartFile img : imgs) {
//	        System.out.println("Received file: " + img.getOriginalFilename() + " with size: " + img.getSize());
//	        // 파일 처리 로직 (예: 저장, 검증 등)
//	    }
	    // 디렉토리 생성
//	    File directory = new File(uploadDir);
//	    if (!directory.exists()) {
//	        directory.mkdirs();
//	    }
	    
	    // 파일 데이터 처리 및 저장
//	    List<String> imageFilenames = new ArrayList<>();
//	    for (MultipartFile img : imgs) {
//	        String fileName = img.getOriginalFilename(); // 원본 파일 이름 가져오기
//	        imageFilenames.add(fileName);
//	        File destFile = new File(uploadDir + File.separator + fileName);
//	        img.transferTo(destFile); // 파일 저장
//	        System.out.println("Saved file: " + fileName + " to " + uploadDir);
//	    }
	    List<String> imageFilenames = new ArrayList<>();
//	    for (MultipartFile img : imgs) {
//	        String fileName = img.getOriginalFilename(); // 원본 파일 이름 가져오기
//	        imageFilenames.add(fileName);
//	        File destFile = new File(realPath + File.separator + fileName);
//	        img.transferTo(destFile); // 파일 저장
//	        System.out.println("Saved file: " + fileName + " to " + realPath);
//	    }
	    for (MultipartFile img : imgs) {
	        String originalFileName = img.getOriginalFilename();
	        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	        String fileName = UUID.randomUUID().toString() + fileExtension; // UUID를 파일 이름으로 사용
	        imageFilenames.add(fileName);
	        File destFile = new File(realPath + File.separator + fileName);
	        img.transferTo(destFile); // 파일 저장
	        System.out.println("Saved file: " + fileName + " to " + realPath);
	    }
	    boardService.insertBoard(parsedMap, imageFilenames);

	    return ResponseEntity.ok("Data and files received successfully");
	}
	
//	@PostMapping("/writeBoardPro")
//	public String writeBoardPro(
//			@RequestParam("proName") String proName,
//			@RequestParam("proTc") String proTc,
//			@RequestParam("category1") String category1,
//			@RequestParam("category2") String category2,
//			@RequestParam("category3") String category3,
//			@RequestParam("itemStatus") String itemStatus,
//			@RequestParam("proContent") String proContent,
//			@RequestParam("imgs") List<MultipartFile> imgs) {
//	
//		System.out.println("BoardController writeBoardPro()");
//		// 텍스트 데이터 출력
//		System.out.println("Product Name: " + proName);
//		System.out.println("Product TC: " + proTc);
//		System.out.println("Category1: " + category1);
//		System.out.println("Category2: " + category2);
//		System.out.println("Category3: " + category3);
//		System.out.println("Item Status: " + itemStatus);
//		System.out.println("Product Content: " + proContent);
//		
//		// 파일 데이터 출력
//		System.out.println("Received " + imgs.size() + " images.");
//		for (MultipartFile img : imgs) {
//		    System.out.println("Image Name: " + img.getOriginalFilename());
//		    System.out.println("Image Size: " + img.getSize());
//		    // 파일 처리 로직 (예: 저장, 검증 등)
//		}
//	
//	    return "board/saleBoard";
//	}
//    @PostMapping("/writeBoardPro")
//    public String writeBoardPro(@RequestParam("btnAtt") List<MultipartFile> files, Model model, HttpServletRequest request) {
//    	System.out.println("BoardController writeBoardPro()");
//    	String contextPath = request.getContextPath();
//    	String uploadPath = contextPath + "/resources/img/board";
//    	System.out.println("uploadPath: "+uploadPath);
//        if (files.size() > 0 && !files.get(0).isEmpty()) { // 파일이 존재하는지 체크
//            StringBuilder message = new StringBuilder();
//            for (MultipartFile file : files) {
//                try {
//                    // 파일 저장 로직
//                    String saveName = file.getOriginalFilename();
//                    System.out.println("saveName: "+saveName);
//                    File saveFile = new File(uploadPath, saveName);
//                    file.transferTo(saveFile);
//
//                    message.append("File uploaded successfully: ").append(saveName).append("<br>");
//                } catch (Exception e) {
//                    message.append("File upload failed: ").append(file.getOriginalFilename()).append("<br>");
//                }
//            }
//            model.addAttribute("message", message.toString());
//        } else {
//            model.addAttribute("message", "No files to upload!");
//        }
//
//        return "board/saleBoard"; // 업로드 결과를 보여줄 뷰의 이름
//    }
	@PostMapping("/insertPreBoard")
	public ResponseEntity<?> insertPreBoard(@RequestParam Map<String, String> textData){
		System.out.println("BoardController insertPreBoard()");
		// 텍스트 데이터 처리
	    logger.info("textData: " + textData);
	    // 원본 Map의 textData 값 (JSON 문자열)
        String textDataJson = textData.get("textData");
        logger.info(textDataJson);
        // Gson 인스턴스 생성
        Gson gson = new Gson();

        // JSON 문자열을 Map<String, String>으로 파싱
        Type type = new TypeToken<Map<String, String>>(){}.getType();
        Map<String, String> parsedMap = gson.fromJson(textDataJson, type);

        // 파싱된 Map의 내용 출력
        logger.info("parsedMap: " + parsedMap);
        boardService.insertPreBoard(parsedMap);
        
		return ResponseEntity.ok("Data received successfully");
	}// insertPreBoard()
	@PostMapping("/insertPreAuction")
	public ResponseEntity<?> insertPreAuction(@RequestParam Map<String, String> textData){
		System.out.println("BoardController insertPreAuction()");
		// 텍스트 데이터 처리
	    logger.info("textData: " + textData);
	    // 원본 Map의 textData 값 (JSON 문자열)
        String textDataJson = textData.get("textData");
        logger.info(textDataJson);
        // Gson 인스턴스 생성
        Gson gson = new Gson();

        // JSON 문자열을 Map<String, String>으로 파싱
        Type type = new TypeToken<Map<String, String>>(){}.getType();
        Map<String, String> parsedMap = gson.fromJson(textDataJson, type);

        // 파싱된 Map의 내용 출력
        logger.info("parsedMap: " + parsedMap);
        boardService.insertPreAuction(parsedMap);
        
		return ResponseEntity.ok("Data received successfully");
	}// insertPreAuction()	
	
	@GetMapping("/boardDetail")
	public String boardDetail(HttpServletRequest request,Model model) {
		System.out.println("BoardController boardDetail()");
		String proWr = request.getParameter("proWr");
		String proDate = request.getParameter("proDate");
		logger.info("proWr: "+proWr);
		logger.info("proDate: "+proDate);
		Map<String, String> map = new HashMap<>();
		map.put("proWr", proWr);
		map.put("proDate", proDate);
		boardService.upHits(map);
		Map<String,String> resultMap = boardService.selectBoardDetail(map);
		System.out.println("resultMap: "+ resultMap);
		String ImgNames = resultMap.get("IMG_NAMES");
		String[] ImgNameSplit = ImgNames.split("\\|");
		ArrayList<String> imgList = new ArrayList<>();
		for (String e : ImgNameSplit) {
			imgList.add(e);
		}
		System.out.println("=====");
		System.out.println(imgList);
		model.addAttribute("resultMap", resultMap);
		model.addAttribute("imgList", imgList);
		return "board/boardDetail";
	}// boardDetail()
	
	@GetMapping("/divideDetail")
	public String divideDetail(HttpServletRequest request,Model model) {
		System.out.println("BoardController divideDetail()");
		String proWr = request.getParameter("proWr");
		String proDate = request.getParameter("proDate");
		logger.info("proWr: "+proWr);
		logger.info("proDate: "+proDate);
		Map<String, String> map = new HashMap<>();
		map.put("proWr", proWr);
		map.put("proDate", proDate);
		boardService.upHits(map);
		Map<String,String> resultMap = boardService.selectBoardDetail(map);
		System.out.println("resultMap: "+ resultMap);
		String ImgNames = resultMap.get("IMG_NAMES");
		String[] ImgNameSplit = ImgNames.split("\\|");
		ArrayList<String> imgList = new ArrayList<>();
		for (String e : ImgNameSplit) {
			imgList.add(e);
		}
		System.out.println("=====");
		System.out.println(imgList);
		model.addAttribute("resultMap", resultMap);
		model.addAttribute("imgList", imgList);
		return "board/divideDetail";
	}// divideDetail()
	
	@GetMapping("/auctionDetail")
	public String auctionDetail() {
		System.out.println("BoardController auctionDetail()");
		return "board/auctionDetail";
	}// auctionDetail()
	
	
	
}// 클래스 끝
