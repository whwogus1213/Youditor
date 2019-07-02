package com.good.websocket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 맵쓸떄 사용
		// sessions.put(session.getId(), session);
		// List쓸때 사용
		sessionList.add(session);
		//세션값을 불러온
		//0번째 중괄호에 session.getId()를 넣으라는 뜻
//		logger.info("{} 연결됨",session.getId());
		System.out.println(session.getId()+" 에 연결됨");
		
		//Session값을 가지고 데이터베이스등의 작업을 하면 채팅 참여 사용자 정보를 얻을수 있다.
		System.out.println("채팅방 입장자 : "+session.getPrincipal().getName());
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getPrincipal().getName()+"|"+message.getPayload()));
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		
		System.out.println(session.getId()+" 연결 끊킴");
		System.out.println("채팅방 퇴장자 : " + session.getPrincipal().getName());
	}
	
	
}
