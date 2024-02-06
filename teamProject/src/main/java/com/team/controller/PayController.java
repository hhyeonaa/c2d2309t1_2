package com.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/pay/*")
public class PayController {

	@GetMapping("/payment")
	public String saleBoard() {
		System.out.println("PayController payment()");
		return "/pay/payment";
	}// saleBoard()
	
	
}
