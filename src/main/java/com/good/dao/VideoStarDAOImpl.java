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
	public void update1(VideoStarVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".update1", vo);
	}
	//평점
	@Override
	public void update2(VideoStarVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".update2", vo);
	}
	//평점
	@Override
	public void update3(VideoStarVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".update3", vo);
	}
	//평점
	@Override
	public void update4(VideoStarVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".update4", vo);
	}
	//평점
	@Override
	public void update5(VideoStarVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".update5", vo);
	}

}