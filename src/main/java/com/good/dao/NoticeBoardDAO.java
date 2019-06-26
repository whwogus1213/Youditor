package com.good.dao;

import java.util.List;

import com.good.dto.NoticeBoardVO;

public interface NoticeBoardDAO {
	// 게시물 목록
	public List<NoticeBoardVO> listAll() throws Exception;

	public NoticeBoardVO view(int boardId) throws Exception;
}
