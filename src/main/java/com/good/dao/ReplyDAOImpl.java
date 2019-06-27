package com.good.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.ReplyVO;
import com.good.dto.VideoBoardVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.replyMapper";

	@Override
	public List<ReplyVO> listAll(int boardId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", boardId);
	}

	@Override
	public void insert(ReplyVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insert", vo);
	}

}
