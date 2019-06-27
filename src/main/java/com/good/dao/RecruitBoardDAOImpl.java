package com.good.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.RecruitBoardVO;

@Repository
public class RecruitBoardDAOImpl implements RecruitBoardDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.recruitBoardMapper";

	// 게시물 목록
	@Override
	public List<RecruitBoardVO> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

	// 게시물 보기
	@Override
	public RecruitBoardVO view(int boardId) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".view",boardId);
	}
}
