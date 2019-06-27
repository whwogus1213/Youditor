package com.good.dao;

import java.util.List;

import com.good.dto.RecruitBoardVO;

public interface RecruitBoardDAO {
	// 게시물 목록
	public List<RecruitBoardVO> listAll() throws Exception;

	public RecruitBoardVO view(int boardId) throws Exception;
}
