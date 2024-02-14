package com.team.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.AdminDAO;
import com.team.dao.MemberDAO;

@Service
public class MemberService {

	@Inject
	private MemberDAO memberDAO;
}
