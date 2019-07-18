package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.Search;
import com.good.dto.TipBoardVO;

@Repository
public class TipBoardDAOImpl implements TipBoardDAO {

	// 주입
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.tipBoardMapper";

	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<TipBoardVO> listAll(Search search) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", search);
	}

	// 게시물 상세보기
	@Override
	public TipBoardVO view(int boardId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".view", boardId);
	}

	// 게시물 총 개수
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getBoardListCnt", search);
	}

	// 글쓰기
	@Override
	public void insertTipBoard(TipBoardVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertTipBoard", vo);
	}

	// 수정
	@Override
	public void updateTipBoard(TipBoardVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateTipBoard", vo);
	}

	// 삭제
	@Override
	public void deleteTipBoard(TipBoardVO vo) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteTipBoard", vo);
	}
	
	//조회수
	@Override
	public void viewCount(int boardId) throws Exception {
		sqlSession.update(NAMESPACE + ".viewCount", boardId);
	}

	@Override
	public List<TipBoardVO> newList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".newList");
	}

}
