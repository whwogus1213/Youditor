package com.good.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.NoticeBoardVO;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.noticeBoardMapper";

	// 게시물 목록
	@Override
	public List<NoticeBoardVO> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

	// 게시물 보기
	@Override
	public NoticeBoardVO view(int boardId) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".view",boardId);
	}

	//글쓰기
	@Override
	public void insertNoticeBoard(NoticeBoardVO vo) throws Exception{
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
