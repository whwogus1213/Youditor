package com.good.dao;

import java.util.List;

import com.good.dto.ReplyVO;

public interface ReplyDAO {
	
	public List<ReplyVO> listAll() throws Exception;

	public void insert(ReplyVO vo) throws Exception;
	
}
