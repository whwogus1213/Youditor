package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.VideoStarVO;

@Repository
public class VideoStarDAOImpl implements VideoStarDAO {
	
	// 주입
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.videoStarMapper";
	
	//평점
	@Override
	public void insert(VideoStarVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
	//평점
	@Override
	public void update1(int boardId) throws Exception {
		sqlSession.update(NAMESPACE + ".update1", boardId);
	}
	//평점
	@Override
	public void update2(int boardId) throws Exception {
		sqlSession.update(NAMESPACE + ".update2", boardId);
	}
	//평점
	@Override
	public void update3(int boardId) throws Exception {
		sqlSession.update(NAMESPACE + ".update3", boardId);
	}
	//평점
	@Override
	public void update4(int boardId) throws Exception {
		sqlSession.update(NAMESPACE + ".update4", boardId);
	}
	//평점
	@Override
	public void update5(int boardId) throws Exception {
		sqlSession.update(NAMESPACE + ".update5", boardId);
	}

}