package com.team.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
import com.team.service.TeamService;
import com.team.util.EnumCodeType;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	BoardService boardService;
	@Inject
	private TeamService teamService;
	
	@GetMapping("/saleBoard")
	public String saleBoard() {
		System.out.println("BoardController saleBoard()");
		/*테스트용 select start*/
		Map<String, String> map = new HashMap<String, String>();
		map.put("proWr", "하정우");
		System.out.println(boardService.select(map));
		/*테스트용 select end*/
		return "board/saleBoard";
	}// saleBoard()
	
	@GetMapping("/buyBoard")
	public String buyBoard() {
		System.out.println("BoardController buyBoard()");
		return "board/buyBoard";
	}// buyBoard()
	
	@GetMapping("/divideBoard")
	public String divideBoard() {
		System.out.println("BoardController divideBoard()");
		return "board/divideBoard";
	}// divideBoard()
	
	@GetMapping("/auctionBoard")
	public String auctionBoard() {
		System.out.println("BoardController auctionBoard()");
		return "board/auctionBoard";
	}// auctionBoard()
	
	@GetMapping("/writeBoard")
	public String writeBoard() {
		System.out.println("BoardController writeBoard()");
		return "board/writeBoard";
	}// writeBoard()
	
	@PostMapping("/writeBoardPro")
	public ResponseEntity<?> writeBoardPro(
	        @RequestParam Map<String, String> textData,
	        @RequestParam("imgs") List<MultipartFile> imgs) throws IOException {

	    // Gson 인스턴스 생성
//	    Gson gson = new Gson();

	    // textData를 Map으로 변환
//	    Type type = new TypeToken<Map<String, Object>>() {}.getType();
//	    Map<String, Object> textDataMap = gson.fromJson(textData, type);

	    // 텍스트 데이터 처리
	    System.out.println("Received text data: " + textData);

	    // 파일 데이터 처리
	    for (MultipartFile img : imgs) {
	        System.out.println("Received file: " + img.getOriginalFilename() + " with size: " + img.getSize());
	        // 파일 처리 로직 (예: 저장, 검증 등)
	    }

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
	
	
	@GetMapping("/boardDetail")
	public String boardDetail() {
		System.out.println("BoardController boardDetail()");
		return "board/boardDetail";
	}// boardDetail()
	
	@GetMapping("/divideDetail")
	public String divideDetail() {
		System.out.println("BoardController divideDetail()");
		return "board/divideDetail";
	}// divideDetail()
	
	@GetMapping("/auctionDetail")
	public String auctionDetail() {
		System.out.println("BoardController auctionDetail()");
		return "board/auctionDetail";
	}// auctionDetail()
	
	
	
}// 클래스 끝
