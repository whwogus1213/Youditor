package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.ReplyVO;
import com.good.dto.VideoStarVO;

@Repository
public class VideoStarDAOImpl implements VideoStarDAO {
	
	// 주입
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.videoStarMapper";
	
	@Override
	public List<VideoStarVO> listAll(int boardId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", boardId);
	}
	
	//평점
	@Override
	public void insert(VideoStarVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
	//평점
	@Override
	public void update(VideoStarVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".update", vo);
	}
	

	@Override
	public int starload(VideoStarVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".starload", vo);

	}

}