package com.team.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.AdminDAO;

@Service
public class AdminService {

	@Inject
	private AdminDAO adminDAO;
}
