package com.good.service;

import java.util.List;
import java.util.Map;

import com.good.dto.NoticeBoardVO;

public interface NoticeBoardService {

	// 게시물 목록
	public List<NoticeBoardVO> listAll() throws Exception;

	public NoticeBoardVO view(int boardId) throws Exception;
}
