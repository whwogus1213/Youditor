package com.good.service;

import java.util.List;
import java.util.Map;

import com.good.dto.VideoBoardVO;

public interface VideoBoardService {
	
	// 게시물 목록
	public List<VideoBoardVO> listAll() throws Exception;
	
	public VideoBoardVO view(int boardId) throws Exception;
}
