package com.team.chat.config;

import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

public class WebSocketConfig implements WebSocketConfigurer {

	private WebSocketHandler webSocketHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		// endpoint 설정 : /api/v1/chat/{postId} <- 뭔소린지 모르겠음
		
		// 이를 통해서 ws://localhost:9090/ws/chat 으로 요청이 들어오면 websocket 통신을 진행한다
		// setAllowedOrigins("*")는 모든 ip에서 접속 가능하도록 해줌
		
		registry.addHandler(webSocketHandler, "/ws/chat").setAllowedOrigins("*");
		
	}
	

}
