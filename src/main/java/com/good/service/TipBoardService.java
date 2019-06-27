package com.good.service;

import java.util.List;
import java.util.Map;

import com.good.dto.TipBoardVO;

public interface TipBoardService {

	// 게시물 목록
	public List<TipBoardVO> listAll() throws Exception;

	// 게시물 읽기
	public TipBoardVO view(int boardId) throws Exception;
}
