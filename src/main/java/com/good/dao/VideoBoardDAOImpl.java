package com.good.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.VideoBoardVO;

@Repository
public class VideoBarodDAOImpl implements VideoBoardDAO {

	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.good.mapper.videoBoardMapper";

	// 게시물 목록
	@Override
	public List<VideoBoardVO> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

	@Override
	public VideoBoardVO view(int boardId) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".view",boardId);
	}
}
