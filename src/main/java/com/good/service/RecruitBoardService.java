package com.good.service;

import java.util.List;
import java.util.Map;

import com.good.dto.RecruitBoardVO;

public interface RecruitBoardService {

	// 게시물 목록
	public List<RecruitBoardVO> listAll() throws Exception;

	public RecruitBoardVO view(int boardId) throws Exception;
}
