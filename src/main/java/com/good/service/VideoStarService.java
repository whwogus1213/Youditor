package com.good.service;

import java.util.List;
import java.util.Map;

import com.good.dto.ReplyVO;
import com.good.dto.VideoStarVO;

public interface VideoStarService {

	// 게시물 목록
	public List<VideoStarVO> listAll(int boardId) throws Exception;
	//평점
	public void insert(VideoStarVO vo) throws Exception;

	//평점 업데이트
	public void update(VideoStarVO vo) throws Exception;

	public int starload(VideoStarVO vo) throws Exception;

	public int starSum(VideoStarVO vo) throws Exception;
	
	// 평점 체크
	public int starCheck(int accountId, int boardId)  throws Exception;
}
