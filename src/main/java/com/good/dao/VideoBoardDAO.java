package com.good.dao;

import java.util.List;

import com.good.dto.VideoBoardVO;

public interface VideoBoardDAO {
	
	// 게시물 목록
	public List<VideoBoardVO> listAll() throws Exception;


}
