package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.MessageDAO;
import com.good.dto.MessageVO;
import com.good.dto.MessageList;
import com.good.dto.MessageSearch;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Inject
	MessageDAO dao;
	
	// 받은 메세지 목록 + 페이징 + 검색
	@Override
	public List<MessageList> receiveListAll(MessageSearch search) throws Exception {
		return dao.receiveListAll(search);
	}
	
	// 받은 메세지 총 갯수
	@Override
	public int getReceiveListCnt(MessageSearch search) throws Exception {
		return dao.getReceiveListCnt(search);
	}
	
	// 보낸 메세지 목록 + 페이징 + 검색
	@Override
	public List<MessageList> sendListAll(MessageSearch search) throws Exception {
		return dao.sendListAll(search);
	}
	
	// 보낸 메세지 총 갯수
	@Override
	public int getSendListCnt(MessageSearch search) throws Exception {
		return dao.getSendListCnt(search);
	}
	
	// 받은 메세지 읽기
	@Override
	public MessageList receiveMessageView(int messageId) throws Exception {
		return dao.receiveMessageView(messageId);
	}
	
	// 받은 메세지를 처음 읽었을 경우 read_date에 읽은 날짜를 update해준다.
	@Override
	public void updateReadDate(int messageId) throws Exception {
		dao.updateReadDate(messageId);
	}
	
	// 보낸 메세지 읽기
	@Override
	public MessageList sendMessageView(int messageId) throws Exception {
		return dao.sendMessageView(messageId);
	}
	
	// 메세지 보내기
	@Override
	public void sendMessage(MessageVO vo) throws Exception {
		dao.sendMessage(vo);
	}
	
	// 받은 메세지 안보기
	@Override
	public void hideReceivedMessage(List<String> list) throws Exception {
		dao.hideReceivedMessage(list);
	}
	
	// 보낸 메세지 안보기
	@Override
	public void hideSendMessage(List<String> list) throws Exception {
		dao.hideSendMessage(list);
	}
}
