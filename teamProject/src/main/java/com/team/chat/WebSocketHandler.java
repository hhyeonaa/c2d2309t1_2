package com.team.chat;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/*
 * WebSocket Handler 작성
 * 소켓 통신은 서버와 클라이언트가 1:n으로 관계를 맺는다. 따라서 한 서버에 여러 클라이언트 접속 가능
 * 서버에는 여러 클라이언트가 발송한 메세지를 받아 처리해줄 핸들러가 필요
 * TextWebSocketHandler를 상속받아 핸들러 작성
 * */

@Controller
public class WebSocketHandler extends TextWebSocketHandler {
	// 연결 요청 처리
		// 메시지 받기, 메시지 전달
	// WebSoketSession 클라이언트 당 하나씩 생성, 해당 클라이언트와 연결된 웹소켓을 이용할 수 있는 객체
	// 해당 객체를 통해 메시지를 주고받음
	
	// {채팅방1 = {유저1 = 세션값, 유저2 = 세션값}}
	private Map<String, Map<String, WebSocketSession>> roomMap;
	
	
	public WebSocketHandler() {
		roomMap = new HashMap<String, Map<String, WebSocketSession>>();
	}
	
	@Override
		// 소켓 연결 생성 후 실행 메서드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("TextWebSocketHandler : 연결 생성!");
		// users.add(session);
	}

	@Override
		// 메세지 수신 후 실행 메서드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println();
		System.out.println("TextWebSocketHandler : 메시지 수신");
		// System.out.println("메시지 : " + message.getPayload());
		
		JSONObject object = new JSONObject(message.getPayload());
		String type = object.getString("type");
		
		if(type != null && type.equals("register")) {
			// 등록 요청 메시지
			String roomNo = object.getString("roomNo");
			String memId = object.getString("memId");
			
			Map<String, WebSocketSession> currentRoom = roomMap.get(roomNo);
			
			// 방이 없을 경우
			if(currentRoom == null) currentRoom = new HashMap<String, WebSocketSession>();
			
			currentRoom.put(memId, session);
			roomMap.put(roomNo, currentRoom);
			
			for(String rooms : roomMap.keySet()) {
				if(rooms.equals(roomNo)) continue;
				
				Map<String, WebSocketSession> currentMap = roomMap.get(rooms);
				for(String id : currentMap.keySet()) {
					if(currentMap.get(id) == session) {
						roomMap.get(rooms).remove(id, session);
						break;
					}
				}
			}
			
		} else if (type != null && type.equals("chat")) {
			String roomNo = object.getString("roomNo");
			String msg =  "{\"nickName\":\""+object.getString("nickName")+"\","
						   + "\"message\":\""+object.getString("message")+"\","
						   + "\"time\":\""+object.getString("time")+"\","
						   + "\"type\":\"chat\"}";
			String target = object.getString("target");
			
			// 상대한테 보내기
			WebSocketSession ws = roomMap.get(roomNo).get(target);
			if(ws != null && ws != session) {
				ws.sendMessage(new TextMessage(msg));
			}
			
		} else if (type != null && type.equals("changeState")) {
			String roomNo = object.getString("roomNo");
			String state = "{\"state\":\""+object.getString("state")+"\","
							+ "\"type\":\"changeState\"}";
			String target = object.getString("target");
			
			// 상대한테 보내기
			WebSocketSession ws = roomMap.get(roomNo).get(target);
			if(ws != null && ws != session) {
				ws.sendMessage(new TextMessage(state));
			}
			
		} else if (type != null && type.equals("roomOut")) {
			roomOut(session);
		}
	}

	@Override
		// 연결 해제 후 실행 메서드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("TextWebSocket : 연결 종료!");
		roomOut(session);
	}
	
	// 방 나가기
	private void roomOut(WebSocketSession session) {
		for(String roomNo : roomMap.keySet()) {
			Map<String, WebSocketSession> currentMap = roomMap.get(roomNo);
			for(String memId : currentMap.keySet()) {
				if(currentMap.get(memId) == session) {
					roomMap.get(roomNo).remove(memId);
				}
			};
		};
	}
	
}
