package com.good.websocket;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.good.dto.AccountsVO;

public class EchoHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	// 클라이언트와 연결후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(session.getId()+" 에 연결됨");
		sessionList.add(session);
		int sessionCnt = sessionList.size();
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage("sessionCnt" + "|" + sessionCnt));
		}
	}

	
	// 클라이언트가 서버로 메시지를 전송했을때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("handleTextmessage 진입");
		System.out.println("메세지를 보낸 클라이언트 세션 : "+ session.getId());
		System.out.println("보낸 메세지 : "+ message.getPayload());

		// http session 사용 방법
		Map<String, Object> map;
		map = session.getAttributes();
		AccountsVO loginVO = (AccountsVO)map.get("login");
		System.out.println("accountId : " + loginVO.getAccountId());

		
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(loginVO.getAccountId() + "|" + loginVO.getNickname() + "|" + message.getPayload()));
		}
	}

	
	// 클라이언트와 연결을 끊었을때 실행되는 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		sessionList.remove(session);
		int sessionCnt = sessionList.size();
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage("sessionCnt" + "|" + sessionCnt));
		}
		System.out.println(session.getId()+" 연결 끊킴");
	}
	
	
}
