package com.mycompany.myapp;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
//	@Inject
//	private HomeService homeService; 
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(@RequestParam Map<String, String> param, Model model) {
//		//1. 카테고리별(판매,구매,나눔,경매) 최신등록글 각 8개  select // 끌올?
//		List<Map<String, String>> productList = homeService.getProductList();
//		
//		model.addAttribute("productList", productList);
//		return "home";
//	}
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@RequestMapping(value = "/dontOpen", method = RequestMethod.GET)
	public String dontOpen() {
		return "dontOpen";
	}
	
	@RequestMapping(value = "/excel", method = RequestMethod.GET)
	public String excel() {
		return "excelTest";
	}
	
	@RequestMapping(value = "/eul", method = RequestMethod.GET)
	public String eul() {
		return "excelTest2";
	}
}
