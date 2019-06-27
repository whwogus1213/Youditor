package com.good.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.TipBoardVO;

@Repository
public class TipBoardDAOImpl implements TipBoardDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.tipBoardMapper";

	// 게시물 목록
	@Override
	public List<TipBoardVO> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

	// 게시물 보기
	@Override
	public TipBoardVO view(int boardId) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".view",boardId);
	}
}
