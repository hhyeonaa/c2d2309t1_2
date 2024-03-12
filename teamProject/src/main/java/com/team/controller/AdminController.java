package com.team.controller;


import java.io.Console;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.AdminService;
import com.team.service.BoardService;
import com.team.service.TeamCodeService;
import com.team.util.EnumCodeType;
import com.team.util.JsonUtils;
import com.team.util.ToastUI;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject 
	private TeamCodeService codeService;
	@Inject
	private AdminService adminService;
	
	
	/* 현아 작업공간 */
	@GetMapping("/manager")
	public String manager(Model model) {
		model.addAttribute("mapList", adminService.getAdminList());
		return "admin/manager";
	}
	@PostMapping("/managerPro") // CREATE
 	@ResponseBody
 	public ResponseEntity<?> createManager(@RequestBody String createdRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(createdRows);
 		return null;
 	}
	
 	@GetMapping("/managerPro") // READ
 	@ResponseBody
 	public ResponseEntity<?> readManager(@RequestParam Map<String, String> req){
 		List<Map<String, String>> mapList = adminService.getAdminList();
 		return ToastUI.resourceData(req, mapList);
 	}
 	
 	@PutMapping("/managerPro") // UPDATE
 	@ResponseBody
 	public ResponseEntity<?> updateManager(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
 		return null;
 	}
 	@DeleteMapping("/managerPro") // DELETE
 	@ResponseBody
 	public ResponseEntity<?> deleteManager(@RequestParam Map<String, String> deletedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(deletedRows);
 		return null;
 	}
	
	@PostMapping("/insertPro")
	public String insertPro(@RequestParam Map<String, String> map, HttpServletResponse response) {
		boolean check = adminService.idCheck(map);
		if(check) {
			return null;
		} else {
			adminService.adminInsert(map);
			return "redirect:/admin/manager";
		}
	}
	
	@PostMapping("/deletePro")
	public String deletePro(@RequestParam String AD_NO) {
		adminService.adminDelete(AD_NO);
		return "1";
	}
	
	@PostMapping("/updatePro")
	public void updatePro(@RequestParam Map<String, String> map) {
		adminService.adminUpdate(map);
	}
	
	@GetMapping("/board")
	public String board(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		model.addAttribute("menu", codeService.selectCodeList(EnumCodeType.메뉴항목, session));
		model.addAttribute("form", codeService.selectCodeList(EnumCodeType.입력폼항목, session));
		return "admin/board";
	}
	
 	@GetMapping("/boardPro")
 	@ResponseBody
 	public ResponseEntity<?> readBoard(@RequestParam Map<String, String> req, HttpSession session) {
 		List<Map<String, String>> mapList = codeService.selectCodeList(EnumCodeType.메뉴항목, session);
 		return ToastUI.resourceData(req, mapList);
 	}
 	
 	@PutMapping("/boardPro")
 	@ResponseBody
 	public ResponseEntity<?> updateBoard(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
 		System.out.println(result);
 		return null;
 	}
	
//	@PostMapping("/displayUpdate")
//	@ResponseBody
//	public ResponseEntity<?> displayUpdate(@RequestBody List<Map<String, String>> requestBody) {
//		List<Map<String, String>> arrList = requestBody;
//	    for (Map<String, String> entry : arrList) {
//	        adminService.displayUpdate(entry);
//	        System.out.println(entry);
//	    }
//		return ResponseEntity.ok().body(arrList);
//	}

	@GetMapping("/category")
	public String category(Model model, HttpSession session) {
		Map<String, String> existingData = new HashMap<String, String>();
		existingData.put(EnumCodeType.코드내용.getType(), EnumCodeType.메뉴항목.getType());
		model.addAllAttributes(existingData);
		model.addAttribute("keyList", EnumCodeType.전체코드타입.getKeyList());
		model.addAttribute("valueList", EnumCodeType.전체코드타입.getValueList());
		
		model.addAttribute("category", codeService.selectCodeList(EnumCodeType.카테고리항목, session));
		return "admin/category";
	}
	
 	@GetMapping("/categoryPro")
 	@ResponseBody
 	public ResponseEntity<?> readCategory(@RequestParam Map<String, String> param, HttpSession session){
		List<Map<String, String>> mapList = codeService.selectCodeList(
				EnumCodeType.코드내용.stringToEnumType(param.get("param")), session);
 		return ToastUI.resourceData(param, mapList);
 	}
 	
 	@PutMapping("/categoryPro")
 	@ResponseBody
 	public ResponseEntity<?> updateCategory(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
 		System.out.println(result);
 		List<Map<String, String>> newData = new ArrayList<Map<String, String>>();
 		result.forEach(t -> {
			Map<String, String> currentData = new HashMap<String, String>();
			currentData.put(EnumCodeType.코드번호.getType(), t.get(EnumCodeType.코드번호.getType()));
			currentData.put(EnumCodeType.코드타입.getType(), t.get(EnumCodeType.코드타입.getType()));
			newData.add(currentData);
		});

		adminService.displayUpdate(result);
 		return null;
 	}
 	
	@GetMapping("/inputForm")
	public String inputForm(HttpServletRequest request, Model model, HttpSession session) {
//		BoardService boardService = new BoardService();
//		String proWr = request.getParameter("proWr");
//		String proDate = request.getParameter("proDate");
//		String id = (String)session.getAttribute("MEM_ID");
////		List<Map<String, String>> selectAddress = boardService.selectAddress(id);
////		System.out.println("주소왔니? " + selectAddress);
////		model.addAttribute("selectAddress", selectAddress);
//		if(proWr != null || proDate != null) {
//			Map<String, String> map = new HashMap<>();
//			map.put("proWr", proWr);
//			map.put("proDate", proDate);
//			Map<String,String> resultMap = boardService.selectBoardDetail(map);
//			System.out.println("resultMap: "+ resultMap);
//			String ImgNames = resultMap.get("IMG_NAMES");
//			String[] ImgNameSplit = ImgNames.split("\\|");
//			ArrayList<String> imgList = new ArrayList<>();
//			for (String e : ImgNameSplit) {
//				imgList.add(e);
//			}
//			System.out.println("=====");
//			System.out.println(imgList);
//			model.addAttribute("resultMap", resultMap);
//			model.addAttribute("imgList", imgList);
//		}
		System.out.println("아이디 확인: " + session.getAttribute("MEM_ID"));
		model.addAttribute("menu", codeService.selectCodeList(EnumCodeType.메뉴항목, session));
		model.addAttribute("state",codeService.selectCodeList(EnumCodeType.상품상태, session));
		model.addAttribute("trade", codeService.selectCodeList(EnumCodeType.거래상태, session));
		model.addAttribute("category", codeService.selectCodeList(EnumCodeType.카테고리항목, session));
//		List<Map<String, String>> placeHolder =  codeService.selectCodeList(EnumCodeType.상세설명, session);
//		Map<String, String> detailTxt = new HashMap<>();
//		int i = 0;
//		for (Map<String, String> map : placeHolder) {
//			i++;
//		    String value = map.get("CODE"); // 특정 키에 대한 값 조회
//		    detailTxt.put("dTxt"+i, value);
//		}
//		model.addAttribute("detailTxt", detailTxt);
		return "admin/inputForm";
	}
	
	@PostMapping("/inputFormPro")
//	@ResponseBody
	public String inputFormPro(@RequestParam Map<String, String> map, HttpSession session) {
		System.out.println("MEM_ID: " + (String)session.getAttribute("MEM_ID"));
		map.put("MEM_ID", (String)session.getAttribute("MEM_ID"));
		System.out.println("map : " + map.entrySet());
		adminService.inputForm(map);
		return "admin/inputFormPro";
	}
	
	@GetMapping("/getForm")
	@ResponseBody
	public ResponseEntity<?> getForm(@RequestParam Map<String, String> map) {
		List<Map<String, String>> formList = adminService.getForm(map);
		for (Map<String, String> code : formList) {
			String codeValue = code.get("CODE");
			code.put("formName", codeValue.split("/")[0]);
			code.put("formID", codeValue.split("/")[1]);
		}
		System.out.println("리스트: " + formList.toString());
		return ResponseEntity.ok().body(formList);
	}
	
	
	/* 현아 작업공간 */
	
	/* 무창 작업공간 */
	
//	----- 메세지 페이지 -----
	
	@GetMapping("/message_manage")
	public String message_manage(Model model, HttpSession session) {
		model.addAttribute("CODE_TYPE", EnumCodeType.메세지.getType());
		return "admin/message_manage";
	}
	
	@GetMapping("/message_managePro")
	@ResponseBody
	public ResponseEntity<?> selectMessage(@RequestParam Map<String, String> param, HttpSession session) {
		return ToastUI.resourceData(param, codeService.selectMessageList(EnumCodeType.메세지, session));
	}
	
	@PostMapping("/message_managePro")
	@ResponseBody
	public ResponseEntity<?> insertMessage(@RequestBody String insertedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(insertedRows);
 		System.out.println(result);
 		adminService.messageInsert(result);
 		return null;
	}
	
	@PutMapping("/message_managePro")
	@ResponseBody
	public ResponseEntity<?> updateMessage(@RequestBody String insertedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(insertedRows);
 		System.out.println(result);
 		boolean a = adminService.messageUpdate(result);
 		System.out.println(a);
 		return null;
	}
	
	@DeleteMapping("/message_managePro")
	@ResponseBody
	public ResponseEntity<?> deleteMessage(@RequestBody String insertedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(insertedRows);
 		System.out.println(result);
 		adminService.messageDelete(result);
 		return null;
	}
	
//	----- 공동코드 페이지 -----
	
	@GetMapping("/code_manage")
	public String code_manage(Model model) {
		Map<String, String> existingData = new HashMap<String, String>();
		existingData.put(EnumCodeType.코드내용.getType(), EnumCodeType.메뉴항목.getType());
		model.addAllAttributes(existingData);
		model.addAttribute("keyList", EnumCodeType.전체코드타입.getKeyList());
		model.addAttribute("valueList", EnumCodeType.전체코드타입.getValueList());

		return "admin/code_manage";
	}
	
	@GetMapping("/codePro")//	get
 	@ResponseBody
 	public ResponseEntity<?> getCodePro(@RequestParam Map<String, String> param, HttpSession session){
		List<Map<String, String>> data = codeService.selectCodeList(
				EnumCodeType.코드내용.stringToEnumType(param.get("param")), session);
		
 		return ToastUI.resourceData(param, data);
 	}
	
	@PostMapping("/codePro")//	post
 	@ResponseBody
 	public ResponseEntity<?> insertCodePro(@RequestBody String insertedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(insertedRows);
 		System.out.println(result);
 		adminService.codeInsert(result);
 		return null;
 	}
	
	@PutMapping("/codePro")	//	put
 	@ResponseBody
 	public ResponseEntity<?> updateCodePro(@RequestBody String updatedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(updatedRows);
 		List<Map<String, String>> newData = new ArrayList<Map<String, String>>();
 		
 		result.forEach(t -> {
 			Map<String, String> currentData = new HashMap<String, String>();
 			currentData.put(EnumCodeType.코드번호.getType(), t.get(EnumCodeType.코드번호.getType()));
 			currentData.put(EnumCodeType.코드타입.getType(), t.get(EnumCodeType.코드타입.getType()));
 			newData.add(currentData);
 		});
 		
 		List<Map<String, String>> datas = adminService.codeSelect(newData);
 		for(int i = 0; i < result.size(); i++) {
 			result.get(i).put("ACTIVE", datas.get(i).get("ACTIVE"));
 		}
 		adminService.codeUpdate(result);
 		
 		return null;
 	}
	
	@DeleteMapping("/codePro")	//	delete
 	@ResponseBody
 	public ResponseEntity<?> deleteCodePro(@RequestBody String deletedRows) {
 		List<Map<String, String>> result = ToastUI.getRealData(deletedRows);
 		System.out.println(result);
		adminService.codeDelete(result);
 		return null;
 	}
	
//	----- 로그아웃 -----
	
	@GetMapping("/logout")
	public void logout(HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		session.invalidate();
		codeService.submitForAlert(response, "AM3", new Object[]{"로그아웃"}, request.getContextPath());
	}
	
//	----- 테스트 페이지 -----
	
	@GetMapping("/drawing")
	public String drawing() {
		return "admin/drawing";
	}
	
	/* 무창 작업공간 */
	
	/* 성엽 작업공간 */
	
	@GetMapping("/chart")
	public String chart() {
		return "admin/chart";
	}//
	
	@GetMapping("/member_report")
	public String member_report(Model model) {
		
		List<Map<String, String>> reportList = adminService.getReportList();
		
		model.addAttribute("reportList", reportList);
		
		return "admin/member_report";
	}//
	
	// 채팅만들어지고 이동
	@GetMapping("/member_report_test")
	public String member_report_test(Model model) {
		
		List<Map<String, String>> reportList = adminService.getReportList();
		
		model.addAttribute("reportList", reportList);
		
		return "redirect:admin/member_report";
	}//
	
	@GetMapping("/member_manage")
	public String member_manage(Model model) {
		
		List<Map<String, String>> memList = adminService.getMemberList();
		
		model.addAttribute("memList", memList);
		
		return "admin/member_manage";
	}//
	
	@PostMapping("/memberStop")
	@ResponseBody
	public ResponseEntity<?> stop(@RequestParam Map<String, String> dto) {
		
		boolean isUpdate = adminService.memberStop(dto);
//		isUpdate = isUpdate ? adminService.memberDelete(dto.get("state")) : false;
		Map<String, Boolean> param = new HashMap<String, Boolean>();
		param.put("isSuccess", isUpdate);
		
		System.out.println(param);
		
		return ResponseEntity.ok().body(param);
	}//
	
	@GetMapping("/contentDelete")
	public String contentDelete(@RequestParam String PRO_NO) {
		
		adminService.contentDelete(PRO_NO);
		
		return "redirect:/admin/board_content";
	}//
	
	@GetMapping("/content_Delete")
	@ResponseBody
	public ResponseEntity<?> content_Delete(@RequestParam String PRO_NO) {
		
		Map<String, String> result = new HashMap<String, String>();
		result.put("result", Integer.toString(adminService.cateContentDelete(PRO_NO)));
		
		return ResponseEntity.ok().body(result);
	}//
	
	@GetMapping("/board_content")
	public String board_content(Model model) {
		
		List<Map<String, String>> contentList = adminService.getContentboardList();
		
		model.addAttribute("contentList", contentList);
		
		return "admin/board_content";
	}//
	
	@GetMapping("/board_category")
 	@ResponseBody
 	public ResponseEntity<?> board_category(@RequestParam Map<String, String> param){
		
 		List<Map<String, String>> cateList = adminService.getBoardCategoryList(param);
 		
 		return ResponseEntity.ok().body(cateList);
 	}//
	
	/* 성엽 작업공간 */	



}
