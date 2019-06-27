package com.good.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.NoticeBoardVO;
import com.good.dto.Pagination;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO {

	// 주입
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.noticeBoardMapper";

	// 게시물 목록
	@Override
	public List<NoticeBoardVO> listAll(Pagination pagination) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", pagination);
	}

	// 게시물 상세보기
	@Override
	public NoticeBoardVO view(int boardId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".view", boardId);
	}

	// 게시물 총 개수
	@Override
	public int getBoardListCnt() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getBoardListCnt");
	}

//	// 페이징
//	@Override
//	public List<NoticeBoardVO> listPage(int displayPost, int postNum) {
//		HashMap<String, Integer> myMap = new HashMap<String, Integer>();
//
//		myMap.put("displayPost", displayPost);
//		myMap.put("postNum", postNum);
//		return sqlSession.selectList(NAMESPACE + ".listPage", myMap);
//	}

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
	public void deleteNoticeBoard(int boardId) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteNoticeBoard", boardId);
	}

}
