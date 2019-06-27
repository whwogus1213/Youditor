package com.good.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.VideoBoardVO;

@Repository
public class VideoBoardDAOImpl implements VideoBoardDAO {


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
	//글쓰기
	@Override 
	public void insertVideoBoard(VideoBoardVO vo) throws Exception{
		sqlSession.insert(NAMESPACE + ".insertVideoBoard", vo);
	}
		
	 // 수정
	 @Override
	 public void updateVideoBoard(VideoBoardVO vo) throws Exception {
		 sqlSession.update(NAMESPACE + ".updateVideoBoard", vo);
	 }

	 // 삭제
	 @Override
	 public void deleteVideoBoard(int boardId) throws Exception {
		 sqlSession.delete(NAMESPACE + ".deleteVideoBoard", boardId);
	 }
}
