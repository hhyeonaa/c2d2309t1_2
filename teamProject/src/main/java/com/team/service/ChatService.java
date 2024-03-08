package com.team.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.ChatDAO;

@Service
public class ChatService {

	@Inject
	private ChatDAO chatDAO;
	
	public String roomCheck(Map<String, String> param) {
		return chatDAO.roomCheck(param);
	}

}
