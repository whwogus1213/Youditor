package com.good.dao;

import java.util.HashMap;
import java.util.List;

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
	
	// 게시물 상세보기
	@Override
	public NoticeBoardVO view(int boardId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".view", boardId);
	}
	
	// 게시물 총 개수
	@Override
	public int count() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".count");
	}
	
	// 페이징
	@Override
	public List<NoticeBoardVO> listPage(int displayPost, int postNum) {
		HashMap<String, Integer> myMap = new HashMap<String, Integer>();
		
		myMap.put("displayPost", displayPost);
		myMap.put("postNum", postNum);
						
		return sqlSession.selectList(NAMESPACE + ".listPage", myMap);
	}
}
