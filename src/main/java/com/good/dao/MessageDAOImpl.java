package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.MessageVO;
import com.good.dto.MessageList;
import com.good.dto.MessageSearch;

@Repository
public class MessageDAOImpl implements MessageDAO {

	// 주입
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.messageMapper";
	
	// 받은 메세지 목록 + 페이징 + 검색
	@Override
	public List<MessageList> receiveListAll(MessageSearch search) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".receiveListAll", search);
	}
	
	// 받은 메세지 총 갯수
	@Override
	public int getReceiveListCnt(MessageSearch search) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getReceiveListCnt", search);
	}
	
	// 보낸 메세지 목록 + 페이징 + 검색
	@Override
	public List<MessageList> sendListAll(MessageSearch search) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".sendListAll", search);
	}
	
	// 보낸 메세지 총 갯수
	@Override
	public int getSendListCnt(MessageSearch search) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getSendListCnt", search);
	}
	
	// 메세지 읽기
	@Override
	public MessageVO view(int messageId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".view", messageId);
	}
	
	// 메세지 보내기
	@Override
	public void sendMessage(MessageVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".sendMessage", vo);
	}

	// 받은 메세지 숨기기
	@Override
	public void hideReceivedMessage(List<String> list) throws Exception {
		sqlSession.update(NAMESPACE + ".hideReceivedMessage", list);
	}
	
	// 보낸 메세지 숨기기
	@Override
	public void hideSendMessage(List<String> list) throws Exception {
		sqlSession.update(NAMESPACE + ".hideSendMessage", list);
	}
}
