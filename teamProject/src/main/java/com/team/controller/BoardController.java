package com.team.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	BoardService boardService;
	
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
    public String writeBoardPro(@RequestParam("btnAtt") List<MultipartFile> files, Model model, HttpServletRequest request) {
    	System.out.println("BoardController writeBoardPro()");
    	String contextPath = request.getContextPath();
    	String uploadPath = contextPath + "/resources/img/board";
    	System.out.println("uploadPath: "+uploadPath);
        if (files.size() > 0 && !files.get(0).isEmpty()) { // 파일이 존재하는지 체크
            StringBuilder message = new StringBuilder();
            for (MultipartFile file : files) {
                try {
                    // 파일 저장 로직
                    String saveName = file.getOriginalFilename();
                    System.out.println("saveName: "+saveName);
                    File saveFile = new File(uploadPath, saveName);
                    file.transferTo(saveFile);

                    message.append("File uploaded successfully: ").append(saveName).append("<br>");
                } catch (Exception e) {
                    message.append("File upload failed: ").append(file.getOriginalFilename()).append("<br>");
                }
            }
            model.addAttribute("message", message.toString());
        } else {
            model.addAttribute("message", "No files to upload!");
        }

        return "board/saleBoard"; // 업로드 결과를 보여줄 뷰의 이름
    }
	
	
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
