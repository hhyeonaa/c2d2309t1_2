package com.team.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.ChatDAO;

@Service
public class ChatService {

	@Inject
	private ChatDAO chatDAO;
	
	public Map<String, String> roomCheck(Map<String, String> param) {
		return chatDAO.roomCheck(param);
	}

	public String createRoom(Map<String, String> param) {
		return chatDAO.createRoom(param);
	}

	public List<Map<String, String>> chatRoomData(Map<String, String> param) {
		return chatDAO.chatRoomData(param);
		
	}
	
}
