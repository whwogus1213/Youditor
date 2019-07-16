package com.good.dao;

import java.util.List;

import com.good.dto.MessageVO;
import com.good.dto.MessageList;
import com.good.dto.MessageSearch;

public interface MessageDAO {
	
	// 받은 메세지 목록 + 페이징 + 검색
	public List<MessageList> receiveListAll(MessageSearch search) throws Exception;
	
	// 받은 메세지 총 갯수
	public int getReceiveListCnt(MessageSearch search) throws Exception;
	
	// 보낸 메세지 목록 + 페이징 + 검색
	public List<MessageList> sendListAll(MessageSearch search) throws Exception;
	
	// 보낸 메세지 총 갯수
	public int getSendListCnt(MessageSearch search) throws Exception;
	
	// 받은 메세지 읽기
	public MessageList receiveMessageView(int messageId) throws Exception;
	
	// 받은 메세지를 처음 읽었을 경우 read_date에 읽은 날짜를 update해준다.
	public void updateReadDate(int messageId) throws Exception;
	
	// 보낸 메세지 읽기
	public MessageList sendMessageView(int messageId) throws Exception;

	// 답장시 답장보낼 메세지의 정보 취득
	public MessageList getReplyInfo(int messageId) throws Exception;
	
	// 존재하는 닉네임인지 확인
	public int checkNickname(String nickname) throws Exception;
	
	// 닉네임으로 회원번호 취득
	public int getAccountIdByNickname(String nickname) throws Exception;
	
	// 메세지 보내기
	public void sendMessage(MessageVO vo) throws Exception;

	// 받은 메세지 숨기기
	public void hideReceivedMessage(int mId) throws Exception;
	
	// 보낸 메세지 굼기기
	public void hideSendMessage(int mId) throws Exception;
}
