package com.good.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.Instanceof;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.good.dto.AccountsVO;
import com.good.service.AlarmService;

public class EchoHandler extends TextWebSocketHandler {

//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, WebSocketSession> sessionList2 = new HashMap<String, WebSocketSession>();
	
	// 클라이언트와 연결후에 실행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(session.getId()+" 에 연결됨");
//		sessionList.add(session);
		
		// http session 사용 방법
		Map<String, Object> map;
		map = session.getAttributes();
		AccountsVO loginVO = (AccountsVO)map.get("login");
		System.out.println("accountId : " + loginVO.getAccountId());
		
		sessionList2.put(Integer.toString(loginVO.getAccountId()), session);
		
		for(String key : sessionList2.keySet()) {
			WebSocketSession sess = sessionList2.get(key);
			System.out.println(key + " : " + sess.getId() + " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		}
		
		
		int sessionCnt = sessionList2.size();
//		for (WebSocketSession sess : sessionList) {
//			sess.sendMessage(new TextMessage("sessionCnt" + "|" + sessionCnt));
//		}
		for(String key : sessionList2.keySet()) {
			WebSocketSession sess = sessionList2.get(key);
			sess.sendMessage(new TextMessage("sessionCnt" + "|" + sessionCnt));
		}

	}

	
	@Inject
	AlarmService dao;
	// 클라이언트가 서버로 메시지를 전송했을때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, @RequestBody TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("handleTextmessage 진입");
		System.out.println("메세지를 보낸 클라이언트 세션 : "+ session.getId());
		System.out.println("보낸 메세지 : "+ message.getPayload());
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject)jsonParser.parse(message.getPayload());
		System.out.println(jsonObj.get("from"));
		System.out.println(jsonObj.get("text"));

		
		if(jsonObj.get("from").equals("chat")) {
			// http session 사용 방법
			Map<String, Object> map;
			map = session.getAttributes();
			AccountsVO loginVO = (AccountsVO)map.get("login");
			System.out.println("accountId : " + loginVO.getAccountId());
			
			
//			for (WebSocketSession sess : sessionList) {
//				sess.sendMessage(new TextMessage(loginVO.getAccountId() + "|" + loginVO.getNickname() + "|" + jsonObj.get("text")));
//			}
			for(String key : sessionList2.keySet()) {
				WebSocketSession sess = sessionList2.get(key);
				sess.sendMessage(new TextMessage(loginVO.getAccountId() + "|" + loginVO.getNickname() + "|" + jsonObj.get("text")));
			}
			
			
		} else if(jsonObj.get("from").equals("followAlarm")) {
			System.out.println("팔로우 알람이요~~팔로우 알람이요~~팔로우 알람이요~~팔로우 알람이요~~팔로우 알람이요~~");
			
			Object okey = jsonObj.get("text");
			String key = okey.toString();
			System.out.println(key+"   @@@@!#!#!#@!#!@#!@#");
			WebSocketSession sess = sessionList2.get(key);
			if(sess != null) {
				
				AccountsVO vo = dao.getAccount(Integer.parseInt(key));
				sess.sendMessage(new TextMessage("followAlarm"+"|"+vo.getNickname()));
			}
			
		}
	}

	
	// 클라이언트와 연결을 끊었을때 실행되는 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
//		sessionList.remove(session);
		
		// http session 사용 방법
		Map<String, Object> map;
		map = session.getAttributes();
		AccountsVO loginVO = (AccountsVO)map.get("login");
		System.out.println("accountId : " + loginVO.getAccountId());
		
		String key = Integer.toString(loginVO.getAccountId());
		sessionList2.remove(key);
		
		
		int sessionCnt = sessionList2.size();
//		for (WebSocketSession sess : sessionList) {
//			sess.sendMessage(new TextMessage("sessionCnt" + "|" + sessionCnt));
//		}
		for(String keyset : sessionList2.keySet()) {
			WebSocketSession sess = sessionList2.get(keyset);
			sess.sendMessage(new TextMessage("sessionCnt" + "|" + sessionCnt));
		}
		
		System.out.println(session.getId()+" 연결 끊킴");
	}
	
	
}
