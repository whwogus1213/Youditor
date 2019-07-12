package com.good.dao;

import java.util.List;

import com.good.dto.TipStarVO;

public interface TipStarDAO {

	// 게시물 목록
	public List<TipStarVO> listAll() throws Exception;
	//평점
	public void insert(TipStarVO vo) throws Exception;
	
	//평점 업데이트
	public void update(TipStarVO vo) throws Exception;

	public int starload(TipStarVO vo) throws Exception;
	
	public int starSum(TipStarVO vo) throws Exception;
	// 평점 체크
	public int starCheck(int accountId, int boardId)  throws Exception;
	
}