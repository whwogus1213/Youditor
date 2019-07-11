package com.good.service;

import java.util.List;

import com.good.dto.MessageVO;
import com.good.dto.MessageList;
import com.good.dto.MessageSearch;

public interface MessageService {
	
	// 받은 메세지 목록 + 페이징 + 검색
	public List<MessageList> receiveListAll(MessageSearch search) throws Exception;
	
	// 받은 메세지 총 갯수
	public int getReceiveListCnt(MessageSearch search) throws Exception;
	
	// 보낸 메세지 목록 + 페이징 + 검색
	public List<MessageList> sendListAll(MessageSearch search) throws Exception;
	
	// 보낸 메세지 총 갯수
	public int getSendListCnt(MessageSearch search) throws Exception;
	
	// 메세지 읽기
	public MessageVO view(int messageId) throws Exception;
	
	// 메세지 보내기
	public void sendMessage(MessageVO vo) throws Exception;
	
	// 받은 메세지 안보기
	public void hideReceivedMessage(List<String> list) throws Exception;
	
	// 보낸 메세지 안보기
	public void hideSendMessage(List<String> list) throws Exception;
}
