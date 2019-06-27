package com.good.dao;

import java.util.List;

import com.good.dto.TipBoardVO;

public interface TipBoardDAO {
	// 게시물 목록
	public List<TipBoardVO> listAll() throws Exception;

	public TipBoardVO view(int boardId) throws Exception;
}
