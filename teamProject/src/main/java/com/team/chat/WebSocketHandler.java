package com.team.chat;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Controller
public class WebSocketHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private static Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
	int room = 1;
	
	// websocket 연결 성공 시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info("{} 연결됨", session.getId());
	}

	// websocket 메세지 수신 및 송신
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		System.out.println(session.getAttributes());
		System.out.println(session.getHandshakeHeaders());
		//{HTTP.SESSION.ID=890633AEE5E9ED8D591854F452A7966A}
		//{host=[localhost:8080], connection=[Upgrade], pragma=[no-cache], cache-control=[no-cache], user-agent=[Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36], upgrade=[websocket], origin=[http://localhost:8080], sec-websocket-version=[13], accept-encoding=[gzip, deflate, br, zstd], accept-language=[ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7], cookie=[JSESSIONID=890633AEE5E9ED8D591854F452A7966A; G_ENABLED_IDPS=google; g_state={"i_l":0}], sec-websocket-key=[wEc06W2115HmF4CbbkihCw==], sec-websocket-extensions=[permessage-deflate; client_max_window_bits]}
		
		// 모든 유저에게 메세지 출력
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
	}

	// websocket 연결 종료 시	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info("{} 연결 끊김", session.getId());
		
	}
	
	
	
	
}
