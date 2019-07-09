package com.good.dao;

import java.util.List;

import com.good.dto.VideoStarVO;

public interface VideoStarDAO {

	// 게시물 목록
	public List<VideoStarVO> listAll(int boardId) throws Exception;
	//평점
	public void insert(VideoStarVO vo) throws Exception;
	
	//평점 업데이트
	public void update(VideoStarVO vo) throws Exception;

	public int starload(VideoStarVO vo) throws Exception;
	// 평점 체크
	public int starCheck(int accountId, int boardId)  throws Exception;
}
