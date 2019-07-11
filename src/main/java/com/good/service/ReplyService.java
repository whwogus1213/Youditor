package com.good.service;

import java.util.List;
import java.util.Map;

import com.good.dto.ReplyVO;
import com.good.dto.VideoBoardVO;

public interface ReplyService {

	// 게시물 목록
	public List<ReplyVO> listAll(ReplyVO vo) throws Exception;
	public List<ReplyVO> reList(ReplyVO vo) throws Exception;

	public void insert(ReplyVO vo) throws Exception;
	public void reInsert(ReplyVO vo) throws Exception;
	public int isReReply(ReplyVO vo) throws Exception;

	public void delete(ReplyVO vo) throws Exception;

	public void update(ReplyVO vo) throws Exception;
}
