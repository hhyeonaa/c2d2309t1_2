package com.team.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.PayDAO;

@Service
public class PayService {
	@Inject
	private PayDAO payDAO;


}
