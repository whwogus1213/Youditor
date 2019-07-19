package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.NoticeBoardVO;
import com.good.dto.Search;
import com.good.dto.SearchBoard;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO {

	// 주입
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.noticeBoardMapper";

	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<NoticeBoardVO> listAll(SearchBoard search) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", search);
	}

	// 게시물 상세보기
	@Override
	public NoticeBoardVO view(int boardId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".view", boardId);
	}

	// 게시물 총 개수
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getBoardListCnt", search);
	}

	// 글쓰기
	@Override
	public void insertNoticeBoard(NoticeBoardVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertNoticeBoard", vo);
	}

	// 수정
	@Override
	public void updateNoticeBoard(NoticeBoardVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateNoticeBoard", vo);
	}

	// 삭제
	@Override
	public void deleteNoticeBoard(NoticeBoardVO vo) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteNoticeBoard", vo);
	}
	
	//조회수
	@Override
	public void viewCount(int boardId) throws Exception {
		sqlSession.update(NAMESPACE + ".viewCount", boardId);
	}

	@Override
	public List<NoticeBoardVO> rankList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".rankList");
	}
	
	

}
