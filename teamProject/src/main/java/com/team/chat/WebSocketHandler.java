package com.team.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


@Controller
public class WebSocketHandler extends TextWebSocketHandler {
	// 연결 요청 처리
		// 메시지 받기, 메시지 전달
	// WebSoketSession 클라이언트 당 하나씩 생성, 해당 클라이언트와 연결된 웹소켓을 이용할 수 있는 객체
	// 해당 객체를 통해 메시지를 주고받음
	
	private List<WebSocketSession> users;
	private Map<String, Object> userMap;
	
	public WebSocketHandler() {
		users = new ArrayList<WebSocketSession>();
		userMap = new HashMap<String, Object>();
	}

	@Override
		// 소켓 연결 생성 후 실행 메서드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("TextWebSocketHandler : 연결 생성!");
		users.add(session);
	}

	@Override
		// 메세지 수신 후 실행 메서드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("TextWebSocketHandler : 메시지 수신");
		System.out.println("메시지 : " + message.getPayload());
		
		JSONObject object = new JSONObject(message.getPayload());
		String type = object.getString("type");
		
		if(type != null && type.equals("register")) {
			// 등록 요청 메시지
			String user = object.getString("userid");
			// 아이디랑 Session이랑 매핑 >> Map
			userMap.put(user, session);
		} 
		else if (type != null && type.equals("chat")) {
			// 채팅 메시지 : 상대방 아이디를 포함해서 메시지를 보낼것이기 때문에
			// Map에서 상대방 아이디에 해당하는 WebSocket 꺼내와서 메시지 전송
			String target = object.getString("target");
			WebSocketSession ws = (WebSocketSession)userMap.get(target);
			String msg = object.getString("message");
			
			System.out.println("msg : " + msg);
			
			System.out.println(ws);
			if(ws != null) {
				ws.sendMessage(new TextMessage(msg));
			}
		}
	}

	@Override
		// 연결 해제 후 실행 메서드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("TextWebSocket : 연결 종료!");
		users.remove(session);
	}
	
	
	
	
	// ================================================================================================
//	private Map<String, String> sessionMap = new HashMap<String, String>();
//	private Map<String, String> userMap = new HashMap<String, String>();
//	
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
//	private static Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
//	
//	
//	// websocket 연결 성공 시
//	@Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		String id = (String) session.getAttributes().get("MEM_ID");
//		
//		sessionList.add(session);
//		System.out.println(session.getAttributes().get("MEM_ID") + "연결됨");
//	}
//
//	// websocket 메세지 수신 및 송신
//	@Override
//	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		System.out.println(session.getAttributes().get("MEM_ID") + "로 부터 " + message.getPayload() + " 받음");
//		
//		System.out.println(session.getAttributes());
//		//{HTTP.SESSION.ID=890633AEE5E9ED8D591854F452A7966A}
//		
//		// 모든 유저에게 메세지 출력
//		for(WebSocketSession sess : sessionList) {
//			sess.sendMessage(new TextMessage(message.getPayload()));
//		}
//	}
//
//	// websocket 연결 종료 시	
//	@Override
//	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		sessionList.remove(session);
//		logger.info("{} 연결 끊김", session.getId());
//		
//	}
	
	
	
	
}
