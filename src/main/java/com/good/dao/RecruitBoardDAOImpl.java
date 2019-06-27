package com.good.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.RecruitBoardVO;

@Repository
public class RecruitBoardDAOImpl implements RecruitBoardDAO {

	// 주입
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
		return sqlSession.selectOne(NAMESPACE + ".view", boardId);
	}

	// 글쓰기
	@Override
	public void insertRecruitBoard(RecruitBoardVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertRecruitBoard", vo);
	}

	// 수정
	@Override
	public void updateRecruitBoard(RecruitBoardVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateRecruitBoard", vo);
	}

	// 삭제
	@Override
	public void deleteRecruitBoard(int boardId) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteRecruitBoard", boardId);
	}

}
