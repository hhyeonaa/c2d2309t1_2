package com.team.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.team.util.EnumCodeType;
import com.team.service.TeamService;


@Controller
@RequestMapping("/pay/*")
public class PayController {

	@Inject
	private TeamService teamService;
	
	@GetMapping("/payment")
	public String payment() {
		System.out.println("PayController payment()");
		return "/pay/payment";
	}// payment()
	
	@GetMapping("/completepay")
	public String completepay() {
		System.out.println("PayController completepay()");
		return "/pay/completepay";
	}// completepayment
	
}
